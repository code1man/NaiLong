package Persistence;

import domain.Product;
import domain.ProductType;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {
    List<ProductType> getProductListByCategory(String categoryId) throws SQLException;

    ProductType getProduct(int  productId) throws SQLException;

    List<Product> searchProductList(String keywords);
}
