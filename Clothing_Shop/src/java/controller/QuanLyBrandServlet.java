/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Brand;

/**
 *
 * @author ducmanh
 */
public class QuanLyBrandServlet extends HttpServlet {

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
            out.println("<title>Servlet QuanLyBrandServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuanLyBrandServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        BrandDAO bdb = new BrandDAO();
        try {
            if(action.equals("add")){
                request.getRequestDispatcher("/view/admin/GDThemBrand.jsp").forward(request, response);
            }
            if(action.equals("update")){
                String brand_id = request.getParameter("brand_id");
                request.setAttribute("b", bdb.getBrandById(brand_id));
                request.getRequestDispatcher("/view/admin/GDSuaBrand.jsp").forward(request, response);
            }
            if(action.equals("delete")){
                String brand_id = request.getParameter("brand_id");
                bdb.delete(brand_id);
                response.sendRedirect("qlbrand");
            }
        } catch (NullPointerException e) {
            
            List<Brand> listBrand = bdb.getAll();
            request.setAttribute("listBrand", listBrand);
            request.getRequestDispatcher("/view/admin/GDQuanLyBrand.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        BrandDAO bdb = new BrandDAO();
        try {
            if(action.equals("add")){
                
                String brand_name = request.getParameter("brand_name");
                if(bdb.getBrandByName(brand_name)==null){
                    bdb.insert(brand_name);
                    response.sendRedirect("qlbrand");
                }
                else{
                    request.setAttribute("error", "ten brand da ton tai");
                    request.getRequestDispatcher("/view/admin/GDThemBrand.jsp").forward(request, response);
                }
                
            }
            if(action.equals("update")){
                String brand_id = request.getParameter("brand_id");
                String brand_name = request.getParameter("brand_name");
                
                if(bdb.getBrandByName(brand_name)==null){
                    bdb.update(brand_name, brand_id);
                    response.sendRedirect("qlbrand");
                }
                else{
                    request.setAttribute("error", "ten brand da ton tai");
                    request.getRequestDispatcher("/view/admin/GDSuaBrand.jsp").forward(request, response);
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
