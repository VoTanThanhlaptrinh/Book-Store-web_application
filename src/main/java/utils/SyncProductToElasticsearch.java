package utils;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch.core.IndexResponse;
import models.FilterProduct;

public class SyncProductToElasticsearch {

    public static void syncProduct(ElasticsearchClient client, FilterProduct product) {
        try {
            IndexResponse response = client.index(i -> i
                .index("products") // Chỉ mục trong Elasticsearch
                .id(String.valueOf(product.getProductId())) // ID duy nhất của tài liệu
                .document(product) // Dữ liệu sản phẩm
            );
            System.out.println("Synced product with ID: " + response.id());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}