package web.servlet;

import domain.Cart;
import domain.Item;
import service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RemoveServlet",urlPatterns = {"/RemoveItem"})

public class RemoveItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String string = req.getParameter("id");
        cart.removeItemById(Integer.parseInt(string));
        CatalogService catalogService = new CatalogService();
        try {
            catalogService.executeRemove(cart);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    }




