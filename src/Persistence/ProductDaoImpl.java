package Persistence;

import domain.Category;
import domain.CategoryType;
import domain.Product;
import domain.ProductType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDao{
    public CategoryType StringToCatagory(String string)
    {
        switch (string){
            case "EMOJI":return CategoryType.EMOJI;
            case "TOY":return  CategoryType.TOY;
            case "DAILYITEM":return  CategoryType.DAILYITEM;
            default: return null;
        }

    }
    public ProductType indexToProduct(int a) {
        switch (a) {
            case 0:
                return ProductType.NAILONG_TANGTANG_EMOJI;
            case 1:
                return ProductType.NAILONG_OTHER_EMOJI;
            case 2:
                return ProductType.NAILONG_EMOTION_EMOJI;
            case 3:
                return ProductType.NAILONG_WALLPAPER;
            case 4:
                return ProductType.NAILONG_DOLL;
            case 5:
                return ProductType.NAILONG_EDUCATIONAL_TOY;
            case 6:
                return ProductType.NAILONG_BLIND_BOX;
            case 7:
                return ProductType.NAILONG_CUP;
            case 8:
                return ProductType.NAILONG_KEYCHAIN;
            case 9:
                return ProductType.NAILONG_FIGURE;
        }
        return null;
    }
    private static final  String Get_ProductList_By_Category="SELECT category_type as productType FROM producttype where category_type=?";
    private static final  String Get_Product="SELECT index_value FROM producttype where index_value=?";
    @Override
    public List<ProductType> getProductListByCategory(String categoryName) throws SQLException {
        List<ProductType> productList=new ArrayList<>();
        Connection connection=DBUtil.getConnection();
        PreparedStatement statement=connection.prepareStatement(Get_ProductList_By_Category);
        statement.setString(1,categoryName);
        ResultSet resultSet= statement.executeQuery();
        while(resultSet.next())
        { String string= resultSet.getString("category_type");

           Category category=new Category(StringToCatagory(string));
           productList=CategoryType.getContainingProductTypes(category.getCategoryType());
        }
        DBUtil.closeResultSet(resultSet);
        DBUtil.closeStatement(statement);
        DBUtil.closeConnection(connection);
      return productList;
    }

    @Override
    public ProductType getProduct(int  index) throws SQLException {
        Product product = null;
        Connection connection = DBUtil.getConnection();
        PreparedStatement statement = connection.prepareStatement(Get_Product);
        statement.setInt(1, index);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            int a = resultSet.getInt("index_value");
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeStatement(statement);
            DBUtil.closeConnection(connection);

            return indexToProduct(a);


            }
        return null;
    }
    @Override
    public List<Product> searchProductList(String keywords) {
       /*东神来做搜索。。也许是吧。。。*/
        return null;
    }

}
