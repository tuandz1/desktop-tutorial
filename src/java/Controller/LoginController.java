/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.DAOAccount;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import  jakarta.servlet.ServletException;
import  jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import  jakarta.servlet.http.HttpServlet;
import  jakarta.servlet.http.HttpServletRequest;
import  jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
@WebServlet(name="LoginController", urlPatterns={"/login"})
public class LoginController extends HttpServlet {
    DAOAccount dao = new DAOAccount();
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet LoginController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String name =  request.getParameter("name");
      String pass =  request.getParameter("pass");
       HttpSession session = request.getSession();
       String rem = request.getParameter("rem");
        String mes = "";
        Account acc = dao.loginAccount(name, pass);
        if (acc.getId()!= 0) {
            Cookie cu = new Cookie("cuser", name);
            Cookie cp = new Cookie("cpass", pass);
            Cookie cr = new Cookie("crem", rem);
            if (rem != null) {
                cu.setMaxAge(60 * 60 * 24 * 5);
                cp.setMaxAge(60 * 60 * 24 * 5);
                cr.setMaxAge(60 * 60 * 24 * 5);
            } else {
                cu.setMaxAge(0);
                cp.setMaxAge(0);
                cr.setMaxAge(0);
            }
            response.addCookie(cu);
            response.addCookie(cp);
            response.addCookie(cr);

            session.setAttribute("acc", acc);
            if(acc.getRole_id() == 1){
            if(acc.getFull_name().isBlank()){
                response.sendRedirect("accsettings");
            }else{
            response.sendRedirect("home");
            }
            }else{
                response.sendRedirect("dashboard");
            }
        } else {
            mes = "login fail";
            request.setAttribute("mes", mes);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
