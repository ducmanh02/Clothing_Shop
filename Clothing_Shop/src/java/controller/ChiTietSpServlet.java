/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FeedbackDAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;
import model.Product;
import model.ProductTK;
import model.User;

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
        ProductTK productTK = pdb.getProductTKByID(product_id);
        request.setAttribute("Product", productTK);

        FeedbackDAO fdb = new FeedbackDAO();
        List<Feedback> listFeedback = fdb.getFeedbackOnThisProduct(product_id);
        request.setAttribute("listFeedback", listFeedback);

        List<ProductTK> listProduct = pdb.getProductTKLienQuan(pdb.getProductTKByID(product_id));
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("view/khachhang/GDChiTietSp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO udb = new UserDAO();
        FeedbackDAO fdb = new FeedbackDAO();
        if (action.equals("addFeedback")) {
            HttpSession session = request.getSession();

            if (session.getAttribute("account") == null) {
                request.setAttribute("error", "Ban Can dang nhap");

                request.getRequestDispatcher("/view/nguoidung/GDLogin.jsp").forward(request, response);
            } else {
                String product_id = request.getParameter("product_id");

                String comment = request.getParameter("comment");
                String rating = request.getParameter("rating");
                String created_at = request.getParameter("created_at");
                User u = (User) session.getAttribute("account");
                User user = udb.checkUser(u.getUsername());

                // format time
                String dateFormat = "yyyy-MM-dd HH:mm:ss";
                // Tạo đối tượng SimpleDateFormat để phân tích chuỗi thành đối tượng Date
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateFormat);

                try {
                    // Phân tích chuỗi thành đối tượng Date
                    java.util.Date date;
                    date = simpleDateFormat.parse(created_at);
                    // Chuyển đối tượng Date thành đối tượng Timestamp
                    Timestamp timestamp = new Timestamp(date.getTime());
                    fdb.insert(user.getUser_id(),product_id ,Integer.parseInt(rating),comment,timestamp);
                    response.sendRedirect("chitietsp?product_id=" + product_id);
                } catch (ParseException ex) {
                    System.out.println(ex);
                }

//            Feedback f = new Feedback("FDB100", product_id, "PR01", Integer.parseInt(request.getParameter("rating")), request.getParameter("comment"), Timestamp.valueOf(request.getParameter("create_at")));
//            fdb.insert(f);
                
            }

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
