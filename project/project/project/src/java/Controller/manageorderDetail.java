/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOAccount;
import DAL.DAOOrder;
import DAL.DAOProduct;
import entity.Account;
import entity.Brand;
import entity.Categories;
import entity.Order;
import entity.OrderDetail;
import entity.OrderStatus;
import entity.PaymentMethod;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "manageorderDetail", urlPatterns = {"/manageorderDetail"})
public class manageorderDetail extends HttpServlet {
DAOOrder daoor = new DAOOrder();
    DAOAccount daoacc = new DAOAccount();
    DAOProduct daopro = new DAOProduct();
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
            out.println("<title>Servlet manageorderDetail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manageorderDetail at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("orid"));
        daoor.getOrderDetail(id);
        List<OrderDetail> detail = daoor.getDetail();
        Order order = daoor.getOrderbyId(id);
        daopro.getAllBrand();
        List<Brand> brand = daopro.getBrand();
        daopro.getAllCate();
        List<Categories> cate = daopro.getCate();
        Account shiper = daoacc.getAccountbyId(order.getShip_id());
        daoor.getAllPayment();
        List<PaymentMethod> pay = daoor.getPay();
        daoor.getAllStatus();
        List<OrderStatus> orsta = daoor.getSta();
        HttpSession session = request.getSession();
        String message = (String) session.getAttribute("messcmt");

        if (message != null) {
            // Xử lý thông báo, ví dụ hiển thị cho người dùng
            request.setAttribute("mess", message);
            // Xóa thông báo khỏi session sau khi lấy ra để tránh hiển thị lại sau khi tải lại trang
            session.removeAttribute("messcmt");
        }
        request.setAttribute("orsta", orsta);
        request.setAttribute("pay", pay);
        request.setAttribute("detail", detail);
        request.setAttribute("order", order);
        request.setAttribute("brand", brand);
        request.setAttribute("cate", cate);
        request.setAttribute("shiper", shiper);
        request.getRequestDispatcher("admin/ViewOrderDetail.jsp").forward(request, response);
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
