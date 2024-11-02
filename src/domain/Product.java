package domain;

/*商品*/
public class Product {
    private int id;
    private String name;
    private CategoryType type;
    private String URL;
    private int price;

    public Product() {
    }

    public Product(int id, String name, CategoryType type, String URL, int price) {
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

    public void setType(CategoryType type) {
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

    public CategoryType getType() {
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
