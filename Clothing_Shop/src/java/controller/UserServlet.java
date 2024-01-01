/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.User;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author ducmanh
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/user"})
public class UserServlet extends HttpServlet {

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
            out.println("<title>Servlet UserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        UserDAO usb = new UserDAO();
        try {
            if (action.equalsIgnoreCase("login")) {
                request.getRequestDispatcher("view/nguoidung/GDLogin.jsp").forward(request, response);
            }
            if (action.equalsIgnoreCase("logout")) {

                session.removeAttribute("account");
                request.getRequestDispatcher("view/khachhang/GDHome.jsp").forward(request, response);
            }
            if (action.equalsIgnoreCase("signup")) {
                request.getRequestDispatcher("view/nguoidung/GDSignup.jsp").forward(request, response);
            }
            if (action.equalsIgnoreCase("update")) {

                //get User
                String user_name = request.getParameter("user_name");
                User user = usb.checkUser(user_name);

                request.setAttribute("user", user);
                request.getRequestDispatcher("/view/nguoidung/GDUpdateUser.jsp").forward(request, response);
            }

        } catch (NullPointerException e) {

            request.getRequestDispatcher("/view/components/Error404.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        UserDAO usb = new UserDAO();
        try {
            if (action.equalsIgnoreCase("login")) {

                try {
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");

                    String storedPasswordHash = usb.getPasswordStored(username);

                    if (storedPasswordHash != null && BCrypt.checkpw(password, storedPasswordHash)) {
                        // Đăng nhập thành công
                        // Tiếp tục xử lý hoặc chuyển hướng người dùng đến trang chính
                        //co tim thay tai khoan, tao session
                        User u = usb.checkUser(username);
                        session.removeAttribute("account");
                        session.setAttribute("account", u);
                        if (u.getIs_admin() == 1) {
                            response.sendRedirect("admin");
                        } else {
                            request.getRequestDispatcher("view/khachhang/GDHome.jsp").forward(request, response);
                        }
                    } else {
                        // Đăng nhập thất bại
                        // Hiển thị thông báo lỗi hoặc chuyển hướng người dùng đến trang đăng nhập lại
                        request.setAttribute("error", "username or password invalid");
                        request.getRequestDispatcher("view/nguoidung/GDLogin.jsp").forward(request, response);
                    }
                } catch (IllegalArgumentException e) {
                    request.setAttribute("error", "username or password invalid");
                    request.getRequestDispatcher("view/nguoidung/GDLogin.jsp").forward(request, response);
                }
            }

            if (action.equalsIgnoreCase("signup")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String password_repeat = request.getParameter("password_repeat");

                if (!password.equals(password_repeat)) {
                    request.setAttribute("error", "passwords are not equal");
                    request.getRequestDispatcher("view/nguoidung/GDSignup.jsp").forward(request, response);
                } else {
                    if (usb.checkUser(username) == null) {
                        // tao user moi
                        // bam pass word bang BCrypt

                        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
                        usb.createUser(username, hashedPassword);

                        request.getRequestDispatcher("/view/nguoidung/GDLogin.jsp").forward(request, response);

                    } else {
                        request.setAttribute("error", "user exists");
                        request.getRequestDispatcher("view/nguoidung/GDSignup.jsp").forward(request, response);
                    }

                }
            }
            if (action.equalsIgnoreCase("update")) {

                //get User
                String userId = request.getParameter("userId");
                String newUsername = request.getParameter("newUsername");
                String newPassword = request.getParameter("newpassword");
                String newEmail = request.getParameter("newEmail");
                String newFullName = request.getParameter("newfullname");
                String newAddress = request.getParameter("newadress");
                String newPhone = request.getParameter("newphone");
                int newAdmin = 0;
                
                session.removeAttribute("account");
                User u = usb.checkUser(newUsername);
                session.setAttribute("account", u);
                if (newPassword.equals(usb.getPasswordStored(newUsername))) {
                    usb.updateUser(userId, newUsername, newPassword, newEmail, newFullName, newAddress, newPhone, newAdmin);
                }
                else{
                    String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
                    usb.updateUser(userId, newUsername, hashedPassword, newEmail, newFullName, newAddress, newPhone, newAdmin);
                }
               
                
                response.sendRedirect("chinhsp");
            }

        } catch (NullPointerException e) {

            request.getRequestDispatcher("/view/components/Error404.jsp").forward(request, response);
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
