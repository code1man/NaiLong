package web.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UsernameExistServlet", urlPatterns = "/usernameIsExist")
public class UsernameExistServlet extends HttpServlet {
    boolean checkUsername(String username)
    {
        UserService userService = new UserService();
        return userService.checkUsername(username);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        resp.setContentType("text/plain");
        PrintWriter out = resp.getWriter();
        if(!checkUsername(username)){
            out.print("用户名存在");
        }
        else{
            out.print("用户名不存在");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
