package service;

import domain.*;

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
        // 创建产品
        for (int i = 0; i < ProductType.values().length; i++) {
            ProductType productType = ProductType.values()[i];
            Product product = new Product(productType);

            // 后期替换成数据库
            product.addProduct(new Item(1 + (i + 1) * 100 + 10000, "奶龙唐唐表情包", productType, "./static/images/Products/biaoqingbao/tangtang.gif", 0));
            product.addProduct(new Item(2 + i * 100, "另一个表情包", productType, "./static/images/Products/biaoqingbao/tang.gif", 0));
            product.addProduct(new Item(3 + i * 100, "有趣的动画", productType, "./static/images/Products/biaoqingbao/tan.gif", 0));
            product.addProduct(new Item(4 + i * 100, "搞笑表情", productType, "./static/images/Products/biaoqingbao/qiuqiu.gif", 0));
            product.addProduct(new Item(5 + i * 100, "生动的动画", productType, "./static/images/Products/biaoqingbao/lve.gif", 0));
            product.addProduct(new Item(6 + i * 100, "可爱的GIF", productType, "./static/images/Products/biaoqingbao/tangshi.jpg", 0));

            products.add(product);
        }

        return products;
    }
}

