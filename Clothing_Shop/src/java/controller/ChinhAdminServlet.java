/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Map;
import model.Product;
import model.User;

/**
 *
 * @author ducmanh
 */
public class ChinhAdminServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
                    HttpSession session = request.getSession();
        UserDAO udb = new UserDAO();
        OrderDAO odb = new OrderDAO();
        User u = (User) session.getAttribute("account"); // get username dang dang nhap
        User user = udb.checkUser(u.getUsername()); // get user
        if(user.getIs_admin() == 1){
            
            //thong ke doanh thu
//            Map<Product, BigDecimal> productTotals = odb.getTKDoanhThuTheoSP();
//            request.setAttribute("productTotals", productTotals);
            request.getRequestDispatcher("view/admin/GDChinhAdmin.jsp").forward(request, response);
            
        }
        else{
            response.sendRedirect("chinhsp");
        }
        }
        catch(NullPointerException e){
            response.sendRedirect("chinhsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        request.getRequestDispatcher("view/admin/GDChinhAdmin.jsp").forward(request, response);
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
