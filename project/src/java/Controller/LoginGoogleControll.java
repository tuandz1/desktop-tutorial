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

import entity.GoogleUtils;

import entity.GooglePojo;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "LoginGoogleControll", urlPatterns = {"/login-google"})
public class LoginGoogleControll extends HttpServlet {

    DAOAccount dao = new DAOAccount();
    private static final long serialVersionUID = 1L;

    public LoginGoogleControll() {
        super();
    }

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
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            HttpSession session = request.getSession();
            String emailgoogle = googlePojo.getEmail();
            int flag = 0;
            dao.getAllAccount();
            List<Account> allacc = dao.getAcc();
            for (Account account : allacc) {
                if (account.getEmail().equals(emailgoogle) && account.getAcc_name().equals(emailgoogle)) {
                    flag++;
                }
            }

            if (flag != 0) {
                Account acc = dao.loginAccountbyGoogle(emailgoogle);
                if(acc != null){
                session.setAttribute("acc", acc);
                if (acc.getFull_name() == null || acc.getFull_name().isBlank()) {
                    response.sendRedirect("accsettings");
                } else {
                    response.sendRedirect("index.jsp");
                }
                }else{
                    request.setAttribute("mes", "Your Account Have Been Block For Some Reasons");
            request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                dao.insertAccountbyGoogle(emailgoogle);
                Account acc = dao.loginAccountbyGoogle(emailgoogle);
                session.setAttribute("acc", acc);
                if (acc.getFull_name() == null || acc.getFull_name().isBlank()) {
                    response.sendRedirect("accsettings");
                } else {
                    response.sendRedirect("index.jsp");
                }
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
