package web.servlet;

import Persistence.SearchDaoImpl;
import com.google.gson.Gson;
import domain.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchServlet", urlPatterns = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String SearchContent = req.getParameter("SearchContent");
        if (SearchContent != null && SearchContent.length() > 0) {
            SearchDaoImpl searchDao = new SearchDaoImpl();
            List<Item> searchResults = searchDao.SearchItems(SearchContent);  // 调用服务层方法查询数据库
            String json = new Gson().toJson(searchResults);  // 使用 Gson 将结果转换为 JSON 字符串

            resp.setContentType("application/json");
            resp.getWriter().write(json);
        }
    }
}
