package domain;

public class Product {
    private int id;
    private String name;
    private ProductType type;
    private String URL;
    private int price;


    public Product() {
    }

    public Product(int id, String name, ProductType type, String URL, int price) {
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

    public static enum ProductType {
        NAILONG_TANGTANG_EMOJI("奶龙唐唐表情包"),
        NAILONG_OTHER_EMOJI("奶龙其他表情包"),
        NAILONG_EMOTION_EMOJI("奶龙情绪表情包"),
        NAILONG_WALLPAPER("奶龙壁纸"),
        NAILONG_DOLL("奶龙玩偶"),
        NAILONG_EDUCATIONAL_TOY("奶龙儿童早教玩具"),
        NAILONG_BLIND_BOX("奶龙盲盒"),
        NAILONG_CUP("奶龙水杯/保温杯/咖啡杯"),
        NAILONG_KEYCHAIN("奶龙钥匙扣"),
        NAILONG_FIGURE("奶龙手办/摆件");

        private final String description;

        ProductType(String description) {
            this.description = description;
        }

        public String getDescription() {
            return description;
        }
    }
}
