package web.servlet;

import domain.Cart;
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

@WebServlet(name = "updateCartServlet", urlPatterns = {"/updateCart"})

public class updateCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = new Cart();
        User user = (User) session.getAttribute("loginUser");
        int userId = user.getId();
        int itemId = Integer.parseInt(req.getParameter("itemID"));
        int count = Integer.parseInt(req.getParameter("count"));

        CatalogService catalogService = new CatalogService();
        try {
            cart = catalogService.executeUpdate(userId, itemId, count);
            session.setAttribute("cart", cart);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // 设置响应类型为空，无需返回任何数据
        resp.setStatus(HttpServletResponse.SC_OK); // 设置 HTTP 状态码为 200
        resp.setContentType("text/plain"); // 可选，设置为纯文本
        resp.getWriter().flush(); // 返回空响应
    }
}


