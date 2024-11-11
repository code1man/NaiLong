package web.servlet;

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

@WebServlet(name = "ShoppingCartServlet", urlPatterns = {"/ShoppingCart"})
public class ShoppingCartFromServlet extends HttpServlet {
    private final String SHOPPINGCART = "/WEB-INF/jsp/ShoppingCart.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemId = req.getParameter("item");
        req.removeAttribute("item");
        int id = Integer.parseInt(itemId);
        /*通过数据库找到对应商品*/
        CatalogService catalogService = new CatalogService();
        Item item = null;
        try {
            item = catalogService.getItem(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("item", item);

        HttpSession session = req.getSession();
        session.setAttribute("item", item);
        req.getRequestDispatcher(SHOPPINGCART).forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemId = req.getParameter("item");
        req.removeAttribute("item");
        int id = Integer.parseInt(itemId);
        /*通过数据库找到对应商品*/
        CatalogService catalogService = new CatalogService();
        Item item = null;
        try {
            item = catalogService.getItem(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("item", item);
        
        HttpSession session = req.getSession();             //后面用了重定向，这里只能用session
        session.setAttribute("item", item);
        /*通过数据库找到对应商品*/
        req.getRequestDispatcher(SHOPPINGCART).forward(req, resp);
    }
}
