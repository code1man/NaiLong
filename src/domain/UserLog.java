package domain;

import java.sql.Timestamp;

public class UserLog {
    private int userId;
    private LogActionType action;
    private int itemId; // 可以为 null，因为某些行为可能不涉及商品

    public UserLog() {
    }

    public UserLog(int userId, LogActionType action, int itemId) {
        this.userId = userId;
        this.action = action;
        this.itemId = itemId;
    }


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LogActionType getAction() {
        return action;
    }

    public void setAction(LogActionType action) {
        this.action = action;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    // 构造函数、getter 和 setter
}

