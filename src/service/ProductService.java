package service;

import domain.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*初始化商品信息*/
public class ProductService {

    public List<Category> getCategories() {
        List<Category> categories = new ArrayList<>();

        for (int i = 0; i < CategoryType.values().length; i++) {
            Category category = new Category(CategoryType.values()[i]);
            categories.add(category);
        }

        return categories;
    }

    public List<Product> getProducts() {
        List<Product> products = new ArrayList<>();
        CatalogService catalogService = new CatalogService();
        // 创建产品
        for (int i = 0; i < ProductType.values().length; i++) {
            ProductType productType = ProductType.values()[i];
            Product product = new Product(productType);

            // 后期替换成数据库
            try {
                product.setItems(catalogService.getItemListByProduct(i + 1));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            products.add(product);
        }

        return products;
    }
}

