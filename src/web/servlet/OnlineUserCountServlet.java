package web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="OnlineUserCountServlet", urlPatterns={"/getOnlineUserCount"})
public class OnlineUserCountServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer onlineCount = (Integer) getServletContext().getAttribute("onlineUserCount");
        if (onlineCount == null) {
            onlineCount = 0;
        }
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.write("{\"onlineUserCount\": " + onlineCount + "}");
        out.flush();
    }
}
