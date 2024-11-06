package Persistence;

import domain.LogActionType;
import domain.UserLog;

public interface LogDao {
    public final String INSERT_SQL = "INSERT INTO user_logs (user_id, action, item_id) VALUES (?, ?, ?)";

    public void logUserAction(UserLog userLog);
}
