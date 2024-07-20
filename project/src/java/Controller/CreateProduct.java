/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOProduct;
import entity.Brand;
import entity.Categories;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 *
 * @author admin
 */
@MultipartConfig
@WebServlet(name = "CreateProduct", urlPatterns = {"/createProduct"})
public class CreateProduct extends HttpServlet {
    DAOProduct dao = new DAOProduct();
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
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dao.getAllProduct();
        List<Product> allpro = dao.getPro();
        dao.getAllCate();
        List<Categories> allcate = dao.getCate();
        dao.getAllBrand();
        List<Brand> brand = dao.getBrand();
        request.setAttribute("cate", allcate);
        request.setAttribute("br", brand);
        request.getRequestDispatcher("admin/createProduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String pr = request.getParameter("price");
        String st = request.getParameter("stock");
        String br = request.getParameter("brand");
        String ca = request.getParameter("cate");
        String date = request.getParameter("date");
        String des = request.getParameter("des");
        int stock = Integer.parseInt(st);
        int caid = Integer.parseInt(ca);
        int brid = Integer.parseInt(br);
        double price = Double.parseDouble(pr);
        
        String customDirectory = "D:/SUM24/SWP/Git/WatchProject12/web/img";
        Part part = request.getPart("img");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        Path imagePath = Paths.get(customDirectory, filename);
        if (!Files.exists(Paths.get(customDirectory))) {
            Files.createDirectories(Paths.get(customDirectory));
        }
        part.write(imagePath.toString());
        
        dao.getAllProduct();
        List<Product> allpro = dao.getPro();
        int flag = 0;
        for (Product product : allpro) {
            if(product.getProName().equals(name)|| product.getImg().equals("img/" + filename)){
                flag++;
            }
        }
        if(flag == 0){
        dao.InsertProduct(name, caid, des, "img/" + filename, price, brid, stock, date);
        request.setAttribute("mes", "success full");
        request.setAttribute("name", name);
        request.getRequestDispatcher("admin/insertProductImg.jsp").forward(request, response);
        } else{
            dao.getAllProduct();
        dao.getAllCate();
        List<Categories> allcate = dao.getCate();
        dao.getAllBrand();
        List<Brand> brand = dao.getBrand();
        request.setAttribute("cate", allcate);
        request.setAttribute("br", brand);
        request.setAttribute("mes", "Dulicate");
        request.getRequestDispatcher("admin/createProduct.jsp").forward(request, response);
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
