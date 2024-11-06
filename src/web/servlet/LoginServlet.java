package web.servlet;

import domain.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet",urlPatterns = {"/handler"})
public class LoginServlet extends HttpServlet {
    private String username;
    private String password;
    private String loginMsg;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        this.username = req.getParameter("username");
        this.password = req.getParameter("password");

        if(!validate())
        {
            req.setAttribute("loginMsg", loginMsg);
            req.getRequestDispatcher("/login").forward(req, resp);
        }
        else
        {
            UserService userService = new UserService();
            User loginUser = userService.login(username, password);
            if(loginUser != null)
            {
                //此后可以加入是否管理员验证
                HttpSession session = req.getSession();
                session.setAttribute("loginUser", loginUser);
                resp.sendRedirect("mainForm");     //用session储存信息后即可重定向
            }
            else
            {
                req.setAttribute("loginMsg", "用户名或密码错误");
                req.getRequestDispatcher("/login").forward(req, resp);
            }
        }
    }

    private boolean validate() {           //实际不需要，前端限制了必须输入
        if (username == null || username.isEmpty()) {
            loginMsg = "用户名不能为空";
            return false;
        }
        if (password == null || password.isEmpty()) {
            loginMsg = "密码不能为空";
            return false;
        }
        return true; // 如果通过验证，返回 true
    }
}
