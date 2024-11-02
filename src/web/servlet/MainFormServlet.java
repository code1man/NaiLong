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

@WebServlet(name = "MainFormServlet",urlPatterns = {"/mainForm"})
public class MainFormServlet extends HttpServlet {
    private String username;
    private String password;
    private String email;
    private int age;
    private User user;

    private static final String LOGIN_FORM = "/WEB-INF/jsp/index.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher(LOGIN_FORM).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.username = req.getParameter("username");
        this.password = req.getParameter("password");
        this.email = req.getParameter("email");
        this.age = Integer.parseInt(req.getParameter("age"));
        HttpSession session = req.getSession();
        this.user = (User)session.getAttribute("loginUser");

        UserService userService = new UserService();
        userService.updateUser(user, username, password, email, age);

        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setAge(age);
        session.setAttribute("loginUser", user);     //更新session中的LoginUser属性

        this.doGet(req, resp);
    }
}
