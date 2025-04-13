package utils;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.json.jackson.JacksonJsonpMapper;
import co.elastic.clients.transport.ElasticsearchTransport;
import co.elastic.clients.transport.rest_client.RestClientTransport;
import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;

public class ElasticsearchConfig {

    private static ElasticsearchClient client;

    public ElasticsearchConfig() {
    	
    }
    
    public static ElasticsearchClient getClient() {
        if (client == null) {
            // Tạo kết nối đến Elasticsearch
            RestClient restClient = RestClient.builder(
                    new HttpHost("localhost", 9200) // Thay đổi host và port nếu cần
            ).build();

            // Tạo transport layer
            ElasticsearchTransport transport = new RestClientTransport(
                    restClient, new JacksonJsonpMapper()
            );

            // Tạo Elasticsearch client
            client = new ElasticsearchClient(transport);
        }
        return client;
    }

    public static void closeClient() {
        if (client != null) {
            try {
                client._transport().close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}