package Persistence;

import domain.User;
import java.util.List;

public interface UserDao {
    public List<User> getAllUsers();

    public User getUser(int id);

    public boolean addUser(User user);

    public User getUserByUsernameAndPassword(String username, String password);
}