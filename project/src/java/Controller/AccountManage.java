/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOAccount;
import entity.Account;
import entity.Block;
import entity.Role;
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
@WebServlet(name = "AccountManage", urlPatterns = {"/accountmanage"})
public class AccountManage extends HttpServlet {
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
            out.println("<title>Servlet AccountManage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountManage at " + request.getContextPath() + "</h1>");
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
        if(action == null || action.isBlank()){
            dao.getAllAccount();
        List<Account> allacc = dao.getAcc();
        dao.getBlockAcc();
        List<Block> allbl = dao.getBl();
          dao.getAllRole();
        List<Role> allrole = dao.getRole();
        request.setAttribute("acclist", allacc);
        request.setAttribute("bl", allbl);
        request.setAttribute("role", allrole);
        request.getRequestDispatcher("admin/AccountManage.jsp").forward(request, response);
        }else{
            int ac= Integer.parseInt(action);
            if(ac == 1){
               response.sendRedirect("createAccount");
            }else if(ac == 2){
                int aid = Integer.parseInt(request.getParameter("aid"));
                Account acc = dao.getAccountbyId(aid);
                
                request.setAttribute("acc", acc);
                request.getRequestDispatcher("updateAccount").forward(request, response);
            }else if(ac == 3){
                int aid = Integer.parseInt(request.getParameter("aid"));
                dao.aciveAccount(aid);
                response.sendRedirect("accountmanage");
            }else if(ac == 4){
                int aid = Integer.parseInt(request.getParameter("aid"));
                dao.BlockAccount(aid);
                 response.sendRedirect("accountmanage");
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
        dao.searchAllAccount(txt);
        List<Account> allacc = dao.getAcc();
         dao.getBlockAcc();
        List<Block> allbl = dao.getBl();
        dao.getAllRole();
        List<Role> allrole = dao.getRole();
        request.setAttribute("acclist", allacc);
        request.setAttribute("bl", allbl);
        request.setAttribute("role", allrole);
        request.setAttribute("txt", txt);
        request.getRequestDispatcher("admin/AccountManage.jsp").forward(request, response);
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
