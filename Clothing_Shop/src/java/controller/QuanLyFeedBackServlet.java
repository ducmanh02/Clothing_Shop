/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.FeedbackDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Feedback;
import model.Order;
import model.OrderItem;
import model.User;

/**
 *
 * @author ducmanh
 */
@WebServlet(name="QuanLyFeedBackServlet", urlPatterns={"/qlfeedback"})
public class QuanLyFeedBackServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QuanLyFeedBackServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuanLyFeedBackServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        FeedbackDAO fdb = new FeedbackDAO();
        ProductDAO pdb = new ProductDAO();
        if (session.getAttribute("account") == null ) {
            request.setAttribute("error", "Ban Can dang nhap");
            request.getRequestDispatcher("/view/nguoidung/GDLogin.jsp").forward(request, response);
        } else {
            try {
                User u = (User) session.getAttribute("account");
                String user_id = u.getUser_id();
                if (action.equals("showAll")) {

                    List<Feedback> listfb = fdb.getAll();
                    request.setAttribute("listfb", listfb);

                    request.getRequestDispatcher("/view/admin/GDQuanLyFeedBack.jsp").forward(request, response);

                }
                if (action.equals("showItem")) {
//                    String order_id = request.getParameter("product_id");
//                    List<Feedback> list = fdb.getOrderItemByOrderId(order_id);
//                    request.setAttribute("orders", list);

                    request.getRequestDispatcher("/view/admin/GDChiTietDh.jsp").forward(request, response);
                }



            } catch (NullPointerException e) {
                request.getRequestDispatcher("/view/components/Error404.jsp").forward(request, response);
            }
        }
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
