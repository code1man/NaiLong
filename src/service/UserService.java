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

}
