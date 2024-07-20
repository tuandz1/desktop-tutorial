/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOBlog;
import entity.Blog;
import jakarta.mail.Session;
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
@WebServlet(name = "createBlog", urlPatterns = {"/createblog"})
public class createBlog extends HttpServlet {
    DAOBlog dao = new DAOBlog();
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
            out.println("<title>Servlet createBlog</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet createBlog at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("admin/insertBlog.jsp").forward(request, response);
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
        String tile = request.getParameter("title");
        String desc = request.getParameter("des");
        String date = request.getParameter("date");
        String content = request.getParameter("content");
        String acid_raw = request.getParameter("acid");
        if(acid_raw == null){
            response.sendRedirect("login");
        }else{
            int acid = Integer.parseInt(acid_raw);
            String customDirectory = "D:/SUM24/SWP/Git/WatchProject12/web/img";
        Part part = request.getPart("img");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        Path imagePath = Paths.get(customDirectory, filename);
        if (!Files.exists(Paths.get(customDirectory))) {
            Files.createDirectories(Paths.get(customDirectory));
        }
        part.write(imagePath.toString());
        
        dao.getAllBlog();
        List<Blog> blg = dao.getBlg();
        int flag = 0;
            for (Blog blog : blg) {
                if(blog.getTitle().equals(tile)){
                    flag++;
                }
            }
            if(flag == 0){
                dao.insertBlog(tile, desc, date, content, acid, "img/" + filename);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("messbl", "insert Successful");
                response.sendRedirect("blogmanage");
            }else{
                request.setAttribute("mess", "Duplicate Information");
                 request.getRequestDispatcher("admin/insertBlog.jsp").forward(request, response);
            }
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
