package Filter;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnlineUserListener implements HttpSessionListener {

    private static int onlineUserCount = 0;

    public static int getOnlineUserCount() {
        return onlineUserCount;
    }

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        HttpSession session = httpSessionEvent.getSession();
        onlineUserCount++;
        session.getServletContext().setAttribute("onlineUserCount", onlineUserCount);
        // 将在线人数储存在应用范围，便于全局访问

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        HttpSession session = httpSessionEvent.getSession();
        onlineUserCount--;
        session.getServletContext().setAttribute("onlineUserCount", onlineUserCount);
    }
}
