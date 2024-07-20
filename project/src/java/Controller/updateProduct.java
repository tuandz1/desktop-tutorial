/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOProduct;
import entity.Brand;
import entity.Categories;
import entity.Product;
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
@WebServlet(name = "updateProduct", urlPatterns = {"/updateProduct"})
public class updateProduct extends HttpServlet {

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
            out.println("<title>Servlet updateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProduct at " + request.getContextPath() + "</h1>");
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
        String pr = request.getParameter("price");
        String st = request.getParameter("stock");
        String br = request.getParameter("brand");
        String ca = request.getParameter("cate");
        String date = request.getParameter("date");
        String des = request.getParameter("des");
        String id = request.getParameter("id");
        int proid = Integer.parseInt(id);
        int stock = Integer.parseInt(st);
        int caid = Integer.parseInt(ca);
        int brid = Integer.parseInt(br);
        double price = Double.parseDouble(pr);
        String customDirectory = "D:/SUM24/SWP/Git/WatchProject12/web/img";
        Part part = request.getPart("img");
        if (part == null || part.getSize() == 0) {
            Product pro = dao.getProductbyId(proid);
            String img = pro.getImg();
            dao.UpdateProduct(name, caid, des, img, price, brid, stock, date, proid);
            for (Part part2 : request.getParts()) {
                if (part2.getName().equals("imgs") && part2.getSize() > 0) {
                    dao.deleteProductImg(proid);
                    break;
                }
            }
            for (Part part2 : request.getParts()) {
                if (part2.getName().equals("imgs") && part2.getSize() > 0) {
                    String filenameimgs = Paths.get(part2.getSubmittedFileName()).getFileName().toString();
                    Path imagePathimgs = Paths.get(customDirectory, filenameimgs);
                    if (!Files.exists(Paths.get(customDirectory))) {
                        Files.createDirectories(Paths.get(customDirectory));
                    }
                    part2.write(imagePathimgs.toString());
                    dao.insertProImage(proid, "img/" + filenameimgs);

                }
            }

        } else if (part != null) {

            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            Path imagePath = Paths.get(customDirectory, filename);
            if (!Files.exists(Paths.get(customDirectory))) {
                Files.createDirectories(Paths.get(customDirectory));
            }
            part.write(imagePath.toString());
            for (Part part2 : request.getParts()) {
                if (part2.getName().equals("imgs") && part2.getSize() > 0) {
                    dao.deleteProductImg(proid);
                    break;
                }
            }
            for (Part part2 : request.getParts()) {
                if (part2.getName().equals("imgs") && part2.getSize() > 0) {
                    String filenameimgs = Paths.get(part2.getSubmittedFileName()).getFileName().toString();
                    Path imagePathimgs = Paths.get(customDirectory, filenameimgs);
                    if (!Files.exists(Paths.get(customDirectory))) {
                        Files.createDirectories(Paths.get(customDirectory));
                    }
                    part2.write(imagePathimgs.toString());
                    dao.insertProImage(proid, "img/" + filenameimgs);

                }
            }
            dao.UpdateProduct(name, caid, des, "img/" + filename, price, brid, stock, date, proid);
        }
        HttpSession session = request.getSession();
        session.setAttribute("messpro", "Update Successfull");
        response.sendRedirect("productmanage");
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
