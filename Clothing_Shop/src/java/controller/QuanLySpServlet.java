/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.util.List;

import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author ducmanh
 */
@WebServlet(name = "QuanLySpServlet", urlPatterns = {"/qlsp"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class QuanLySpServlet extends HttpServlet {

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
            out.println("<title>Servlet QuanLySpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuanLySpServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ProductDAO pdb = new ProductDAO();
        try {
            if (action.equalsIgnoreCase("delete") && action != null) {
                String product_id = request.getParameter("product_id");
                pdb.delete(product_id);
                response.sendRedirect("qlsp");
            }
            if (action.equalsIgnoreCase("update") && action != null) {

                //get all brand
                BrandDAO bdb = new BrandDAO();
                List<Brand> listBrands = bdb.getAll();
                request.setAttribute("listBrands", listBrands);
                // get all category
                CategoryDAO cdb = new CategoryDAO();
                List<Category> listCategories = cdb.getAll();
                request.setAttribute("listCategories", listCategories);

                //get product
                String product_id = request.getParameter("product_id");
                Product p = pdb.getProductByID(product_id);
                request.setAttribute("product", p);
                request.getRequestDispatcher("/view/admin/GDSuaSp.jsp").forward(request, response);
            }
            if (action.equalsIgnoreCase("add") && action != null) {

                //get all brand
                BrandDAO bdb = new BrandDAO();
                List<Brand> listBrands = bdb.getAll();
                request.setAttribute("listBrands", listBrands);
                // get all category
                CategoryDAO cdb = new CategoryDAO();
                List<Category> listCategories = cdb.getAll();
                request.setAttribute("listCategories", listCategories);

               
                request.getRequestDispatcher("/view/admin/GDThemSp.jsp").forward(request, response);
            }

        } catch (NullPointerException e) {

            List<Product> listProduct = pdb.getAll();
            request.setAttribute("listProduct", listProduct);

            request.getRequestDispatcher("/view/admin/GDQuanLySp.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ProductDAO pdb = new ProductDAO();
        try {
            if (action.equalsIgnoreCase("add") && action != null) {

                String product_name = request.getParameter("product_name");
                String description = request.getParameter("description");
                String price_raw = request.getParameter("price");
                String stock_quantity_raw = request.getParameter("stock_quantity");
                String brand_id = request.getParameter("brand_id");
                String category_id = request.getParameter("category_id");
                String size = request.getParameter("size");
                
                 // Thao tác file ảnh
                String uploadPath = "C:\\Users\\ducma\\OneDrive\\Desktop\\Ki_7\\LapTrinhWeb\\Project\\Clothing_Shop\\web\\asset\\img_product";  // Đường dẫn đến thư mục lưu trữ ảnh
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                // lấy đường dẫn
                Part filePart = request.getPart("image_url");
                String fileName = getFileName(filePart);

                // Lưu trữ ảnh vào thư mục trên máy chủ
                Path imagePath = Paths.get(uploadPath, fileName);
                Files.copy(filePart.getInputStream(), imagePath, StandardCopyOption.REPLACE_EXISTING);

                // modify path ảnh lưu ( modify để có thể hiển thị)
                String imgPath_raw = imagePath.toString();
                String img_url =  imgPath_raw.substring(75); // cắt đoạn ký tự đầu
                System.out.println(img_url);

                
                
                
                try {
                    BigDecimal price = new BigDecimal(price_raw);
                    int stock_quantity = Integer.parseInt(stock_quantity_raw);
                    // Lưu đường dẫn của ảnh vào cơ sở dữ liệu
                    pdb.insert(product_name, description, price, stock_quantity, brand_id, category_id, img_url, size);
                    response.sendRedirect("qlsp");

                } catch (NumberFormatException e) {
                    System.out.println(e);
                }

            }
            if (action.equalsIgnoreCase("update") && action != null) {
                String product_id = request.getParameter("product_id");
                String product_name = request.getParameter("product_name");
                String description = request.getParameter("description");
                String price_raw = request.getParameter("price");
                String stock_quantity_raw = request.getParameter("stock_quantity");
                String brand_id = request.getParameter("brand_id");
                String category_id = request.getParameter("category_id");
                String size = request.getParameter("size");
                
                // Thao tác file ảnh
                String uploadPath = "C:\\Users\\ducma\\OneDrive\\Desktop\\Ki_7\\LapTrinhWeb\\Project\\Clothing_Shop\\web\\asset\\img_product";  // Đường dẫn đến thư mục lưu trữ ảnh
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                // lấy đường dẫn
                Part filePart = request.getPart("image_url");
                String fileName = getFileName(filePart);

                // Lưu trữ ảnh vào thư mục trên máy chủ
                Path imagePath = Paths.get(uploadPath, fileName);
                Files.copy(filePart.getInputStream(), imagePath, StandardCopyOption.REPLACE_EXISTING);

                // modify path ảnh lưu ( modify để có thể hiển thị)
                String imgPath_raw = imagePath.toString();
                String img_url =  imgPath_raw.substring(75); // cắt đoạn ký tự đầu
                System.out.println(img_url);
                
                try {
                    BigDecimal price = new BigDecimal(price_raw);
                    int stock_quantity = Integer.parseInt(stock_quantity_raw);
                    pdb.update(product_id, product_name, description, price, stock_quantity, brand_id, category_id, img_url, size);
                    System.out.println("22 " + product_name + " " + brand_id + " " + category_id);
                    
                    
                    response.sendRedirect("qlsp");

                } catch (NumberFormatException e) {
//                    System.out.println("2222 " + product_name + " " + description + " " + image_url);
                }

            }

        } catch (NullPointerException e) {

            List<Product> listProduct = pdb.getAll();
            request.setAttribute("listProduct", listProduct);

            request.getRequestDispatcher("/view/admin/GDQuanLySp.jsp").forward(request, response);
        }
    }
    
    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : partHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
