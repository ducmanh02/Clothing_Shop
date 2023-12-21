/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
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

import java.util.List;
import model.Cart;
import model.CartItem;
import model.Product;
import model.User;

/**
 *
 * @author ducmanh
 */
public class GioHangServlet extends HttpServlet {

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
            out.println("<title>Servlet GioHangServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GioHangServlet at " + request.getContextPath() + "</h1>");
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

            request.getRequestDispatcher("/view/nguoidung/GDLogin.jsp").forward(request, response);
        } else {
            User u = (User) session.getAttribute("account");
            String user_id = u.getUser_id();
            CartDAO cartdb = new CartDAO();
            Cart cart = cartdb.getCartByUserId(user_id);
            List<CartItem> listCartItem = cartdb.getAllItemInCart(cart.getCart_id()); // list san pham kem so luong va tong tien
            
            // lap tinh tong tien cua gio hang hien tai
            BigDecimal totalPrice = new BigDecimal("0");
            
            for(CartItem i : listCartItem){
                BigDecimal item = i.getTotal_price();
                totalPrice = totalPrice.add(item);

            }

            request.setAttribute("totalPrice", totalPrice); // tong tien cua gio hang
            request.setAttribute("listCartItem", listCartItem);
            request.getRequestDispatcher("/view/khachhang/GDGioHang.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        UserDAO udb = new UserDAO();
        CartDAO cdb = new CartDAO();

        User u = new User();

        try {
            u = (User) session.getAttribute("account"); // get username dang dang nhap
            User user = udb.checkUser(u.getUsername()); // get user
            System.out.println("user: "+user.getUser_id());
            if (action.equals("add")) {
                String product_id = request.getParameter("product_id");
                String quantity_raw = request.getParameter("quantity");
                
                try {
                    int quantity = Integer.parseInt(quantity_raw);
 
                    cdb.addProductToCart(user.getUser_id(), product_id, quantity);
                    response.sendRedirect("giohang");
                } catch (NumberFormatException e) {
                    System.out.println("line 109 GHServlet");
                }

            }
            if (action.equals("update")) {
                String product_id = request.getParameter("product_id");
                String quantity_raw = request.getParameter("quantity");
                try {
                    int quantity = Integer.parseInt(quantity_raw);
                    System.out.println(quantity + "hehe " + u.getUser_id() + " " + product_id);
                    cdb.updateProductInCart(u.getUser_id(), product_id, quantity);
                    response.sendRedirect("giohang");
                } catch (NumberFormatException e) {
                    System.out.println("line 122 GHServlet");
                }
            }
            if (action.equals("delete")) {
                String product_id = request.getParameter("product_id");
                cdb.deleteProductInCart(u.getUser_id(), product_id);
                System.out.println("hehe " + u.getUser_id() + " " + product_id);
                response.sendRedirect("giohang");

            }
        } catch (NullPointerException e) {
            response.sendRedirect("login");
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
