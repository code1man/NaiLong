package Filter;

import domain.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;

import service.ProductService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebFilter("/index.jsp")
public class ProductFilter implements Filter {
    ProductService productService = new ProductService();
    Map<Product.ProductType, List<Product>> productsByType;

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        request.setAttribute("productsByType", productsByType);
        // 继续处理请求
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) {
        productService = new ProductService();
        productsByType = productService.getProductsByType();
    }

    @Override
    public void destroy() {
    }
}
