package web.servlet;

import Persistence.AddressDao;
import Persistence.AddressDaoImpl;
import domain.Address;
import domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderFormServlet",urlPatterns = {"/orderForm"})
public class OrderFormServlet extends HttpServlet {
    private User user;
    private static final String ORDER_FORM = "/WEB-INF/jsp/Order.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //判断用户是否登陆，未登录则需提醒用户未登录，不能访问订单界面
        HttpSession session = req.getSession();
        this.user = (User)session.getAttribute("loginUser");
        if(this.user == null) {
               // 用户未登录，设置一个标志
              req.setAttribute("notLoggedIn", true);
              req.getRequestDispatcher(ORDER_FORM).forward(req, resp);
        }
        else{
            int userId = user.getId();            // 从 session 中获取用户 ID
            AddressDao addressDao = new AddressDaoImpl();
            List<Address> addressList = addressDao.getAllAddressById(userId);
            session.setAttribute("addressList", addressList);
            //将用户的收获地址也添加到session中存储
            req.getRequestDispatcher(ORDER_FORM).forward(req, resp);
        }

    }
}
