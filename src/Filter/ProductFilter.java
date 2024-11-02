package Filter;

import domain.Category;
import domain.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;

import service.ProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebFilter("/mainForm")
public class ProductFilter implements Filter {
    List<Category> categoryList = new ArrayList<>();

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        ProductService productService = new ProductService();
        categoryList = productService.getCategories();

        request.setAttribute("categoryList", categoryList);
        // 继续处理请求
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) {

    }

    @Override
    public void destroy() {
    }
}
