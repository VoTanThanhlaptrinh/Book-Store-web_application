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
        Connection con = null;

        try {
            // 1. Tìm product_id bằng Elasticsearch dựa vào searchKeyword
            List<Integer> matchedIds = new ArrayList<>();
            if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                SearchResponse<FilterProduct> response = client.search(s -> s
                        .index("products")
                        .query(q -> q.match(m -> m
                            .field("title")
                            .query(searchKeyword.trim())
                        ))
                        .size(1000), // lấy tối đa 1000 kết quả để lọc tiếp
                    FilterProduct.class
                );

                for (Hit<FilterProduct> hit : response.hits().hits()) {
                    FilterProduct product = hit.source();
                    if (product != null) {
                        matchedIds.add(product.getProductId());
                    }
                }

                // Nếu không có sản phẩm nào khớp, trả về danh sách trống
                if (matchedIds.isEmpty()) {
                    return products;
                }
            }

            // 2. Dùng SQL để lọc thêm các điều kiện còn lại
            StringBuilder queryBuilder = new StringBuilder();
            queryBuilder.append("SELECT p.product_id, p.img_id, p.title, p.price ");
            queryBuilder.append("FROM Product_1 p ");
            queryBuilder.append("WHERE 1=1 ");

            if (!matchedIds.isEmpty()) {
                // Tạo chuỗi IN (?, ?, ?, ...)
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

            queryBuilder.append("ORDER BY p.product_id ");
            queryBuilder.append("OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

            con = DatabaseConnection.getConnection();
            PreparedStatement statement = con.prepareStatement(queryBuilder.toString());

            int paramIndex = 1;

            // Set danh sách ID từ elastic
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

            statement.setInt(paramIndex++, offset);
            statement.setInt(paramIndex++, limit);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                FilterProduct product = new FilterProduct();
                product.setProductId(resultSet.getInt("product_id"));
                product.setImgId(resultSet.getString("img_id"));
                product.setTitle(resultSet.getString("title"));
                product.setPrice(resultSet.getDouble("price"));
                products.add(product);
            }

            resultSet.close();
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

        return products;
    }
    public int getTotalSearchProducts(Integer categoryId, Integer categoryParentId, Double minPrice, Double maxPrice, String searchKeyword) {
        int total = 0;
        Connection con = null;

        try {
            // 1. Tìm product_id bằng Elasticsearch dựa vào searchKeyword
            List<Integer> matchedIds = new ArrayList<>();
            if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                SearchResponse<FilterProduct> response = client.search(s -> s
                        .index("products")
                        .query(q -> q.match(m -> m
                            .field("title")
                            .query(searchKeyword.trim())
                        ))
                        .size(1000), // Lấy tối đa 1000 ID để lọc tiếp
                    FilterProduct.class
                );

                for (Hit<FilterProduct> hit : response.hits().hits()) {
                    FilterProduct product = hit.source();
                    if (product != null) {
                        matchedIds.add(product.getProductId());
                    }
                }

                if (matchedIds.isEmpty()) {
                    return 0;
                }
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
