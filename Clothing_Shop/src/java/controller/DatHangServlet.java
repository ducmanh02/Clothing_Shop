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
import model.Order;
import model.OrderItem;
import model.User;

/**
 *
 * @author ducmanh
 */
public class DatHangServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        OrderDAO odb = new OrderDAO();
        UserDAO udb = new UserDAO();
        if (session.getAttribute("account") == null) {
            request.setAttribute("error", "Ban Can dang nhap");
            request.getRequestDispatcher("/view/nguoidung/GDLogin.jsp").forward(request, response);
        } else {
            try {
                User u = (User) session.getAttribute("account");
                String user_id = u.getUser_id();
                if (action.equals("showAll")) {

                    List<Order> listorder = odb.getAllOrderByUserId(user_id);
                    request.setAttribute("orders", listorder);

                    request.getRequestDispatcher("/view/khachhang/GDDSDonHang.jsp").forward(request, response);

                }
                if (action.equals("showItem")) {
                    String order_id = request.getParameter("order_id");
                    List<OrderItem> list = odb.getOrderItemByOrderId(order_id);
                    request.setAttribute("orders", list);

                    request.getRequestDispatcher("/view/khachhang/GDChiTietDh.jsp").forward(request, response);
                }
                if (action.equals("cancel")) {
                    String order_id = request.getParameter("order_id");
                    odb.updateStatusOrder(order_id, "canceled");
                    List<Order> listorder = odb.getAllOrderByUserId(user_id);
                    request.setAttribute("orders", listorder);

                    request.getRequestDispatcher("/view/khachhang/GDDSDonHang.jsp").forward(request, response);

                }
                if (action.equals("order")) {
                    User user = udb.checkUser(u.getUsername());

                    CartDAO cartdb = new CartDAO();
                    Cart cart = cartdb.getCartByUserId(user_id);
                    List<CartItem> listCartItem = cartdb.getAllItemInCart(cart.getCart_id()); // list san pham kem so luong va tong tien
                    if (!listCartItem.isEmpty()) {

                        // lap tinh tong tien cua gio hang hien tai
                        BigDecimal totalPrice = new BigDecimal("0");

                        for (CartItem i : listCartItem) {
                            BigDecimal item = i.getTotal_price();
                            totalPrice = totalPrice.add(item);

                        }
                        request.setAttribute("user", user);
                        request.setAttribute("totalPrice", totalPrice); // tong tien cua gio hang
                        request.setAttribute("listCartItem", listCartItem);
                        request.getRequestDispatcher("/view/khachhang/GDDatHang.jsp").forward(request, response);

                    }
                    response.sendRedirect("chinhsp");
                }

            } catch (NullPointerException e) {
                request.getRequestDispatcher("/view/components/Error404.jsp").forward(request, response);
            }
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
        String status = "Pending";
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
