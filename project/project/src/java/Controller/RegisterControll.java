/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOAccount;
import entity.Account;
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
@WebServlet(name = "RegisterControll", urlPatterns = {"/register"})
public class RegisterControll extends HttpServlet {

    DAOAccount dao = new DAOAccount();

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
            out.println("<title>Servlet RegisterControll</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterControll at " + request.getContextPath() + "</h1>");
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
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String cfpass = request.getParameter("cfpass");
        String role = request.getParameter("role");
        if(role.isBlank())role = "1";
        int roleId = Integer.parseInt(role);
        String mess = "";
        dao.getAllAccount();
        List<Account> allacc = dao.getAcc();

        if (pass.equals(cfpass)) {
            for (Account account : allacc) {
                if (account.getAcc_name().equals(name) || account.getEmail().equals(email)) {
                    mess = "The name or email already exists";
                    request.setAttribute("namemess", mess);
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            }
            if (name.length() <= 8 || (pass.length() <= 8 || pass.length() >= 16)) {
                mess = "Name or password must be at least 8 characters";
                    request.setAttribute("passmess", mess);
                    request.getRequestDispatcher("register.jsp").forward(request, response);
            }else if(!checkPassword(pass)){
                mess = "Password must be contain special character";
                    request.setAttribute("charmess", mess);
                    request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            dao.insertAccount(name, email, pass, roleId);
            response.sendRedirect("login");
        } else {
             mess = "Confirm pass doesn't correct";
                    request.setAttribute("cfpassmess", mess);
                    request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
    public static boolean checkPassword(String password) {
        // Các ký tự đặc biệt cần kiểm tra
        String specialCharacters = "!@#$%^&*(),.?\":{}|<>";
        
        // Kiểm tra từng ký tự trong mật khẩu
        for (int i = 0; i < password.length(); i++) {
            if (specialCharacters.contains(Character.toString(password.charAt(i)))) {
                return true;
            }
        }
        return false;
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
