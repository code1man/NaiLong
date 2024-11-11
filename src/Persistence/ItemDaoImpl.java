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
    private static final  String query = "SELECT c.ItemID, c.itemNum, i.id, i.name, i.product_id, i.url, i.price FROM cart c JOIN item i ON c.ItemID = i.id WHERE c.userID = ?";
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
    public ProductType StringToProductType(String s)
    {
        switch (s)
        {
            case "NAILONG_TANGTANG_EMOJI":return ProductType.NAILONG_TANGTANG_EMOJI;
            case "NAILONG_EMOTION_EMOJI":return ProductType.NAILONG_EMOTION_EMOJI;
            case "NAILONG_DOLL":return ProductType.NAILONG_DOLL;
            case "NAILONG_BLIND_BOX":return ProductType.NAILONG_BLIND_BOX;
            case "NAILONG_KEYCHAIN":return ProductType.NAILONG_KEYCHAIN;
            case "NAILONG_OTHER_EMOJI":return ProductType.NAILONG_OTHER_EMOJI;
            case "NAILONG_WALLPAPER":return ProductType.NAILONG_WALLPAPER;
            case "NAILONG_EDUCATIONAL_TOY":return ProductType.NAILONG_EDUCATIONAL_TOY;
            case "NAILONG_CUP":return ProductType.NAILONG_CUP;
            case "NAILONG_FIGURE":return ProductType.NAILONG_FIGURE;
            default: return null;
        }

    }


    public List<CartItem> getCartItemsByUserId(int userId) throws SQLException {
        List<CartItem> cartItems = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DBUtil.getConnection();
            statement = connection.prepareStatement(query);
            statement.setInt(1, userId); //
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                CartItem cartItem = new CartItem();
                cartItem.setUserId(userId);
                cartItem.setTotal(resultSet.getInt("ItemNum")*resultSet.getInt("price"));//总价格获取有问题，不会改！！！！
                cartItem.setQuantity(resultSet.getInt("itemNum"));

                // 将 item 信息映射到 Item 对象
                Item item = new Item(resultSet.getInt("id"),resultSet.getString("name"));
                item.setURL(resultSet.getString("url"));
                item.setPrice(resultSet.getInt("price"));
                cartItem.setItem(item);
                cartItems.add(cartItem);
            }
        } finally {
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeStatement(statement);
            DBUtil.closeConnection(connection);
        }

        return cartItems;
    }
}
