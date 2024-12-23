package web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.UserService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UsernameExistServlet", urlPatterns = "/usernameIsExist")
public class UsernameExistServlet extends HttpServlet {
    private boolean checkUsername(String username)
    {
        UserService userService = new UserService();
        return userService.checkUsername(username);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        System.out.println(username);
        resp.setContentType("text/plain");
        PrintWriter out = resp.getWriter();
        if(checkUsername(username)){
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
