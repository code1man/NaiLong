package web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet",urlPatterns = {"/p"})
public class LoginServlet extends HttpServlet {
    private String username;
    private String password;
    private String loginMsg;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.username = req.getParameter("username");
        this.password = req.getParameter("password");
        if(!validate())
        {
            req.setAttribute("loginMsg", loginMsg);
            req.getRequestDispatcher("login").forward(req, resp);
        }
    }

    private boolean validate() {
       return false;
    }
}
