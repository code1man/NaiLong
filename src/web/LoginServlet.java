package web;

import domain.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        String errorMessage = "登陆成功";
        if (username != null && password != null) {
            if (username.equals("admin") && password.equals("password")) {
                User user = new User();
                session.setAttribute("user", user);
                // 登录成功，重定向到主页或其他页面
                response.sendRedirect("index.jsp");
            } else {
                // 登录失败，显示错误信息
                errorMessage = "用户名或密码错误";
                response.sendRedirect("Login/LoginPage.jsp");
            }
            session.setAttribute("ErrorMessage", errorMessage);
        }
    }
}


