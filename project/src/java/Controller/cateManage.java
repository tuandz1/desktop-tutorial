/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOProduct;
import entity.Block;
import entity.Brand;
import entity.Categories;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
@WebServlet(name = "cateManage", urlPatterns = {"/catemanage"})
public class cateManage extends HttpServlet {

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
            out.println("<title>Servlet cateManage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cateManage at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        if (action == null || action.isBlank()) {
            dao.getAllCate();
            List<Categories> allbrand = dao.getCate();

            dao.getAllProduct();
            List<Product> pro = dao.getPro();
            Map<Integer, Boolean> brandHasProducts = new HashMap<>();
            for (Categories cate : allbrand) {
                boolean hasProducts = false;
                for (Product product : pro) {
                    if (product.getCaid() == cate.getId()) {
                        hasProducts = true;
                        break;
                    }
                }
                brandHasProducts.put(cate.getId(), hasProducts);
            }
            request.setAttribute("brandHasProducts", brandHasProducts);
            request.setAttribute("catelist", allbrand);

            request.setAttribute("pro", pro);
            request.getRequestDispatcher("admin/cateManage.jsp").forward(request, response);
        } else {
            int ac = Integer.parseInt(action);
            if (ac == 1) {
                response.sendRedirect("createCate");
            } else if (ac == 2) {
                int id = Integer.parseInt(request.getParameter("cid"));
                Categories cate = dao.getCatebyId(id);
                request.setAttribute("ca", cate);
                request.getRequestDispatcher("admin/updateCate.jsp").forward(request, response);
            } else if (ac == 3) {
                int cid = Integer.parseInt(request.getParameter("cid"));
                dao.deleteCate(cid);
                response.sendRedirect("catemanage");
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
