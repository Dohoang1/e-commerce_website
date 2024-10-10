package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import dao.ProductDAO;

@WebServlet("/topProducts")
public class TopProductsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int limit = Integer.parseInt(request.getParameter("limit"));

        ProductDAO productDAO = new ProductDAO();
        List<Product> topProducts = productDAO.getTopSellingProducts(limit);

        request.setAttribute("topProducts", topProducts);
        request.setAttribute("limit", limit);
        request.getRequestDispatcher("topProducts.jsp").forward(request, response);
    }
}