/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CartDAO;
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
import java.math.BigDecimal;
import java.util.List;
import model.Cart;
import model.CartItem;
import model.Order;
import model.OrderItem;
import model.User;

/**
 *
 * @author ducmanh
 */
@WebServlet(name="QuanLyOrderServlet", urlPatterns={"/qlorder"})
public class QuanLyOrderServlet extends HttpServlet {
   



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        OrderDAO odb = new OrderDAO();
        ProductDAO pdb = new ProductDAO();
        if (session.getAttribute("account") == null ) {
            request.setAttribute("error", "Ban Can dang nhap");
            request.getRequestDispatcher("/view/nguoidung/GDLogin.jsp").forward(request, response);
        } else {
            try {
                User u = (User) session.getAttribute("account");
                String user_id = u.getUser_id();
                if (action.equals("showAll")) {

                    List<Order> listorder = odb.getAllOrder();
                    request.setAttribute("orders", listorder);

                    request.getRequestDispatcher("/view/admin/GDQuanLyDonHang.jsp").forward(request, response);

                }
                if (action.equals("showItem")) {
                    String order_id = request.getParameter("order_id");
                    List<OrderItem> list = odb.getOrderItemByOrderId(order_id);
                    request.setAttribute("orders", list);

                    request.getRequestDispatcher("/view/admin/GDChiTietDh.jsp").forward(request, response);
                }
                if (action.equals("changeStatus")) {
                    String order_id = request.getParameter("order_id");
                    String newStatus = request.getParameter("newStatus");
                    odb.updateStatusOrder(order_id, newStatus);
                    //get list order items
                    List<OrderItem> listOrderItem = odb.getOrderItemByOrderId(order_id);
                    //giam stock cua product 
                    for(OrderItem o : listOrderItem){
                        int decrease = o.getProduct().getStock_quantity() - o.getQuantity();
                        pdb.updateStock(o.getProduct().getProduct_id(),decrease);
                    }
                    
                    
                    response.sendRedirect("qlorder?action=showAll");
                }


            } catch (NullPointerException e) {
                request.getRequestDispatcher("/view/components/Error404.jsp").forward(request, response);
            }
        }
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

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
