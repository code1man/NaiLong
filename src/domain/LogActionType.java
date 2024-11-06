package domain;

public enum LogActionType {
    VISIT("浏览"),
    BUY("购买"),
    ADD_TO_CART("加入购物车"),
    VIEW_PRODUCT("观看商品");

    private final String description;

    LogActionType(String description) {
        this.description = description;
    }
}
