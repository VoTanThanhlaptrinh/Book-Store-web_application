package models;

import java.util.List;

public class SearchResult {
    private List<FilterProduct> products;
    private long totalHits;

    public SearchResult(List<FilterProduct> products, long totalHits) {
        this.products = products;
        this.totalHits = totalHits;
    }

    public List<FilterProduct> getProducts() {
        return products;
    }

    public long getTotalHits() {
        return totalHits;
    }
}