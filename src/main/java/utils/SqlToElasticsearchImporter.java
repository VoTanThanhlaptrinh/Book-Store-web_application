package utils;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch.core.IndexRequest;
import co.elastic.clients.elasticsearch.core.IndexResponse;
import co.elastic.clients.transport.rest_client.RestClientTransport;
import models.FilterProduct;
import service.DatabaseConnection;
import co.elastic.clients.json.jackson.JacksonJsonpMapper;
import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;

import java.sql.*;
import java.util.Properties;

public class SqlToElasticsearchImporter {

    public static void main(String[] args) {
        // Kết nối Elasticsearch
        RestClient restClient = RestClient.builder(
                new HttpHost("localhost", 9200)).build();
        ElasticsearchClient esClient = new ElasticsearchClient(
                new RestClientTransport(restClient, new JacksonJsonpMapper())
        );

       
        try (Connection conn = DatabaseConnection.getConnection()) {
        	String sql = "SELECT product_id, title FROM Product_1";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                FilterProduct product = new FilterProduct();
                product.setProductId(rs.getInt("product_id"));
                product.setTitle(rs.getString("title"));
            
                // Gửi lên Elasticsearch
                IndexResponse response = esClient.index(IndexRequest.of(i -> i
                        .index("products")
                        .id(String.valueOf(product.getProductId()))
                        .document(product)
                ));

                System.out.println("Indexed product ID: " + response.id());
            }

            System.out.println("✅ Import thành công!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
