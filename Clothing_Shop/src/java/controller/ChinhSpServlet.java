/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Brand;
import model.Category;
import model.Product;
import model.ProductTK;

/**
 *
 * @author ducmanh
 */
public class ChinhSpServlet extends HttpServlet {

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
            out.println("<title>Servlet ChinhSpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChinhSpServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO pdb = new ProductDAO();
        List<Product> listProduct = pdb.getAll();
        request.setAttribute("listProduct", listProduct);

        List<ProductTK> listProductTK = pdb.getProductBanChay();
        request.setAttribute("listProductTK", listProductTK);

        BrandDAO bdb = new BrandDAO();
        List<Brand> listBrand = bdb.getAll();
        request.setAttribute("listBrand", listBrand);

        CategoryDAO cdb = new CategoryDAO();
        List<Category> listCategory = cdb.getAll();
        request.setAttribute("listCategory", listCategory);
        
        request.getRequestDispatcher("view/khachhang/GDChinhKH.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BrandDAO bdb = new BrandDAO();
        List<Brand> listBrand = bdb.getAll();
        request.setAttribute("listBrand", listBrand);

        CategoryDAO cdb = new CategoryDAO();
        List<Category> listCategory = cdb.getAll();
        request.setAttribute("listCategory", listCategory);

        String action = request.getParameter("action");
        if (action.equals("search")) {
            String tuKhoa = request.getParameter("tuKhoa");
            ProductDAO pdb = new ProductDAO();
            List<Product> listProduct = pdb.getProductTKTheoTen(tuKhoa);
            request.setAttribute("listProduct", listProduct);

            List<ProductTK> listProductTK = pdb.getProductBanChay();
            request.setAttribute("listProductTK", listProductTK);
            request.getRequestDispatcher("view/khachhang/GDChinhKH.jsp").forward(request, response);
        }
        else{
            request.getRequestDispatcher("chinhsp").forward(request, response);
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
