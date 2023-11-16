/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FeedbackDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.List;
import model.Feedback;
import model.Product;
import model.ProductTK;

/**
 *
 * @author ducmanh
 */
public class ChiTietSpServlet extends HttpServlet {

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
            out.println("<title>Servlet ChiTietSpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChiTietSpServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String product_id = request.getParameter("product_id");
        ProductDAO pdb = new ProductDAO();
        Product product = pdb.getProductByID(product_id);
        FeedbackDAO fdb = new FeedbackDAO();
        ProductTK d = pdb.getProductByID(product_id);
        request.setAttribute("Product", d);

        List<Product> listProduct = pdb.getProductLienQuan(product);
        request.setAttribute("listProduct", listProduct);

        List<Feedback> listFeedback = fdb.getFeedbackOnThisProduct(product_id);
        request.setAttribute("listFeedback", listFeedback);
        request.getRequestDispatcher("view/khachhang/GDChiTietSp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if(action.equals("addFeedback")){
           String product_id = request.getParameter("product_id");
           FeedbackDAO fdb = new FeedbackDAO();
           Feedback f = new Feedback("FDB100",product_id ,"PR01" , Integer.parseInt(request.getParameter("rating")),request.getParameter("comment") , Timestamp.valueOf(request.getParameter("create_at")));
           fdb.insert(f);
           response.sendRedirect("chitiepsp?"+product_id);
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
