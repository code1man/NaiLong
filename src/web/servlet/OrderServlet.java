package web.servlet;
import Persistence.AddressDao;
import Persistence.AddressDaoImpl;
import com.google.gson.Gson;
import domain.Address;
import domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;

// 处理用户收货地址信息
@WebServlet(name = "OrderServlet", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {
    private AddressDao addressDao = new AddressDaoImpl();
    private User user;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置响应内容类型
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        this.user = (User)session.getAttribute("loginUser");
        if(this.user != null) {
            int userId = user.getId();
            // 读取并解析 JSON 数据
            BufferedReader reader = req.getReader();
            Gson gson = new Gson();
            Address newAddress = gson.fromJson(reader, Address.class);

            newAddress.setUser_id(userId);
            // 将 Address 对象存入数据库
            addressDao.addAddress(newAddress);

            // 返回成功消息
            resp.getWriter().write("{\"status\":\"success\"}");
        }
    }
}
