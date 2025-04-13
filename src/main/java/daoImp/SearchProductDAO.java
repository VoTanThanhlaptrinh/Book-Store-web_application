package daoImp;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch.core.SearchResponse;

import models.FilterProduct;
import co.elastic.clients.elasticsearch._types.query_dsl.Query;
import co.elastic.clients.elasticsearch._types.query_dsl.BoolQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.MatchQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.NumberRangeQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.RangeQuery;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SearchProductDAO {

    private ElasticsearchClient client;

    public SearchProductDAO(ElasticsearchClient client) {
        this.client = client;
    }
    public void createProductsIndexIfNotExists() {
        try {
            boolean exists = client.indices().exists(e -> e.index("products")).value();
            if (!exists) {
                client.indices().create(c -> c
                    .index("products")
                    .mappings(m -> m
                        .properties("title", p -> p.text(t -> t))
                        .properties("category_id", p -> p.integer(i -> i))
                        .properties("category_parent_id", p -> p.integer(i -> i))
                        .properties("price", p -> p.double_(d -> d))
                    )
                );
                FilterProduct product = new FilterProduct();
                product.setTitle("Laptop Dell XPS");
                product.setCategory_id(1);
                product.setCategory_parent_id(10);
                product.setPrice(25000000.0);

                client.index(i -> i
                    .index("products")
                    .id("1")
                    .document(product)
                );
                System.out.println("Đã index sản phẩm mẫu.");
                System.out.println("Đã tạo index 'products'");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public List<FilterProduct> getSearchProducts(int limit, int offset, Integer categoryId, Integer categoryParentId, Double minPrice, Double maxPrice, String searchKeyword) {
        List<FilterProduct> products = new ArrayList<>();
        try {
            // Bắt đầu xây dựng query
            BoolQuery.Builder boolQueryBuilder = new BoolQuery.Builder();

            // Tìm kiếm theo từ khóa
            if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                MatchQuery matchQuery = MatchQuery.of(m -> m
                    .field("title")
                    .query(searchKeyword.trim())
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
        try {
            // Bắt đầu xây dựng query
            BoolQuery.Builder boolQueryBuilder = new BoolQuery.Builder();

            // Tìm kiếm theo từ khóa
            if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
                MatchQuery matchQuery = MatchQuery.of(m -> m
                    .field("title")
                    .query(searchKeyword.trim())
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

            // Đếm tổng số sản phẩm
            SearchResponse<FilterProduct> response = client.search(s -> s
                .index("products")
                .query(q -> q.bool(boolQueryBuilder.build()))
                .size(0), // Không cần lấy dữ liệu, chỉ đếm
                FilterProduct.class
            );

            total = (int) response.hits().total().value();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return total;
    }
}
