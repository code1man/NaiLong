package domain;

import java.util.ArrayList;
import java.util.List;

/*用户*/
public class User {
    private int id;
    private String username;
    private String password;
    private int age;
    private String email;
    private boolean isAdmin;

    private final List<Item> hasBeenPutInShoppingCartProducts = new ArrayList<Item>();

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public List<Item> getHasBeenPutInShoppingCartProducts() {
        return hasBeenPutInShoppingCartProducts;
    }

    /*需要更改（金宇）*/
    public void addProductToShoppingCart(Item item) {
        hasBeenPutInShoppingCartProducts.add(item);
    }

    public void removeProductFromShoppingCart(Item item) {
        hasBeenPutInShoppingCartProducts.remove(item);
    }

    public int getTotalProductsNumber() {
        return hasBeenPutInShoppingCartProducts.size();
    }

    public int getTotalPrice() {
        int totalPrice = 0;
        for (Item item : hasBeenPutInShoppingCartProducts) {
            totalPrice += item.getPrice();
        }
        return totalPrice;
    }
}
