package domain;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.*;

public class Cart implements Serializable {
    public List<CartItem> itemList = new ArrayList<CartItem>();
    private final Map<String, CartItem> itemMap = Collections.synchronizedMap(new HashMap<String, CartItem>());

    public Cart() {
    }

    public boolean containsItemId(String itemId) {
        return itemMap.containsKey(itemId);
    }

    public List<CartItem> getCartItemList() {
        return itemList;
    }

    public Iterator<CartItem> getAllCartItems() {
        return itemList.iterator();
    }

    public int count(Iterator iterator) {
        int count1 = 0;
        iterator = this.getAllCartItems();
        while (iterator.hasNext()) {
            CartItem cartItem = (CartItem) iterator.next();
            count1 += cartItem.getQuantity();
        }

        return count1;
    }

    public CartItem addItem(Item item, int userid) {
        CartItem cartItem = null;
        if (!containsItemId(String.valueOf(item.getId()))) {
            for (CartItem cartItem1 : itemList) {
                int itemId = cartItem1.getItem().getId();
                if (item.getId() == itemId) {
                    itemList.remove(cartItem1);
                    cartItem = cartItem1;
                    break;
                }
            }
        }

        if (cartItem == null) {
            cartItem = new CartItem();
            cartItem.setItem(item);
            cartItem.setUserId(userid);
            cartItem.setQuantity(0);
        }
        cartItem.incrementQuantity();
        itemList.add(cartItem);
        return cartItem;
    }

    public void addItem(CartItem cartItem) {
        itemList.add(cartItem);
    }

    public Item removeItemById(int itemId) {
        CartItem cartItem = null;
        for (CartItem cartItem1 : itemList) {
            if (cartItem1.getItem().getId() == itemId) {
                cartItem = cartItem1;
                itemList.remove(cartItem1);
                break;
            }
        }
        if (cartItem == null) {
            return null;
        } else {
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
            subTotal = subTotal + listPrice * quantity;
        }
        return subTotal;

    }

    public int getTotalNum() {
        return this.count(this.getAllCartItems());
    }
}


