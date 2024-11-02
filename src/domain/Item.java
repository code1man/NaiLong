package domain;

/*商品*/
public class Item {
    private int id;
    private String name;
    private ProductType type;
    private String URL;
    private int price;

    public Item() {
    }

    public Item(int id, String name, ProductType type, String URL, int price) {
        this.name = name;
        this.type = type;
        this.id = id;
        this.URL = URL;
        this.price = price;
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
}
