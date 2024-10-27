package service;

import domain.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService {
    public Map<Product.ProductType, List<Product>> getProductsByType() {
        Map<Product.ProductType, List<Product>> productsByType = new HashMap<>();

        // 创建产品
        List<Product> allProducts = new ArrayList<>();
        allProducts.add(new Product(1, "奶龙唐唐表情包", Product.ProductType.NAILONG_TANGTANG_EMOJI, "", 0));
        allProducts.add(new Product(1, "奶龙壁纸", Product.ProductType.NAILONG_WALLPAPER, "", 0));
        allProducts.add(new Product(1, "奶龙玩偶", Product.ProductType.NAILONG_DOLL, "", 0));
        allProducts.add(new Product(1, "奶龙儿童早教玩具", Product.ProductType.NAILONG_EDUCATIONAL_TOY, "", 0));
        allProducts.add(new Product(1, "奶龙盲盒", Product.ProductType.NAILONG_BLIND_BOX, "", 0));
        allProducts.add(new Product(1, "奶龙水杯", Product.ProductType.NAILONG_CUP, "", 0));
        allProducts.add(new Product(1, "奶龙情绪表情包", Product.ProductType.NAILONG_EMOTION_EMOJI, "", 0));
        allProducts.add(new Product(1, "奶龙钥匙扣", Product.ProductType.NAILONG_KEYCHAIN, "", 0));
        allProducts.add(new Product(1, "奶龙手办", Product.ProductType.NAILONG_FIGURE, "", 0));
        allProducts.add(new Product(1, "奶龙其他他表情包", Product.ProductType.NAILONG_OTHER_EMOJI, "", 0));

        // 按类型分组
        for (Product product : allProducts) {
            productsByType.computeIfAbsent(product.getType(), k -> new ArrayList<>()).add(product);
        }

        return productsByType;
    }
}

