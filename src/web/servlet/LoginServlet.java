package web.servlet;

import Persistence.DBUtil;
import domain.Cart;
import domain.User;
import service.UserService;
import service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"handler"})
public class LoginServlet extends HttpServlet {
    private static final String Search_userID = "SELECT userID,ItemID,itemNum from cart where userID=? AND isDeleted=false AND isCovered=false";
    private String username;
    private String password;
    private String loginMsg;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        this.username = req.getParameter("username");
        this.password = req.getParameter("password");

        if (!validate()) {
            req.setAttribute("loginMsg", loginMsg);
            req.getRequestDispatcher("/login").forward(req, resp);
        } else {
            UserService userService = new UserService();
            User loginUser = userService.login(username, password);
            if (loginUser != null) {
                //此后可以加入是否管理员验证
                HttpSession session = req.getSession();
                session.setAttribute("loginUser", loginUser);

                //链接数据库，找到对应购物车
                Connection connection = DBUtil.getConnection();
                try {
                    CatalogService catalogService = new CatalogService();
                    PreparedStatement statement = connection.prepareStatement(Search_userID);
                    statement.setInt(1, loginUser.getId());
                    ResultSet resultSet = statement.executeQuery();
                    Cart cart = catalogService.ResultToCart(resultSet);
                    session.setAttribute("cart", cart);
                    DBUtil.closeResultSet(resultSet);
                    DBUtil.closeStatement(statement);
                    DBUtil.closeConnection(connection);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                resp.sendRedirect("mainForm");     //用session储存信息后即可重定向
            } else {
                req.setAttribute("loginMsg", "用户名或密码错误");
                req.getRequestDispatcher("/login").forward(req, resp);
            }
        }
    }

    private boolean validate() {           //实际不需要，前端限制了必须输入
        if (username == null || username.isEmpty()) {
            loginMsg = "用户名不能为空";
            return false;
        }
        if (password == null || password.isEmpty()) {
            loginMsg = "密码不能为空";
            return false;
        }
        return true; // 如果通过验证，返回 true
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    //    public static void main(String[] args) throws SQLException {
//        Connection connection= DBUtil.getConnection();
//
//        PreparedStatement statement= connection.prepareStatement(Search_userID);
//        statement.setInt(1,11);
//        ResultSet resultSet=statement.executeQuery();
//        System.out.println(resultSet);
//    }
}
