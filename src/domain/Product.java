package domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/*商品大类*/
public class Product implements Serializable {
    private ProductType productType;
    private int ProductNumber = 0;
    private final List<Item> items = new ArrayList<Item>();

    public Product() {
    }

    // 初始化
    public Product(ProductType productType) {
        this.productType = productType;
    }

    public String getProductName() {
        return productType.getDescription();
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    public int getProductNumber() {
        return ProductNumber;
    }

    public List<Item> getItems() {
        return items;
    }

    public void addProduct(Item item) {
        items.add(item);
        ProductNumber++;
    }

    public void deleteProduct(Item item) {
        items.remove(item);
        ProductNumber--;
    }
}
