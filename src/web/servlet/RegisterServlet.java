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

@WebServlet(name = "RegisterServlet",urlPatterns = {"/handlerRegister"})
public class RegisterServlet extends HttpServlet {
    private String username;
    private String password;
    private String email;
    private int age;
    private boolean is_admin;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.username = req.getParameter("username");
        this.password = req.getParameter("password");
        this.email = req.getParameter("email");
        this.age = Integer.parseInt(req.getParameter("age"));
        String isAdmin = req.getParameter("is_admin");
        this.is_admin = "admin".equals(isAdmin);


        User new_user = new User();
        new_user.setUsername(this.username);
        new_user.setPassword(this.password);
        new_user.setEmail(this.email);
        new_user.setAge(this.age);
        new_user.setAdmin(this.is_admin);

        UserService userService = new UserService();
        userService.register(new_user);

        HttpSession session = req.getSession();
        session.setAttribute("new_user", new_user);
        session.setAttribute("message", "注册成功，请登录！");
        resp.sendRedirect("login");
     }
}