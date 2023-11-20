/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.OrderDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;

import java.time.LocalDateTime;
import java.util.List;
import model.Cart;
import model.CartItem;
import model.User;

/**
 *
 * @author ducmanh
 */
public class DatHangServlet extends HttpServlet {

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
            out.println("<title>Servlet DatHangServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DatHangServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("account") == null) {
            request.setAttribute("error", "Ban Can dang nhap");
            request.getRequestDispatcher("/view/khachhang/GDDatHang.jsp").forward(request, response);
        } else {
            User u = (User) session.getAttribute("account");
            String user_id = u.getUser_id();
            CartDAO cartdb = new CartDAO();
            Cart cart = cartdb.getCartByUserId(user_id);
            List<CartItem> listCartItem = cartdb.getAllItemInCart(cart.getCart_id()); // list san pham kem so luong va tong tien

            // lap tinh tong tien cua gio hang hien tai
            BigDecimal totalPrice = new BigDecimal("0");

            for (CartItem i : listCartItem) {
                BigDecimal item = i.getTotal_price();
                totalPrice = totalPrice.add(item);

            }


            request.setAttribute("totalPrice", totalPrice); // tong tien cua gio hang
            request.setAttribute("listCartItem", listCartItem);
            request.getRequestDispatcher("/view/khachhang/GDDatHang.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String full_name = request.getParameter("full_name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        HttpSession session = request.getSession();
        //lau user_id
        UserDAO udb = new UserDAO();
        User u = (User) session.getAttribute("account");
        String user_id = u.getUser_id();
        //lay cart_id 
        CartDAO cartdb = new CartDAO();
        Cart cart = cartdb.getCartByUserId(user_id);
        List<CartItem> listCartItem = cartdb.getAllItemInCart(cart.getCart_id()); // list san pham kem so luong va tong tien
        
        
        // lap tinh tong tien cua gio hang hien tai
        BigDecimal totalPrice = new BigDecimal("0");
        for (CartItem i : listCartItem) {
            BigDecimal item = i.getTotal_price();
            totalPrice = totalPrice.add(item);
        }
        // Lay thoi gian dat hang
        LocalDateTime orderDate = LocalDateTime.now();

        //set status :pending
        String status= "Pending";
        //tao order, ham tra ve order_id
        OrderDAO odb = new OrderDAO();
        String order_id = odb.createOrder(user_id, totalPrice, orderDate, status);
        
        // luu thong tin cart_item vao order_item
        for (CartItem i : listCartItem) {
            odb.createOderItem(order_id, i.getProduct().getProduct_id(), i.getQuantity(), i.getTotal_price());
            
        }
       // xoa gio hang cua user hien tai 
       CartDAO cdb = new CartDAO();
       cdb.removeItemsFromCart(cart, listCartItem);
        
        request.getRequestDispatcher("/view/khachhang/GDDatHangThanhCong.jsp").forward(request, response);
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
