package controller.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Product;

public class ProductCache {
    private static List<Product> cachedProducts = new ArrayList<>();

    public static void loadAllProducts(Connection conn) throws SQLException {
        cachedProducts.clear();

        String sql = "SELECT product_id, img_id, title, price, product_name_unsigned FROM PRODUCT_1";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setImgId(Integer.parseInt(rs.getString("img_id")) );
                product.setTitle(rs.getString("title"));
                product.setPrice(rs.getDouble("price"));
                product.setUnsignedTitle(rs.getString("product_name_unsigned"));
                cachedProducts.add(product);
            }
        }
    }

    public static List<Product> getCachedProducts() {
        return cachedProducts;
    }
}
