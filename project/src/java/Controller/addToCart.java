/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOProduct;
import entity.Cart;
import entity.Items;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "addToCart", urlPatterns = {"/addToCart"})
public class addToCart extends HttpServlet {

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
            out.println("<title>Servlet addToCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addToCart at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
        dao.getAllProductShop();
        List<Product> allpro = dao.getPro();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }

        String num_raw = request.getParameter("num");
        String id = request.getParameter("id");
        String acc = request.getParameter("acc_num");

        if (acc == null || acc.isEmpty()) {
            response.sendRedirect("login");
        } else {
            int accid = Integer.parseInt(acc);
            int requestedQuantity = Integer.parseInt(num_raw);

            // Kiểm tra số lượng hiện có của sản phẩm với id đã cho
            int availableQuantity = 0;
            for (Product p : allpro) {
                if (p.getId() == Integer.parseInt(id)) {
                    availableQuantity = p.getStockQuantity(); // Giả sử phương thức getQuantity() trả về số lượng hiện có của sản phẩm
                    break;
                }
            }

            // Phân tích chuỗi txt để tìm số lượng hiện tại của sản phẩm trong giỏ hàng
            int currentQuantity = 0;
            String[] items = txt.split("bbb");
            for (String item : items) {
                String[] parts = item.split("sssc");
                if (parts.length == 3 && parts[0].equals(id)) {
                    currentQuantity = Integer.parseInt(parts[1]);
                    break;
                }
            }

            // Tổng số lượng yêu cầu
            int totalQuantity = currentQuantity + requestedQuantity;
            // Nếu tổng số lượng vượt quá số lượng tồn kho, đặt số lượng bằng số lượng tồn kho
            if (totalQuantity > availableQuantity) {
                totalQuantity = availableQuantity;
            }

            // Kiểm tra và cập nhật lại chuỗi txt
            if (txt.isEmpty()) {
                txt = id + "sssc" + totalQuantity + "sssc" + accid;
            } else {
                StringBuilder newTxt = new StringBuilder();
                boolean found = false;
                for (String item : items) {
                    String[] parts = item.split("sssc");
                    if (parts.length == 3 && parts[0].equals(id)) {
                        found = true;
                        newTxt.append(parts[0]).append("sssc").append(totalQuantity).append("sssc").append(accid).append("bbb");
                    } else {
                        newTxt.append(item).append("bbb");
                    }
                }
                if (!found) {
                    newTxt.append(id).append("sssc").append(totalQuantity).append("sssc").append(accid);
                }
                txt = newTxt.toString();
                if (txt.endsWith("bbb")) {
                    txt = txt.substring(0, txt.length() - 3); // Loại bỏ phần "bbb" dư thừa ở cuối
                }
            }

            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(60 * 24 * 60 * 60);
            response.addCookie(c);
            Cart cart = new Cart(txt, allpro);
            response.sendRedirect("shop");
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
