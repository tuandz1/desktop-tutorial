/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOProduct;
import entity.Account;
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
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "Quantity", urlPatterns = {"/quantity"})
public class Quantity extends HttpServlet {
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
            out.println("<title>Servlet Quantity</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Quantity at " + request.getContextPath() + "</h1>");
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
         dao.getAllProductShop();
        List<Product> allpro = dao.getPro();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr != null){
            for (Cookie o : arr) {
                if(o.getName().equals("cart")){
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        Cart cart = new Cart(txt, allpro);
        String num_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        String ac_num = request.getParameter("acc_num");
        if(ac_num == null || ac_num.isEmpty()){
            response.sendRedirect("login");
        }else{
        try {
            int accid = Integer.parseInt(ac_num);
            int id = Integer.parseInt(id_raw);
            Product p = dao.getProductbyId(id);
            int numstore = p.getStockQuantity();
            int num = Integer.parseInt(num_raw);
            
            if(num == -1 &&(cart.getQuantitybyID(id) <= 1)){
                cart.removeItem(id, accid);
            }else{
                if(num == 1 &&(cart.getQuantitybyID(id) >= numstore)){
                   num=0;
                }
                double proce = p.getPrice();
                Items t = new Items(p, num, proce,accid);
                cart.addItems(t);
            }
        } catch (Exception e) {
        }
        
        List<Items> items = cart.getItems();
        txt = "";
        if(items.size() > 0){
            txt= items.get(0).getProduct().getId() + "sssc" +
                    items.get(0).getQuantity()+"sssc" +items.get(0).getAccid();
            for (int i = 1; i < items.size(); i++) {
                txt += "bbb" + items.get(i).getProduct().getId() + "sssc" +
                    items.get(i).getQuantity() + "sssc" + items.get(i).getAccid();
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60*24*60*60);
        response.addCookie(c);
        response.sendRedirect("showCart");
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
       // Assuming dao and other necessary imports are already present

// Fetch all products from the shop
dao.getAllProductShop();
List<Product> allpro = dao.getPro();

// Get cookies and extract the cart information
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

// Get the product ID from the request
String id_raw = request.getParameter("id");
int id = Integer.parseInt(id_raw);

// Get the current session and account
HttpSession session = request.getSession();
Account acc = (Account) session.getAttribute("acc");

// Create a new Cart instance
Cart cart = new Cart(txt, allpro);

// Remove the specified item from the cart
cart.removeItem(id, acc.getId());

// Update the cart text after removal
List<Items> listItems = cart.getItems();
StringBuilder updatedTxt = new StringBuilder();
for (Items item : listItems) {
    updatedTxt.append(item.getProduct().getId())
              .append("sssc")
              .append(item.getQuantity())
              .append("sssc")
              .append(item.getAccid())
              .append("bbb");
}

// Remove the trailing "bbb"
if (updatedTxt.length() > 0) {
    updatedTxt.setLength(updatedTxt.length() - 3);
}

// Update the cart cookie with the new cart text
if (!updatedTxt.toString().isEmpty()) {
    Cookie c = new Cookie("cart", updatedTxt.toString());
    c.setMaxAge(60 * 24 * 60 * 60);
    response.addCookie(c);
}

// Set the attributes and forward to the cart page
request.setAttribute("cart", cart);
request.setAttribute("mess", "Delete from Cart successful");
request.getRequestDispatcher("cart.jsp").forward(request, response);

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
