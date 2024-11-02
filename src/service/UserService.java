package service;

import Persistence.UserDao;
import Persistence.UserDaoImpl;
import domain.User;

public class UserService {
    private final UserDao userDao;             //提供了对数据库操作的方法

    public UserService() {
        this.userDao = new UserDaoImpl();
    }

    public User login(String username, String password) {
        return this.userDao.getUserByUsernameAndPassword(username, password);
    }

    public boolean register(User user) {
        return this.userDao.addUser(user);
    }

    public boolean updateUser(User user,String username, String password, String email, int age) {
        return userDao.updateUser(user,username,password,email,age);
    }

    public static void main(String[] args) {
        UserService userService = new UserService();
        System.out.println(userService.login("admin", "admin"));
    }
}
