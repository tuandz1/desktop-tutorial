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
import entity.ShipStatus;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "shipperDashboard", urlPatterns = {"/shipperdashboard"})
public class shipperDashboard extends HttpServlet {

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
            out.println("<title>Servlet shipperDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet shipperDashboard at " + request.getContextPath() + "</h1>");
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
        List<Order> allor = null;
        String status = request.getParameter("status");
        String search = (String) request.getAttribute("search");
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (status == null || status.isBlank()) {
            if (search != null) {
                allor = (List<Order>) request.getAttribute("orbydate");
            } else {
                daoor.getAllOrderShipper(acc.getId());
                allor = daoor.getOrd();
            }
        } else {
            switch (status) {
                case "today":
                    daoor.getAllOrderToday();
                    allor = daoor.getOrd();
                    break;
                case "complete":
                    daoor.getAllOrderComplete();
                    allor = daoor.getOrd();
                    break;
                case "paid":
                    daoor.getAllOrderPaid();
                    allor = daoor.getOrd();
                    break;
                case "notPaid":
                    daoor.getAllOrderNotPaid();
                    allor = daoor.getOrd();
                    break;
                case "all":
                    daoor.getAllOrderShipper(acc.getId());
                    allor = daoor.getOrd();
                    break;
            }
        }

        double totalmoney = daoor.getTotalMoney(allor);
        int page, numberPage = 10;
        int size = allor.size();
        int num = (size % numberPage == 0) ? (size / numberPage) : ((size / numberPage) + 1);
        String xpage = request.getParameter("xpage");

        if (xpage == null || xpage.isEmpty()) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }

        int start = (page - 1) * numberPage;
        int end = Math.min(page * numberPage, size);
        daoor.getAllOrderPagging(allor, start, end);
        List<Order> orderpagg = daoor.getOrd();
        
        String message = (String) session.getAttribute("messor");

        if (message != null) {
            // Xử lý thông báo, ví dụ hiển thị cho người dùng
            request.setAttribute("mess", message);
            // Xóa thông báo khỏi session sau khi lấy ra để tránh hiển thị lại sau khi tải lại trang
            session.removeAttribute("messor");
        }
        daoor.getAllPayment();
        List<PaymentMethod> pay = daoor.getPay();
        daoor.getAllStatus();
        List<OrderStatus> sta = daoor.getSta();
        daoac.getAllShipper();
        List<Account> ship = daoac.getAcc();
        daoor.getStatusShipper();
        List<ShipStatus> shipsta = daoor.getShipsta();

        request.setAttribute("shipsta", shipsta);
        request.setAttribute("total", totalmoney);
        request.setAttribute("ord", orderpagg);
        request.setAttribute("status", status);
        request.setAttribute("num", num);
        request.setAttribute("page", page);
        request.setAttribute("pay", pay);
        request.setAttribute("sta", sta);
        request.setAttribute("ship", ship);
        request.getRequestDispatcher("shipper/shipboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        LocalDate time = LocalDate.now();
        String date = time.toString();
        List<Order> orbydate = null;
        if ((from == null || from.isBlank()) && (to == null || to.isBlank())) {
            daoor.getAllOrder();
            orbydate = daoor.getOrd();
        } else {
            if (from == null || from.isBlank()) {
                from = date;
            }
            if (to == null || to.isBlank()) {
                to = date;
            }
              daoor.getAllOrderByDate(from, to);
        orbydate = daoor.getOrd();
        }

      
        request.setAttribute("orbydate", orbydate);
        request.setAttribute("search", "search");
        doGet(request, response);
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
