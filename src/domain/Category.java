package domain;

import java.util.ArrayList;
import java.util.List;

public class Category {
    private CategoryType categoryType;
    private List<ProductType> products;

    public Category() {
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
