/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOBlog;
import entity.Blog;
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

/**
 *
 * @author admin
 */
@MultipartConfig
@WebServlet(name = "updateBlog", urlPatterns = {"/updateblog"})
public class updateBlog extends HttpServlet {

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
            out.println("<title>Servlet updateBlog</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateBlog at " + request.getContextPath() + "</h1>");
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
        response.sendRedirect("blogmanage");
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
        String acid_raw = request.getParameter("cuid");
        if (acid_raw == null || acid_raw.isBlank()) {
            request.setAttribute("mess", acid_raw);
            request.getRequestDispatcher("test.jsp").forward(request, response);
        } else if (acid_raw != null) {
            int acid = Integer.parseInt(acid_raw);
            int blid = Integer.parseInt(request.getParameter("blid"));
            String tile = request.getParameter("title");
            String desc = request.getParameter("des");
            String date = request.getParameter("date");
            String content = request.getParameter("content");
            String customDirectory = "D:/SUM24/SWP/Git/WatchProject12/web/img";
            Part part = request.getPart("img");
            if (part == null || part.getSize() == 0) {
                Blog blog = dao.getBlogbyId(blid);
                dao.updateBlog(tile, desc, date, content, acid, blog.getImg(), blid);
            } else {
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                Path imagePath = Paths.get(customDirectory, filename);
                if (!Files.exists(Paths.get(customDirectory))) {
                    Files.createDirectories(Paths.get(customDirectory));
                }
                part.write(imagePath.toString());
                dao.updateBlog(tile, desc, date, content, acid, "img/" + filename, blid);
            }
            HttpSession session = request.getSession();
            session.setAttribute("messbl", "Update successfull");
            response.sendRedirect("blogmanage");
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
