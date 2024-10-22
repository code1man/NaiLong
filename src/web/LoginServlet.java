package web;

import domain.Client;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", urlPatterns = "/Login")
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
                Client user = new Client(username, password);
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


