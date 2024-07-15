/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOAccount;
import DAL.DAOOrder;
import entity.Account;
import entity.Order;
import entity.OrderStatus;
import entity.PaymentMethod;
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
@WebServlet(name = "OrderRecieved", urlPatterns = {"/orderrecieved"})
public class OrderRecieved extends HttpServlet {
 DAOOrder daoor = new DAOOrder();
    DAOAccount daoac = new DAOAccount();
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
            out.println("<title>Servlet OrderRecieved</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderRecieved at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String id_raw = request.getParameter("accid");
        if (id_raw == null || id_raw.isEmpty()) {
            response.sendRedirect("login");
        } else {
            int orid = Integer.parseInt(request.getParameter("id"));
            daoor.UpdateShipStatus("Received  Successfully", orid);
            int cusid = Integer.parseInt(id_raw);
            daoor.getCustomerOrder(cusid);
            List<Order> or = daoor.getOrd();
            daoor.getAllPayment();
            List<PaymentMethod> pay = daoor.getPay();
            daoor.getAllStatus();
            List<OrderStatus> sta = daoor.getSta();
            daoac.getAllShipper();
            List<Account> ship = daoac.getAcc();
            String mess = "Received successfull";
            request.setAttribute("ord", or);
            request.setAttribute("mess", mess);
            request.setAttribute("pay", pay);
            request.setAttribute("sta", sta);
            request.setAttribute("ship", ship);
            request.getRequestDispatcher("OrderHistory.jsp").forward(request, response);
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
