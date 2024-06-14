/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOProduct;
import entity.Brand;
import entity.Categories;
import entity.Product;
import entity.Product_Image;
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
@WebServlet(name = "ProductManager", urlPatterns = {"/productmanage"})
public class ProductManager extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductManager at " + request.getContextPath() + "</h1>");
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
        String ac = request.getParameter("action");

        if (ac == null) {
            dao.getAllProduct();
            List<Product> allpro = dao.getPro();
            dao.getAllCate();
            List<Categories> allcate = dao.getCate();
            dao.getAllBrand();
            List<Brand> allbr = dao.getBrand();
            request.setAttribute("pro", allpro);
            request.setAttribute("cate", allcate);
            request.setAttribute("br", allbr);
            request.getRequestDispatcher("admin/Productmanager.jsp").forward(request, response);
        } else {
            int action = Integer.parseInt(ac);
            if (action == 1) {
                response.sendRedirect("createProduct");
            }
            if (action == 2) {
                int prid = Integer.parseInt(request.getParameter("pid"));
                dao.DeleteProduct(prid);
                request.setAttribute("mess", prid);
                response.sendRedirect("productmanage");
            } else if (action == 3) {
                int prid = Integer.parseInt(request.getParameter("pid"));
                Product pro = dao.getProductbyId(prid);
                dao.getAllCate();
                List<Categories> allcate = dao.getCate();
                dao.getAllBrand();
                List<Brand> allbr = dao.getBrand();
                dao.getProImagebyId(prid);
                List<Product_Image> imgs = dao.getProimg();
                request.setAttribute("cate", allcate);
                request.setAttribute("imgs", imgs);
                request.setAttribute("br", allbr);
                request.setAttribute("pro", pro);
                request.getRequestDispatcher("admin/updateProduct.jsp").forward(request, response);
            }
        }
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
       String ac = request.getParameter("action");
       String txt = request.getParameter("txt");
        if (ac == null) {
            dao.searchProduct(txt);
            List<Product> allpro = dao.getPro();
            dao.getAllCate();
            List<Categories> allcate = dao.getCate();
            dao.getAllBrand();
            List<Brand> allbr = dao.getBrand();
            request.setAttribute("pro", allpro);
            request.setAttribute("cate", allcate);
            request.setAttribute("txt", txt);
            request.setAttribute("br", allbr);
            request.getRequestDispatcher("admin/Productmanager.jsp").forward(request, response);
        } else {
            int action = Integer.parseInt(ac);
            if (action == 1) {
                response.sendRedirect("createProduct");
            }
            if (action == 2) {
                int prid = Integer.parseInt(request.getParameter("pid"));
                dao.DeleteProduct(prid);
                request.setAttribute("mess", prid);
                response.sendRedirect("productmanage");
            } else if (action == 3) {
                int prid = Integer.parseInt(request.getParameter("pid"));
                Product pro = dao.getProductbyId(prid);
                dao.getAllCate();
                List<Categories> allcate = dao.getCate();
                dao.getAllBrand();
                List<Brand> allbr = dao.getBrand();
                request.setAttribute("cate", allcate);
                request.setAttribute("br", allbr);
                request.setAttribute("pro", pro);
                request.getRequestDispatcher("admin/updateProduct.jsp").forward(request, response);
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
