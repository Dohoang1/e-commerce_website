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

@WebServlet("/orderedProducts")
public class OrderedProductsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        ProductDAO productDAO = new ProductDAO();
        List<Product> orderedProducts = productDAO.getOrderedProducts(startDate, endDate);

        request.setAttribute("orderedProducts", orderedProducts);
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
        request.getRequestDispatcher("orderedProducts.jsp").forward(request, response);
    }
}