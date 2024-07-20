/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOAccount;
import DAL.DAOProduct;
import entity.Account;
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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "dashboard", urlPatterns = {"/dashboard"})
public class dashboard extends HttpServlet {
    DAOAccount daoac = new DAOAccount();
    DAOProduct dao = new DAOProduct();
    private static final long serialVersionUID = 1L;

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
            out.println("<title>Servlet ChartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChartServlet at " + request.getContextPath() + "</h1>");
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
        dao.getAllBrand();
        List<Brand> brand = dao.getBrand();

        // Chuyển danh sách Brand thành chuỗi định dạng mong muốn
        StringBuilder brandBuilder = new StringBuilder();
        for (int i = 0; i < brand.size(); i++) {
            brandBuilder.append(brand.get(i).getBrand_name());
            if (i < brand.size() - 1) {
                brandBuilder.append(",");
            }
        }
        String brandto = brandBuilder.toString();

        // Tạo danh sách các số nguyên từ 1 đến size của danh sách Brand
        List<Integer> intbr = new ArrayList<>();
        for (Brand br : brand) {
            intbr.add(dao.getCountProbyBrand(br.getId()));
        }

       
        String intto = listIntegerToString(intbr);
        
        dao.getAllCate();
        List<Categories> cate = dao.getCate();
        
          StringBuilder cateBuilder = new StringBuilder();
        for (int i = 0; i < cate.size(); i++) {
            cateBuilder.append(cate.get(i).getCa_name());
            if (i < cate.size() - 1) {
                cateBuilder.append(",");
            }
        }
        String cateto = cateBuilder.toString();
        
         List<Integer> intcate = new ArrayList<>();
         for(Categories catelist : cate){
             intcate.add(dao.getCountProbyCate(catelist.getId()));
         }
         
         String catestr = listIntegerToString(intcate);
         
         int countbrand = dao.getCountBrands();
         int countcate = dao.getCountCate();
         int countcus = dao.getCountCustomer();
         int countpro = dao.getCountProducts();
         
         dao.gettop4Product();
         List<Product> toppro = dao.getPro();
         dao.getTop4Brand(); 
         List<Brand> topbra = dao.getBrand();
         daoac.gettop4Account();
         List<Account> topacc = daoac.getAcc();
         
        // Đặt các thuộc tính cho request và chuyển tiếp đến trang JSP
        request.setAttribute("toppro", toppro);
        request.setAttribute("topbra", topbra);
        request.setAttribute("topacc", topacc);
        request.setAttribute("countpro", countpro);
        request.setAttribute("countcus", countcus );
        request.setAttribute("countcate", countcate );
        request.setAttribute("countbrand", countbrand);
        request.setAttribute("brand", brandto);
        request.setAttribute("cate", cateto);
        request.setAttribute("sll", intto);
        request.setAttribute("catesl", catestr);
        request.getRequestDispatcher("admin/Dashboard.jsp").forward(request, response);
    }
    
    public static String listIntegerToString(List<Integer> intList) {
        StringBuilder intBuilder = new StringBuilder();

        for (int i = 0; i < intList.size(); i++) {
            intBuilder.append(intList.get(i));

            if (i < intList.size() - 1) {
                intBuilder.append(",");
            }
        }

        return intBuilder.toString();
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
