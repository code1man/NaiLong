package Filter;

import domain.Category;
import domain.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;

import service.ProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter(urlPatterns = {"/mainForm", "/ShoppingCart", "/AddItemToCart", "/RemoveItem"})
public class CategoryFilter implements Filter {
    List<Category> categoryList = new ArrayList<>();
    List<Product> productList = new ArrayList<>();

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        ProductService productService = new ProductService();
        categoryList = productService.getCategories();
        productList = productService.getProducts();

        request.setAttribute("categoryList", categoryList);
        request.setAttribute("productList", productList);

        System.out.println("123456");
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
