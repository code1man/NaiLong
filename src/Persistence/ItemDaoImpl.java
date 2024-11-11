package Persistence;

import domain.CartItem;
import domain.Item;
import domain.ProductType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDaoImpl implements ItemDao {
    private static final String Get_ItemList_By_Product = " SELECT  * from item where product_id = ?";
    private static final String Get_Item = "SELECT * from item where id=?";

    @Override
    public List<Item> getItemListByProduct(int product_id) throws SQLException {
        List<Item> itemList = new ArrayList<>();
        Connection connection = DBUtil.getConnection();
        PreparedStatement statement = connection.prepareStatement(Get_ItemList_By_Product);
        statement.setInt(1, product_id);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Item item = resultSetToItem(resultSet);
            itemList.add(item);
        }
        DBUtil.closeResultSet(resultSet);
        DBUtil.closeStatement(statement);
        DBUtil.closeConnection(connection);
        return itemList;
    }

    @Override
    public Item getItem(int itemId) throws SQLException {
        Item item = new Item();
        Connection connection = DBUtil.getConnection();
        PreparedStatement statement = connection.prepareStatement(Get_Item);
        statement.setInt(1, itemId);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            item = resultSetToItem(resultSet);
        }
        return item;
    }

    public Item resultSetToItem(ResultSet resultSet) throws SQLException {
        Item item = new Item();
        item.setId(resultSet.getInt(1));
        item.setName(resultSet.getString(2));
        ProductType productType = ProductType.values()[resultSet.getInt(3) - 1];
        item.setType(productType);
        item.setURL(resultSet.getString(4));
        item.setPrice(resultSet.getInt(5));
        return item;
    }

    public List<CartItem> getCartItemsByUserId(int userId) {
        List<CartItem> cartItems = new ArrayList<>();
        // 执行查询语句获取指定用户的购物车商品及详细信息
        // 将结果映射到CartItem对象中并添加到列表
        return cartItems;
    }

}
