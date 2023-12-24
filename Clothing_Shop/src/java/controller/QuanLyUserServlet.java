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
import java.util.List;
import model.User;

/**
 *
 * @author ducmanh
 */
@WebServlet(name = "QuanLyUserServlet", urlPatterns = {"/qluser"})
public class QuanLyUserServlet extends HttpServlet {

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
            out.println("<title>Servlet QuanLyUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuanLyUserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO usb = new UserDAO();
        try {
            if (action.equalsIgnoreCase("delete")) {
                String username = request.getParameter("username");
                usb.deleteUser(username);

                response.sendRedirect("qluser");
            }
            if (action.equalsIgnoreCase("update")) {

                //get User
                String user_id = request.getParameter("user_id");
                User user = usb.getUserById(user_id);
                request.setAttribute("user", user);
                request.getRequestDispatcher("/view/admin/GDSuaUser.jsp").forward(request, response);
            }
            if (action.equalsIgnoreCase("add")) {
                request.getRequestDispatcher("/view/admin/GDThemUser.jsp").forward(request, response);
            }
        } catch (NullPointerException e) {

            List<User> listUsers = usb.getAllUsers();
            request.setAttribute("listUsers", listUsers);
            request.getRequestDispatcher("/view/admin/GDQuanLyUser.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserDAO usb = new UserDAO();

        try {

            if (action.equalsIgnoreCase("update")) {

                //get User
                String userId = request.getParameter("userId");
                String newUsername = request.getParameter("newUsername");
                String newPassword = request.getParameter("newpassword");
                String newEmail = request.getParameter("newEmail");
                String newFullName = request.getParameter("newfullname");
                String newAddress = request.getParameter("newadress");
                String newPhone = request.getParameter("newphone");
                int newAdmin = Integer.parseInt(request.getParameter("newadmin"));

                usb.updateUser(userId, newUsername, newPassword, newEmail, newFullName, newAddress, newPhone, newAdmin);
                response.sendRedirect("qluser");

                
            }
            if (action.equalsIgnoreCase("add")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String full_name = request.getParameter("full_name");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                int is_admin = Integer.parseInt(request.getParameter("is_admin"));

                usb.createUser2(username, password, email, full_name, address, phone, is_admin);

                response.sendRedirect("qluser");
            }
        }
        catch (NullPointerException e) {

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
