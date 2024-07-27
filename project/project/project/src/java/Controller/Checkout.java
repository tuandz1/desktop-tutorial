/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOOrder;
import DAL.DAOProduct;
import entity.Account;
import entity.Cart;
import entity.Email;
import entity.Items;
import entity.Order;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 *
 * @author admin
 */
@WebServlet(name = "Checkout", urlPatterns = {"/checkout"})
public class Checkout extends HttpServlet {

    DAOProduct daopro = new DAOProduct();
    DAOOrder daoor = new DAOOrder();

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
            out.println("<title>Servlet Checkout</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Checkout at " + request.getContextPath() + "</h1>");
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
        double rate = Double.parseDouble(request.getParameter("disrate"));
        daopro.getAllProductShop();
        List<Product> allpro = daopro.getPro();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, allpro);
        String id_raw = request.getParameter("cusid");
        if (id_raw == null || id_raw.isEmpty()) {
            response.sendRedirect("login");
        } else {
            int cusid = Integer.parseInt(id_raw);
            int payid = Integer.parseInt(request.getParameter("pay"));
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String add = request.getParameter("add");
            if (payid == 1) {
                daoor.addOrder(cusid, 2, phone, name, add, payid, cart, "Preparing for shipment", rate);
                for (Iterator<Items> iterator = cart.getItems().iterator(); iterator.hasNext();) {
                    Items i = iterator.next();
                    if (i.getAccid() == cusid) {
                        iterator.remove();
                    }
                }

                List<Items> items = cart.getItems();
                txt = "";
                if (items.size() > 0) {
                    txt = items.get(0).getProduct().getId() + "sssc"
                            + items.get(0).getQuantity() + "sssc" + items.get(0).getAccid();
                    for (int i = 1; i < items.size(); i++) {
                        txt += "bbb" + items.get(i).getProduct().getId() + "sssc"
                                + items.get(i).getQuantity() + "sssc" + items.get(i).getAccid();
                    }
                }

                Cookie c = new Cookie("cart", txt);
                c.setMaxAge(60 * 24 * 60 * 60); // Set the cookie to expire in 60 days
                response.addCookie(c);
                Order o = daoor.getOrderbyId(daoor.Orderid(cusid));
                request.setAttribute("orderId", o.getId());
                HttpSession session = request.getSession();
                Account acc = (Account) session.getAttribute("acc");
                Email e = new Email();
                LocalDateTime currentDateTime = LocalDateTime.now();

                executorService.submit(() -> {
                    e.sendEmail(e.subjectOrder(name), e.messageOrder(add), acc.getEmail());

                });
                request.getRequestDispatcher("paymentsucess.jsp").forward(request, response);
            } else if (payid == 2) {
                daoor.addOrder(cusid, 1, phone, name, add, payid, cart, "Preparing for shipment", rate);
                int orderid = daoor.Orderid(cusid);
                Order o = daoor.getOrderbyId(orderid);
                request.setAttribute("rate", rate);
                request.setAttribute("cart", cart);
                request.getRequestDispatcher("vnpay_pay.jsp").forward(request, response);
            }
        }
    }
    ExecutorService executorService = Executors.newSingleThreadExecutor();

    private static final String ALPHANUMERIC_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final String SPECIAL_CHARACTERS = "!@#$%^&*()-_=+[]{}|;:'\",.<>?/`~";
    private static final String CHARACTERS = ALPHANUMERIC_CHARACTERS + SPECIAL_CHARACTERS;
    private static final SecureRandom random = new SecureRandom();

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
