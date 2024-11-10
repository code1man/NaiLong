package web.servlet;

import Persistence.ItemDaoImpl;
import domain.CartItem;
import domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartCountServlet",urlPatterns = {"/CartCount"})
public class CartCountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ItemDaoImpl itemDao = new ItemDaoImpl();
        User user= (User) req.getSession().getAttribute("loginUser");
        int userId = user.getId();
        List<CartItem> cartItems = itemDao.getCartItemsByUserId(userId);

        int totalAmount = cartItems.stream().mapToInt(CartItem::getTotal).sum();
        req.setAttribute("totalAmount", totalAmount);
        req.setAttribute("cartItems", cartItems);
        req.getRequestDispatcher("/WEB-INF/jsp/CartToOrder.jsp").forward(req, resp);
    }
}
