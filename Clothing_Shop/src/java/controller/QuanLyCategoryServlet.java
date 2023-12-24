/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;

/**
 *
 * @author ducmanh
 */
public class QuanLyCategoryServlet extends HttpServlet {

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
            out.println("<title>Servlet QuanLyCategoryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuanLyCategoryServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cdb = new CategoryDAO();
        String action = request.getParameter("action");
        try {
            if (action.equals("add")) {
                request.getRequestDispatcher("/view/admin/GDThemCategory.jsp").forward(request, response);
            }
            if (action.equals("update")) {
                String category_id = request.getParameter("category_id");
                request.setAttribute("c", cdb.getCategoryByID(category_id));
                request.getRequestDispatcher("/view/admin/GDSuaCategory.jsp").forward(request, response);
            }
            if (action.equals("delete")) {
                String category_id = request.getParameter("category_id");
                cdb.delete(category_id);
                response.sendRedirect("qlcategory");
            }
        } catch (NullPointerException e) {


            request.setAttribute("listCategory", cdb.getAll());
            request.getRequestDispatcher("/view/admin/GDQuanLyCategory.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        CategoryDAO cdb = new CategoryDAO();
        try {
            if (action.equals("add")) {

                String category_name = request.getParameter("category_name");
                if (cdb.getCategoryByName(category_name) == null) {
                    cdb.insert(category_name);
                    response.sendRedirect("qlcategory");
                } else {
                    request.setAttribute("error", "ten category da ton tai");
                    request.getRequestDispatcher("/view/admin/GDThemCategory.jsp").forward(request, response);
                }

            }
            if (action.equals("update")) {
                String category_id = request.getParameter("category_id");
                String category_name = request.getParameter("category_name");

                if (cdb.getCategoryByName(category_name) == null) {
                    cdb.update(category_name, category_id);
                    response.sendRedirect("qlcategory");
                } else {
                    request.setAttribute("error", "ten category da ton tai");
                    request.getRequestDispatcher("/view/admin/GDSuaCategory.jsp").forward(request, response);
                }
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
