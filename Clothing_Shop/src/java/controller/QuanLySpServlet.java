/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;

/**
 *
 * @author ducmanh
 */
@WebServlet(name = "QuanLySpServlet", urlPatterns = {"/qlsp"})
public class QuanLySpServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QuanLySpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuanLySpServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ProductDAO pdb = new ProductDAO();
        try {
            if (action.equalsIgnoreCase("delete") && action != null) {
                String product_id = request.getParameter("product_id");
                pdb.delete(product_id);
            }
            if (action.equalsIgnoreCase("update") && action != null) {
                String product_id = request.getParameter("product_id");
                pdb.delete(product_id);
            }
            if (action.equalsIgnoreCase("add") && action != null) {
                request.getRequestDispatcher("/view/admin/GDThemSp.jsp").forward(request, response);
            }
            
        } catch (NullPointerException e) {

            List<Product> listProduct = pdb.getAll();
            request.setAttribute("listProduct", listProduct);

            request.getRequestDispatcher("/view/admin/GDQuanLySp.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ProductDAO pdb = new ProductDAO();
        try {
            if (action.equalsIgnoreCase("add") && action != null) {
                String product_name = request.getParameter("product_name");
                String description = request.getParameter("description");
                String price = request.getParameter("price");
                String stock_quantity = request.getParameter("stock_quantity");
                String brand_id = request.getParameter("brand_id");
                String category_id = request.getParameter("category_id");
                String image_url = request.getParameter("image_url");
                System.out.println(product_name + " " + description + " " + image_url);
            }
            
        } catch (NullPointerException e) {

            List<Product> listProduct = pdb.getAll();
            request.setAttribute("listProduct", listProduct);

            request.getRequestDispatcher("/view/admin/GDQuanLySp.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
