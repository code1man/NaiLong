package web.servlet;

import Persistence.ItemDaoImpl;
import domain.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name ="CartServlet",urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("submitOrder".equals(action)) {
            int userId = Integer.parseInt(req.getParameter("userId"));

            try {
                ItemDaoImpl cartDao = new ItemDaoImpl();
                cartDao.deleteCartItemsByUserId(userId);
                resp.setStatus(HttpServletResponse.SC_OK); // 请求成功
            } catch (SQLException e) {
                e.printStackTrace();
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 请求失败
            }
        }
    }
}
