/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOProduct;
import entity.Block;
import entity.Brand;
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
@WebServlet(name = "brandManage", urlPatterns = {"/brandmanage"})
public class brandManage extends HttpServlet {

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
            out.println("<title>Servlet brandManage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet brandManage at " + request.getContextPath() + "</h1>");
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
            dao.getAllBrand();
            List<Brand> allbrand = dao.getBrand();
            dao.getBlockBrand();
            List<Block> allbl = dao.getBl();
            dao.getAllProduct();
            List<Product> pro = dao.getPro();
            Map<Integer, Boolean> brandHasProducts = new HashMap<>();
            for (Brand brand : allbrand) {
                boolean hasProducts = false;
                for (Product product : pro) {
                    if (product.getBrand_id() == brand.getId()) {
                        hasProducts = true;
                        break;
                    }
                }
                brandHasProducts.put(brand.getId(), hasProducts);
            }
            request.setAttribute("brandHasProducts", brandHasProducts);
            request.setAttribute("brandlist", allbrand);
            request.setAttribute("bl", allbl);
            request.setAttribute("pro", pro);
            request.getRequestDispatcher("admin/brandManage.jsp").forward(request, response);
        } else {
            int ac = Integer.parseInt(action);
            if (ac == 1) {
                response.sendRedirect("createBrand");
            } else if (ac == 2) {
                int id = Integer.parseInt(request.getParameter("bid"));
                Brand bra = dao.getBrandnyId(id);
                request.setAttribute("bra", bra);
                request.getRequestDispatcher("admin/updateBrand.jsp").forward(request, response);
            } else if (ac == 3) {
                int bid = Integer.parseInt(request.getParameter("bid"));
                dao.activeBrand(bid);
                response.sendRedirect("brandmanage");
            } else if (ac == 4) {
                int bid = Integer.parseInt(request.getParameter("bid"));
                dao.blockBrand(bid);
                response.sendRedirect("brandmanage");
            }else if (ac == 5) {
                int bid = Integer.parseInt(request.getParameter("bid"));
                dao.deleteBrand(bid);
                response.sendRedirect("brandmanage");
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
        String txt = request.getParameter("txt");
        dao.searchBrand(txt);
        List<Brand> bra = dao.getBrand();
        dao.getBlockBrand();
        List<Block> allbl = dao.getBl();
        dao.getAllProduct();
        List<Product> pro = dao.getPro();
        Map<Integer, Boolean> brandHasProducts = new HashMap<>();
        for (Brand brand : bra) {
            boolean hasProducts = false;
            for (Product product : pro) {
                if (product.getBrand_id() == brand.getId()) {
                    hasProducts = true;
                    break;
                }
            }
            brandHasProducts.put(brand.getId(), hasProducts);
        }
        request.setAttribute("brandHasProducts", brandHasProducts);
        request.setAttribute("brandlist", bra);
        request.setAttribute("bl", allbl);
        request.getRequestDispatcher("admin/brandManage.jsp").forward(request, response);

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
