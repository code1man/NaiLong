package service;

import Persistence.*;
import com.mysql.cj.Session;
import domain.*;

import java.sql.*;
import java.time.LocalDate;
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

    public List<Item> getItemListByProduct(int productId) throws SQLException {
        return itemDao.getItemListByProduct(productId);
    }

    public Item getItem(int itemId) throws SQLException {
        return itemDao.getItem(itemId);
    }

    private static final String Add_Item = "INSERT INTO cart (userID,ItemID,ItemNum) VALUES(?,?,?)";
    private static final String Remove_Item = "DELETE FROM cart where ItemID=?";
    private static final String Search_Item = "SELECT * FROM cart WHERE userID = ? AND isCovered = false AND isDeleted = false";
    private static final String Update_Item = "UPDATE cart SET isCovered=true WHERE userID=? AND ItemID=?";

    public void executeAdd(Cart cart) throws SQLException {

        Connection connection = DBUtil.getConnection();
        PreparedStatement statement = connection.prepareStatement(Add_Item);

        statement.setInt(1, cart.itemList.get(cart.itemList.size() - 1).getUserId());
        statement.setInt(2, cart.itemList.get(cart.itemList.size() - 1).getItem().getId());
        statement.setInt(3, cart.itemList.get(cart.itemList.size() - 1).getQuantity());

        statement.executeUpdate();

        DBUtil.closeStatement(statement);
        DBUtil.closeConnection(connection);
    }

    public void executeRemove(int id) throws SQLException {
        Connection connection = DBUtil.getConnection();
        PreparedStatement statement = connection.prepareStatement(Remove_Item);
        statement.setInt(1, id);

        statement.executeUpdate();

        DBUtil.closeStatement(statement);
        DBUtil.closeConnection(connection);
    }

    public Cart ResultToCart(ResultSet resultSet) throws SQLException {
        ItemDaoImpl itemDao = new ItemDaoImpl();
        Cart cart = new Cart();

        while (resultSet.next()) {
            int itemID = resultSet.getInt(2);
            int quantity = resultSet.getInt(3);

            CartItem cartItem = new CartItem(itemDao.getItem(itemID), quantity);
            cart.addItem(cartItem);
        }

        return cart;
    }

    public Cart executeQuery(Cart cart) throws SQLException {
        Connection connection = DBUtil.getConnection();
        PreparedStatement statement = connection.prepareStatement(Search_Item);
        statement.setInt(1, cart.itemList.get(cart.itemList.size() - 1).getUserId());
        ResultSet resultSet = statement.executeQuery();
        Cart cart1 = ResultToCart(resultSet);
        return cart1;
    }

    public Cart executeUpdate(int userid, int itemid, int itemNum) throws SQLException {
        Connection connection = DBUtil.getConnection();
        PreparedStatement updatedStatement = connection.prepareStatement(Update_Item);
        updatedStatement.setInt(1, userid);
        updatedStatement.setInt(2, itemid);
        updatedStatement.executeUpdate();

        PreparedStatement insertedStatement = connection.prepareStatement(Add_Item);
        insertedStatement.setInt(1, userid);
        insertedStatement.setInt(2, itemid);
        insertedStatement.setInt(3, itemNum);
        insertedStatement.executeUpdate();

        PreparedStatement getCartStatement = connection.prepareStatement(Search_Item);
        getCartStatement.setInt(1, userid);
        ResultSet resultSet = getCartStatement.executeQuery();

        return ResultToCart(resultSet);
    }

}