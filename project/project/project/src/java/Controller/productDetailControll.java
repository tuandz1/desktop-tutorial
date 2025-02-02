/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOComment;
import DAL.DAOProduct;
import entity.Brand;
import entity.Categories;
import entity.Product;
import entity.Product_Image;
import entity.Review;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "productDetailControll", urlPatterns = {"/productDetail"})
public class productDetailControll extends HttpServlet {
    DAOProduct dao = new DAOProduct();
    DAOComment daocmt = new DAOComment();
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet productDetailControll</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productDetailControll at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String pros = request.getParameter("proid");
        int proid = Integer.parseInt(pros);
        Product pro = dao.getProductbyId(proid);
       dao.getProductbyBrandId(pro.getBrand_id());
       List<Product> samebr = dao.getPro();
       dao.getProductbyCateId(pro.getCaid());
       List<Product> sameca = dao.getPro();
       dao.getProImagebyId(proid);
       List<Product_Image> pic = dao.getProimg();
       daocmt.getReviewPro(proid);
       List<Review> rv = daocmt.getCmt();
       dao.getAllBrandShop();
       List<Brand> br = dao.getBrand();
       dao.getAllCate();
       List<Categories> cate = dao.getCate();
        request.setAttribute("br", br);
        request.setAttribute("cate", cate);
        request.setAttribute("amountrv", rv.size());
        request.setAttribute("rv", rv);
        request.setAttribute("pro", pro);
        request.setAttribute("pic", pic);
        request.setAttribute("samebr", samebr);
        request.setAttribute("sameca", sameca);
        
        request.getRequestDispatcher("product.jsp").forward(request, response);
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
        processRequest(request, response);
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
