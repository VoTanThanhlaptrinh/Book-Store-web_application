package utils;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch.core.IndexRequest;
import co.elastic.clients.elasticsearch.core.IndexResponse;
import co.elastic.clients.transport.rest_client.RestClientTransport;
import models.FilterProduct;
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

        // Kết nối SQL Server
        String jdbcUrl = "jdbc:sqlserver://localhost:1433;databaseName=YOUR_DB_NAME";
        String username = "YOUR_USERNAME";
        String password = "YOUR_PASSWORD";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password)) {
            String sql = "SELECT id, title, category_id, category_parent_id, price FROM products";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                FilterProduct product = new FilterProduct();
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));
                product.setCategory_id(rs.getInt("category_id"));
                product.setCategory_parent_id(rs.getInt("category_parent_id"));
                product.setPrice(rs.getDouble("price"));

                // Gửi lên Elasticsearch
                IndexResponse response = esClient.index(IndexRequest.of(i -> i
                        .index("products")
                        .id(String.valueOf(product.getId()))
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
