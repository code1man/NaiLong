package Persistence;

import domain.CartItem;
import domain.Item;

import java.sql.SQLException;
import java.util.List;

public interface ItemDao {



    List<Item> getItemListByProduct(String productId) throws SQLException;

    Item getItem(int itemId) throws SQLException;
}
