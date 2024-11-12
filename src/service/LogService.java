package service;

import Persistence.LogDaoImpl;
import domain.LogActionType;
import domain.User;
import domain.UserLog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LogService {
    private final String BUY_ITEM = "/order";
    private final String ADD_TO_CART = "/AddItemToCart";
    private final String ITEMSHOW = "/ShoppingCart";
    private final String INDEX = "/mainForm";

    public LogService() {
    }

    public void AddLog(UserLog userLog) {
        LogDaoImpl logDao = new LogDaoImpl();
        logDao.logUserAction(userLog);
    }

    public LogActionType JudgeLogActionType(String httpFromWhere) {
        return switch (httpFromWhere) {
            case ITEMSHOW -> LogActionType.VIEW_PRODUCT;
            case INDEX -> LogActionType.VISIT;
            case ADD_TO_CART -> LogActionType.ADD_TO_CART;
            case BUY_ITEM -> LogActionType.BUY;
            default -> null;
        };
    }

//    public static void main(String[] agrs) {
//        LogService logService = new LogService();
//        UserLog userLog = new UserLog(1, LogActionType.VISIT, 10101);
//        logService.AddLog(userLog);
//    }
}

