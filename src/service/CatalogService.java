package service;

import Persistence.*;
import com.mysql.cj.Session;
import domain.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CatalogService {
    private CategoryDao categoryDao;
    private ProductDao productDao;
    private ItemDao itemDao;

    public CatalogService() {
        this.categoryDao = new CategoryDaoImpl();
        this.productDao = new ProductDaoImpl();
        this.itemDao = new ItemDaoImpl();
    }
    public List<Category> getCategoryList() {
        return categoryDao.getCategoryList();
    }

    public Category getCategory(String categoryId) throws SQLException {
        return categoryDao.getCategory(categoryId);
    }

    public ProductType getProduct(int productId) throws SQLException {
        return productDao.getProduct(productId);
    }

    public List<ProductType> getProductListByCategory(String categoryId) throws SQLException {
        return productDao.getProductListByCategory(categoryId);
    }

//    public List<Product> searchProductList(String keyword) {
//        return productMapper.searchProductList("%" + keyword.toLowerCase() + "%");
//    }可能需要改

    public List<Item> getItemListByProduct(String productId) throws SQLException {
        return itemDao.getItemListByProduct(productId);
    }

    public Item getItem(int itemId) throws SQLException {
        return itemDao.getItem(itemId);
    }

    private static final  String Add_Item="INSERT INTO cart (userID,ItemID,ItemNum,date) VALUES(?,?,?,?)";
    private static final  String Remove_Item="DELETE FROM cart where ItemID=?";
    private static final  String Update_Item="SELECT * FROM cart where userID=?";

    public void executeAdd(Cart cart) throws SQLException {

        Connection connection=DBUtil.getConnection();
        PreparedStatement statement= connection.prepareStatement(Add_Item);

                statement.setInt(1,cart.itemList.get(cart.itemList.size()-1).getUserId());
                statement.setInt(2,cart.itemList.get(cart.itemList.size()-1).getItem().getId());
                statement.setInt(3,cart.itemList.get(cart.itemList.size()-1).getQuantity());
        DBUtil.closeStatement(statement);
        DBUtil.closeConnection(connection);
    }
     public Cart ResultToCart(ResultSet resultSet) throws SQLException {
         ItemDaoImpl itemDao = new ItemDaoImpl();
         Cart cart=new Cart();

         while(resultSet.next())
         {
             int itemID = resultSet.getInt(2);
             int quantity = resultSet.getInt(3);

             CartItem cartItem=new CartItem(itemDao.getItem(itemID), quantity);

         }

         return cart;
     }


}