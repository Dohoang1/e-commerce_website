package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import dao.ProductDAO;

@WebServlet("/add")
public class AddProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/add.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        double stock = Double.parseDouble(request.getParameter("stock"));

        if (price <= 100) {
            request.setAttribute("errorMessage", "Giá phải lớn hơn 100");
            request.getRequestDispatcher("view/add.jsp").forward(request, response);
            return;
        }

        if (stock <= 10) {
            request.setAttribute("errorMessage", "Tồn kho phải lớn hơn 10");
            request.getRequestDispatcher("view/add.jsp").forward(request, response);
            return;
        }

        Product product = new Product(name, price, discount, stock);
        ProductDAO productDAO = new ProductDAO();
        boolean success = productDAO.addProduct(product);

        if (success) {
            request.getSession().setAttribute("successMessage", "Thêm sản phẩm thành công");
            response.sendRedirect("list");
        } else {
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi thêm sản phẩm");
            request.getRequestDispatcher("view/add.jsp").forward(request, response);
        }
    }
}