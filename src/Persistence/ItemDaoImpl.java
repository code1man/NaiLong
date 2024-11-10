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

public class ItemDaoImpl implements ItemDao{
    private static final  String Get_ItemList_By_Product=" SELECT  * from item where type = ?";
    private static final  String Get_Item="SELECT * from item where id=?";
    @Override
    public List<Item> getItemListByProduct(String product_type) throws SQLException {
            List<Item>itemList=new ArrayList<>();
            Connection connection=DBUtil.getConnection();
            PreparedStatement statement=connection.prepareStatement(Get_ItemList_By_Product);
            statement.setString(1,product_type);
            ResultSet resultSet=statement.executeQuery();
            while(resultSet.next())
            {
                Item item=resultSetToItem(resultSet);
                itemList.add(item);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeStatement(statement);
            DBUtil.closeConnection(connection);
            return itemList;
    }

    @Override
    public Item getItem(int itemId) throws SQLException {
        Item item=new Item();
        Connection connection=DBUtil.getConnection();
        PreparedStatement statement=connection.prepareStatement(Get_Item);
        statement.setInt(1,itemId);
        ResultSet resultSet=statement.executeQuery();
        if(resultSet.next())
        {
            item=resultSetToItem(resultSet);
        }
        return item;
    }
    public Item resultSetToItem(ResultSet resultSet) throws SQLException {
        Item item=new Item();
        item.setId(resultSet.getInt(1));
        item.setName(resultSet.getString(2));
        String s=resultSet.getString(3);
        ProductType productType=StringToProductType(s);
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

    public List<CartItem> getCartItemsByUserId(int userId) {
        List<CartItem> cartItems = new ArrayList<>();
        // 执行查询语句获取指定用户的购物车商品及详细信息
        // 将结果映射到CartItem对象中并添加到列表
        return cartItems;
    }

}
