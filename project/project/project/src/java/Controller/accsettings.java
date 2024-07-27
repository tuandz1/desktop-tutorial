/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOAccount;
import entity.Account;
import entity.SecurityQuestion;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
@WebServlet(name = "accsettings", urlPatterns = {"/accsettings"})
public class accsettings extends HttpServlet {
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
            out.println("<title>Servlet accsettings</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet accsettings at " + request.getContextPath() + "</h1>");
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
        dao.getQuestion();
        List<SecurityQuestion> allq = dao.getSq();
        request.setAttribute("allq", allq);
        HttpSession session = request.getSession();
        String mess = (String) session.getAttribute("messset");
        if(mess != null){
            request.setAttribute("mess", mess);
            session.removeAttribute("messset");
        }
        request.getRequestDispatcher("accsetings.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        String full_name = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String sq = request.getParameter("sques");
        HttpSession session = request.getSession();
        String ans = request.getParameter("answer");
        String address = request.getParameter("address");
        int sqid;
        if(sq == null){
         sqid =  1;
        }else{
            sqid = Integer.parseInt(sq);
        }
        int cusid = Integer.parseInt(id);
        
         String customDirectory = "D:/SUM24/SWP/Git/WatchProject12/web/img";
        Part part = request.getPart("ava");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        Path imagePath = Paths.get(customDirectory, filename);
        if (!Files.exists(Paths.get(customDirectory))) {
            Files.createDirectories(Paths.get(customDirectory));
        }
        part.write(imagePath.toString());
        session.removeAttribute("acc");
       dao.changetAccountInfo(email, address, full_name, phone, "img/" + filename, sqid, ans, cusid);
       
       Account acc1 = dao.getAccountbyId(cusid);
       session.setAttribute("acc", acc1);
       session.setAttribute("messset", "Update Successfull");
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
