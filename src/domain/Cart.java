package domain;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.*;

public class Cart implements Serializable {
    public List<CartItem> itemList = new ArrayList<CartItem>();
    private final Map<String, CartItem> itemMap = Collections.synchronizedMap(new HashMap<String, CartItem>());
    public boolean containsItemId(String itemId) {
        return itemMap.containsKey(itemId);
    }
//    public Iterator<CartItem> getCartItems() {
//        return itemList.iterator();
//    }

    public List<CartItem> getCartItemList() {
        return itemList;
    }

//    public int getNumberOfItems() {
//        return itemList.size();
//    }

    public Iterator<CartItem> getAllCartItems() {
        return itemList.iterator();
    }
//    public Cart()
//    {
//        this.itemList=new ArrayList<>();
//
//}

    public void addItem(Item item) {
        CartItem cartItem = null;
        if (!itemList.isEmpty())
            cartItem = (CartItem) itemList.get(item.getId());
        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setItem(item);
            cartItem.setQuantity(0);
            itemList.add(cartItem);
        }
        cartItem.incrementQuantity();
    }

    public void addIUtem(CartItem cartItem)
    {
        itemList.add(cartItem);
    }

    public Item removeItemById(int itemId) {
        CartItem cartItem = (CartItem) itemList.remove(itemId);
        if (cartItem == null) {
            return null;
        } else {
            itemList.remove(cartItem);
            return cartItem.getItem();
        }
    }

    public void incrementQuantityByItemId(String itemId) {
        CartItem cartItem = (CartItem) itemMap.get(itemId);
        cartItem.incrementQuantity();
    }

    public void setQuantityByItemId(String itemId, int quantity) {
        CartItem cartItem = (CartItem) itemMap.get(itemId);
        cartItem.setQuantity(quantity);
    }

    public int getSubTotal() {
        int subTotal = 0;
        Iterator<CartItem> items = getAllCartItems();
        while (items.hasNext()) {
            CartItem cartItem = (CartItem) items.next();
            Item item = cartItem.getItem();
           int listPrice = item.getPrice();
            int quantity = cartItem.getQuantity();
            subTotal = subTotal+listPrice*quantity;
        }
        return subTotal;

    }

}


