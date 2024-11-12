package web.servlet;

import com.mysql.cj.Session;
import domain.Cart;
import domain.CartItem;
import domain.CartItem;
import domain.Item;
import domain.User;
import domain.User;
import service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Map;

@WebServlet(name = "AddServlet", urlPatterns = {"/AddItemToCart"})
public class AddItemToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Item item = (Item) req.getSession().getAttribute("item");
        if (item == null) {
            // 处理错误：ItemId为空
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "item is required.");
            return; // 结束方法执行
        }

        HttpSession httpSession = req.getSession();
        Cart cart = (Cart) httpSession.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        HttpSession session = req.getSession();
        session.setAttribute("cart", cart);

        if (cart.containsItemId(String.valueOf(item.getId()))) {
            cart.incrementQuantityByItemId(String.valueOf(item.getId()));
        }
        else {
            try {
                CatalogService catalogService = new CatalogService();

                User user = (User) session.getAttribute("loginUser");

                cart.addItem(item, user.getId());

                catalogService.executeAdd(cart);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        resp.sendRedirect(req.getContextPath() + "/MainForm");
    }

}
