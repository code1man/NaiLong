package domain;

import java.io.Serializable;

/*商品*/
public class Item implements Serializable {
    private int id;
    private String name;
    private ProductType type;
    private String URL;
    private int price;
    private String description;

    public Item() {
    }

    public Item(int id, String name) {
        this.name = name;
        this.id = id;
    }

    public Item(int id, String name, ProductType type, String URL, int price) {
        this.name = name;
        this.type = type;
        this.id = id;
        this.URL = URL;
        this.price = price;
    }

    public Item(int id, String name, ProductType type, String URL, int price, String description) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.URL = URL;
        this.price = price;
        this.description = description;
    }


    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(ProductType type) {
        this.type = type;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public ProductType getType() {
        return type;
    }

    public int getId() {
        return id;
    }

    public String getURL() {
        return URL;
    }

    public int getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
