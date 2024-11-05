package domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Category implements Serializable {
    private CategoryType categoryType;
    private List<ProductType> products;

    public Category() {
    }

    public CategoryType getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(CategoryType categoryType) {
        this.categoryType = categoryType;
    }

    public List<ProductType> getProducts() {
        return products;
    }

    public void setProducts(List<ProductType> products) {
        this.products = products;
    }

    public Category(CategoryType categoryType) {
        this.categoryType = categoryType;

        products = CategoryType.getContainingProductTypes(categoryType);
    }

    public List<ProductType> getItems() {
        return products;
    }

    public String getCategoryName() {
        return categoryType.getDescription();
    }

    public void addProductType(ProductType productType) {
        products.add(productType);
    }

    public void deleteProductType(ProductType productType) {
        products.remove(productType);
    }
}
