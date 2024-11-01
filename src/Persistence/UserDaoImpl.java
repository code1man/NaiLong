package Persistence;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import domain.User;

public class UserDaoImpl implements UserDao {
    private static final String INSERT_USER = "insert into userinfo(username,password,email,age,is_admin) values(?,?,?,?,?)";
    private static final String SELECT_USER = "select * from userinfo where id = ?";
    private static final String SELECT_USER_BY_USERNAME_AND_PASSWORD = "select * from userinfo where username = ? and password = ?";
    private static final String SELECT_ALL_USER = "select * from userinfo";

    @Override
    public List<User> getAllUsers() {                           //获取表中查询到的所有对象
        List<User> userList = new ArrayList<User>();
        try {
            Connection connection = DBUtil.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_USER);
            while (resultSet.next()) {
                User user = this.resultSetToUser(resultSet);
                userList.add(user);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeStatement(statement);
            DBUtil.closeConnection(connection);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public User getUser(int id) {                          //根据id查询用户信息
        User user = null;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = this.resultSetToUser(resultSet);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeStatement(preparedStatement);
            DBUtil.closeConnection(connection);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean addUser(User user) {           //向数据库中添加对象
        boolean result = false;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setInt(4, user.getAge());
            preparedStatement.setBoolean(5, user.isAdmin());
            int rows = preparedStatement.executeUpdate();
            if (rows > 0) {
                result = true;
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;

    }

    @Override
    public User getUserByUsernameAndPassword(String username, String password) {                      //根据用户名和密码获取用户信息
        User user = null;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME_AND_PASSWORD);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = this.resultSetToUser(resultSet);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;

    }

    private User resultSetToUser(ResultSet resultSet) throws SQLException {               //查询结果中的一个对象

        User user = new User();
        user.setId(resultSet.getInt("id"));
        user.setUsername(resultSet.getString("username"));
        user.setPassword(resultSet.getString("password"));
        user.setAge(resultSet.getInt("age"));
        user.setEmail(resultSet.getString("email"));
        user.setAdmin(resultSet.getBoolean("is_admin"));
        return user;
    }

    public static void main(String[] args) {
        UserDaoImpl userDao = new UserDaoImpl();
        System.out.println(userDao.getUserByUsernameAndPassword("zkd", "123"));
    }
}