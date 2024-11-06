package web.servlet;

import Persistence.DBUtil;
import domain.Cart;
import domain.User;
import service.CatalogService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "MainFormServlet",urlPatterns = {"/mainForm"})
public class MainFormServlet extends HttpServlet {
    private String username;
    private String password;
    private String email;
    private int age;
    private User user;
    private static final  String Update_Item="SELECT * FROM cart where userID=?";
    private static final String LOGIN_FORM = "/WEB-INF/jsp/index.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher(LOGIN_FORM).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.username = req.getParameter("username");
        this.password = req.getParameter("password");
        this.email = req.getParameter("email");
        this.age = Integer.parseInt(req.getParameter("age"));
        HttpSession session = req.getSession();
        this.user = (User)session.getAttribute("loginUser");

        UserService userService = new UserService();
        userService.updateUser(user, username, password, email, age);


        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setAge(age);
        session.setAttribute("loginUser", user);     //更新session中的LoginUser属性
        Cart cart=(Cart)session.getAttribute("cart");
        CatalogService catalogService=new CatalogService();
        Connection connection= DBUtil.getConnection();
        try (PreparedStatement statement = connection.prepareStatement(Update_Item)) {
            try {
                statement.setInt(1, cart.itemList.get(cart.itemList.size() - 1).getUserId());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        this.doGet(req, resp);
    }
}
