package web.servlet;

import domain.Cart;
import domain.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
@WebServlet(name = "updateCartServlet",urlPatterns = {"/updateCart"})

public class updateCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        Cart cart=(Cart)session.getAttribute("cart");
        Iterator<CartItem> cartItems = cart.getAllCartItems();

        while (cartItems.hasNext()) {
            CartItem cartItem = (CartItem) cartItems.next();
            int itemId = cartItem.getItem().getId();
            try {
                String quantityString = req.getParameter("itemId");
                int quantity = Integer.parseInt((quantityString));
                cart.setQuantityByItemId(String.valueOf(itemId), quantity);
                if (quantity < 1) {
                    cartItems.remove();
                }
            } catch (Exception e) {
                //ignore parse exceptions on purpose
            }
        }
    }
}


