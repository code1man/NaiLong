package Filter;

import domain.LogActionType;
import domain.User;
import domain.UserLog;
import service.LogService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class LogFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) req;
        String requestURI = httpRequest.getRequestURI();
        HttpSession session = httpRequest.getSession();

        // 获取当前用户
        User user = (User) session.getAttribute("loginUser");

        if (user == null) {
            filterChain.doFilter(req, resp);
            return;
        }
        int userId = user.getId();

        int itemId = -1;
        Object idObject = req.getAttribute("item");
        if (idObject != null)
            itemId = (int) idObject;

        LogService logService = new LogService();
        LogActionType actionType = logService.JudgeLogActionType(requestURI);
        if (actionType != null) {
            UserLog userLog = new UserLog(userId, actionType, itemId);
            session.setAttribute("userLog", userLog);
            logService.AddLog(userLog);
        }

        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {
    }
}
