package domain;

import java.io.Serializable;

public class CartItem implements Serializable {
    private Item item;
    private int quantity;
    private int userId;
    private int total;

    public CartItem(){

    }
    public CartItem(Item item, int quantity)
    {
        this.item = item;
        this.quantity = quantity;
        this.total = item.getPrice() * quantity;
    }

    public int getTotal() {
        return total;
    }
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
        calculateTotal();
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        calculateTotal();
    }

    public void incrementQuantity() {
        quantity++;
        calculateTotal();
    }

    private void calculateTotal() {
        if (item != null && item.getPrice() != 0) {

            total = item.getPrice()*quantity;
        } else {
            total = 0;
        }
    }

}


