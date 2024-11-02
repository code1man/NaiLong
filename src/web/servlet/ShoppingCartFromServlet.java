package web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ShoppingCartServlet", urlPatterns = {"/ShoppingCart"})
public class ShoppingCartFromServlet extends HttpServlet {
    private static final String SHOPPINGCART = "/WEB-INF/jsp/ShoppingCart.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(SHOPPINGCART).forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(SHOPPINGCART).forward(req, resp);
    }
}
