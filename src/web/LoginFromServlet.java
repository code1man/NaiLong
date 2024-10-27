package web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LoginFromServlet", urlPatterns = "/LoginFromServlet")
public class LoginFromServlet extends HttpServlet {
    public static final String LOGIN = "/WEB-INF/jsp/LoginPage.jsp";

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(LOGIN).forward(request, response);
    }
}
