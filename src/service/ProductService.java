package service;

import domain.Category;
import domain.CategoryType;
import domain.Product;

import java.util.ArrayList;
import java.util.List;

/*初始化商品信息*/
public class ProductService {
    public List<Category> getCategories() {
        List<Category> Categories = new ArrayList<>();

        // 创建产品
        for (int i = 0; i < CategoryType.values().length; i++) {
            CategoryType type = CategoryType.values()[i];
            Category category = new Category(type);

            // 后期替换成数据库
            category.addProduct(new Product(1, "奶龙唐唐表情包", type, "./static/images/Products/tangtang.gif", 0));
            category.addProduct(new Product(2, "另一个表情包", type, "./static/images/Products/tang.gif", 0));
            category.addProduct(new Product(3, "有趣的动画", type, "./static/images/Products/tan.gif", 0));
            category.addProduct(new Product(4, "搞笑表情", type, "./static/images/Products/qiuqiu.gif", 0));
            category.addProduct(new Product(5, "生动的动画", type, "./static/images/Products/lve.gif", 0));
            category.addProduct(new Product(6, "可爱的GIF", type, "./static/images/Products/tangshi.jpg", 0));

            Categories.add(category);
        }

        return Categories;
    }
}

