/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOAccount;
import entity.Account;
import entity.Role;
import entity.SecurityQuestion;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 *
 * @author admin
 */
@MultipartConfig
@WebServlet(name = "updateAccount", urlPatterns = {"/updateAccount"})
public class updateAccount extends HttpServlet {

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
            out.println("<title>Servlet updateAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateAccount at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("aid"));
        dao.getAllRole();
        List<Role> allrole = dao.getRole();
        dao.getQuestion();
        List<SecurityQuestion> qs = dao.getSq();
        Account ac = dao.getAccountbyId(id);
        request.setAttribute("ac", ac);
        request.setAttribute("role", allrole);
        request.setAttribute("qs", qs);
        request.getRequestDispatcher("admin/updateAccount.jsp").forward(request, response);

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
        String acc_name = request.getParameter("acc_name");
        String pass = request.getParameter("pass");
        String full_name = request.getParameter("full_name");
        String email = request.getParameter("mail");
        String phone = request.getParameter("phone");
        String add = request.getParameter("add");
        String ans = request.getParameter("ans");
        int roleid = Integer.parseInt(request.getParameter("role"));
        int qsid = Integer.parseInt(request.getParameter("qs"));
        int id = Integer.parseInt(request.getParameter("id"));
        Part part = request.getPart("ava");
        
        
        if (part == null || part.getSize() == 0) {
            Account ac = dao.getAccountbyId(id);
            dao.updateAccountByAdmin(acc_name, email, add, pass, full_name, phone, roleid, ac.getAvatar(), qsid, ans, id);
        } else {
            String customDirectory = "D:/SUM24/SWP/Git/WatchProject/web/img";

            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            Path imagePath = Paths.get(customDirectory, filename);
            if (!Files.exists(Paths.get(customDirectory))) {
                Files.createDirectories(Paths.get(customDirectory));
            }
            part.write(imagePath.toString());
            dao.updateAccountByAdmin(acc_name, email, add, pass, full_name, phone, roleid, "img/"+ filename, qsid, ans, id);
        }
        response.sendRedirect("accountmanage");
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
