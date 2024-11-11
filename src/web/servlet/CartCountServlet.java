package web.servlet;

import Persistence.ItemDaoImpl;
import domain.CartItem;
import domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CartCountServlet",urlPatterns = {"/CartCount"})
public class CartCountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        ItemDaoImpl itemDao = new ItemDaoImpl();
        User user= (User) session.getAttribute("loginUser");
        int userId = user.getId();
        List<CartItem> cartItems = null;
        try {
            cartItems = itemDao.getCartItemsByUserId(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        int totalAmount = cartItems.stream().mapToInt(CartItem::getTotal).sum();
        session.setAttribute("totalAmount", totalAmount);
        session.setAttribute("cartItems", cartItems);
        req.getRequestDispatcher("/WEB-INF/jsp/CartToOrder.jsp").forward(req, resp);
    }
}
