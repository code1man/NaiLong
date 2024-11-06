package Persistence;

import domain.LogActionType;
import domain.UserLog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LogDaoImpl implements LogDao {

    public void logUserAction(UserLog userLog) {
        Connection connection = DBUtil.getConnection();

        try (PreparedStatement statement = connection.prepareStatement(INSERT_SQL)) {
            statement.setInt(1, userLog.getUserId());
            statement.setString(2, userLog.getAction().toString());
            statement.setInt(3, userLog.getItemId()); // -1代表没有商品
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.print("用户记录出错：");
            e.printStackTrace(); // 处理异常
        }
    }
}
