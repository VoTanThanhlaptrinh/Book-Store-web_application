package daoImp;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch.core.SearchResponse;
import co.elastic.clients.elasticsearch.core.search.Hit;
import models.FilterProduct;
import service.DatabaseConnection;
import co.elastic.clients.elasticsearch._types.query_dsl.Query;
import co.elastic.clients.elasticsearch._types.query_dsl.BoolQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.MatchQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.NumberRangeQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.RangeQuery;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class SearchProductDAO {

    private ElasticsearchClient client;

    public SearchProductDAO(ElasticsearchClient client) {
        this.client = client;
    }
  
    public List<FilterProduct> getSearchProducts(int limit, int offset, Integer categoryId, Integer categoryParentId, Double minPrice, Double maxPrice, String searchKeyword) {
        List<FilterProduct> products = new ArrayList<>();
        try {
            // Bắt đầu xây dựng query
            BoolQuery.Builder boolQueryBuilder = new BoolQuery.Builder();

            // Tìm kiếm theo từ khóa (có thể sai chính tả, không dấu, thiếu chữ...)
            if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                MatchQuery matchQuery = MatchQuery.of(m -> m
                    .field("title")
                    .query(searchKeyword.trim())  // Tìm kiếm từ khóa không dấu
                    .fuzziness("AUTO")  // Tìm kiếm với fuzziness để xử lý sai chính tả
                );
                boolQueryBuilder.must(matchQuery._toQuery());
            }

            // Lọc theo categoryId
            if (categoryId != null) {
                boolQueryBuilder.must(Query.of(q -> q
                    .term(t -> t
                        .field("category_id")
                        .value(categoryId)
                    )
                ));
            }

            // Lọc theo categoryParentId
            if (categoryParentId != null) {
                boolQueryBuilder.must(Query.of(q -> q
                    .term(t -> t
                        .field("category_parent_id")
                        .value(categoryParentId)
                    )
                ));
            }

            // Lọc theo giá tiền
            if (minPrice != null || maxPrice != null) {
                NumberRangeQuery priceRange = NumberRangeQuery.of(nr -> nr
                    .gte(minPrice)
                    .lte(maxPrice)
                );

                Query priceQuery = Query.of(q -> q
                    .range(r -> r
                        .number(priceRange)
                    )
                );

                boolQueryBuilder.must(priceQuery);
            }

            // Thực hiện tìm kiếm
            SearchResponse<FilterProduct> response = client.search(s -> s
                .index("products")
                .query(q -> q.bool(boolQueryBuilder.build()))
                .from(offset)
                .size(limit),
                FilterProduct.class
            );

            // Lấy kết quả
            response.hits().hits().forEach(hit -> products.add(hit.source()));

        } catch (IOException e) {
            e.printStackTrace();
        }
        return products;
    }

    public int getTotalSearchProducts(Integer categoryId, Integer categoryParentId, Double minPrice, Double maxPrice, String searchKeyword) {
        int total = 0;
        Connection con = null;

        try {
            // 1. Tìm product_id bằng Elasticsearch dựa vào searchKeyword
            List<Integer> matchedIds = new ArrayList<>();
            // Bắt đầu xây dựng query
            BoolQuery.Builder boolQueryBuilder = new BoolQuery.Builder();

            // Tìm kiếm theo từ khóa (có thể sai chính tả, không dấu, thiếu chữ...)
            if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                MatchQuery matchQuery = MatchQuery.of(m -> m
                    .field("title")
                    .query(searchKeyword.trim())  // Tìm kiếm từ khóa không dấu
                    .fuzziness("AUTO")  // Tìm kiếm với fuzziness để xử lý sai chính tả
                );
                boolQueryBuilder.must(matchQuery._toQuery());
            }

            // 2. Đếm số lượng sản phẩm khớp bằng SQL
            StringBuilder queryBuilder = new StringBuilder();
            queryBuilder.append("SELECT COUNT(*) FROM Product_1 p WHERE 1=1 ");

            if (!matchedIds.isEmpty()) {
                String inClause = matchedIds.stream().map(id -> "?").collect(Collectors.joining(","));
                queryBuilder.append(" AND p.product_id IN (" + inClause + ") ");
            }

            if (categoryId != null) {
                queryBuilder.append(" AND p.category_id = ? ");
            }

            if (categoryParentId != null) {
                queryBuilder.append(" AND p.category_parent_id = ? ");
            }

            if (minPrice != null && maxPrice != null) {
                queryBuilder.append(" AND p.price BETWEEN ? AND ? ");
            } else if (minPrice != null) {
                queryBuilder.append(" AND p.price >= ? ");
            } else if (maxPrice != null) {
                queryBuilder.append(" AND p.price <= ? ");
            }

            con = DatabaseConnection.getConnection();
            PreparedStatement statement = con.prepareStatement(queryBuilder.toString());

            int paramIndex = 1;

            for (Integer id : matchedIds) {
                statement.setInt(paramIndex++, id);
            }

            if (categoryId != null) {
                statement.setInt(paramIndex++, categoryId);
            }
            if (categoryParentId != null) {
                statement.setInt(paramIndex++, categoryParentId);
            }
            if (minPrice != null && maxPrice != null) {
                statement.setDouble(paramIndex++, minPrice);
                statement.setDouble(paramIndex++, maxPrice);
            } else if (minPrice != null) {
                statement.setDouble(paramIndex++, minPrice);
            } else if (maxPrice != null) {
                statement.setDouble(paramIndex++, maxPrice);
            }

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }

            rs.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return total;
    }

}
