package domain;

import java.util.ArrayList;
import java.util.List;

/*商品大类*/
public class Category {
    private CategoryType categoryType;
    private int categoryNumber = 0;
    private final List<Product> products = new ArrayList<Product>();

    public Category() {
    }

    // 初始化
    public Category(CategoryType categoryType) {
        this.categoryType = categoryType;
    }

    public String getCategoryName() {
        return categoryType.getDescription();
    }

    public void setCategoryName(CategoryType categoryType) {
        this.categoryType = categoryType;
    }

    public int getCategoryNumber() {
        return categoryNumber;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void addProduct(Product product) {
        products.add(product);
        categoryNumber++;
    }

    public void deleteProduct(Product product) {
        products.remove(product);
        categoryNumber--;
    }
}
