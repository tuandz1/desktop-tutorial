/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOComment;
import DAL.DAOProduct;
import entity.Brand;
import entity.Categories;
import entity.Product;
import entity.Product_Image;
import entity.Review;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "commentManager", urlPatterns = {"/commentManage"})
public class commentManager extends HttpServlet {
    DAOComment daocmt = new DAOComment();
    DAOProduct daopro = new DAOProduct();
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
            out.println("<title>Servlet commentManager</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet commentManager at " + request.getContextPath() + "</h1>");
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
        String ac = request.getParameter("action");
        String txt = request.getParameter("txt");
        String search = (String) request.getAttribute("search");
        List<Review> allcmt = null;

        if (ac == null) {
            if (search != null) {
                if (txt == null) {
                    allcmt = (List<Review>) request.getAttribute("cmt");
                } else {
                    daocmt.searchReviewPro(txt);
                    allcmt = daocmt.getCmt();
                }
            }else if(search == null && txt != null){
                daocmt.searchReviewPro(txt);
                    allcmt = daocmt.getCmt();
            }else {
                daocmt.getAllReviewPro();
                allcmt = daocmt.getCmt();
            }
            paginateAndForward(request, response, allcmt, txt);
        } else {
            handleAction(request, response, ac);
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
        String ac = request.getParameter("action");
        String txt = request.getParameter("txt");
        if (ac == null) {
            daocmt.searchReviewPro(txt);
            List<Review> allcmt = daocmt.getCmt();
            request.setAttribute("cmt", allcmt);
            request.setAttribute("search", "search");
            doGet(request, response);
        } else {
            handleAction(request, response, ac);
        }
    }

    private void paginateAndForward(HttpServletRequest request, HttpServletResponse response, List<Review> allcmt, String search) throws ServletException, IOException {
        int page, numberPage = 6;
        int size = allcmt.size();
        int num = (size % numberPage == 0 ? (size / numberPage) : ((size / numberPage) + 1));
        String xpage = request.getParameter("xpage");

        if (xpage == null || xpage.isEmpty()) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }

        int start = (page - 1) * numberPage;
        int end = Math.min(page * numberPage, size);
        daocmt.getAllProductPagging(allcmt, start, end);
        List<Review> cmtPagging = daocmt.getCmt();

        daopro.getAllProduct();
        List<Product> allprod = daopro.getPro();
        
        HttpSession session = request.getSession();
        String message = (String) session.getAttribute("messcmt");
       

        if (message != null) {
            // Xử lý thông báo, ví dụ hiển thị cho người dùng
            request.setAttribute("mess", message);
            // Xóa thông báo khỏi session sau khi lấy ra để tránh hiển thị lại sau khi tải lại trang
            session.removeAttribute("messcmt");
        }


        request.setAttribute("search", search);
        request.setAttribute("num", num);
        request.setAttribute("page", page);
        request.setAttribute("cmt", cmtPagging);
        request.setAttribute("pro", allprod);
        request.getRequestDispatcher("admin/CommentManager.jsp").forward(request, response);
    }
     private void handleAction(HttpServletRequest request, HttpServletResponse response, String ac) throws ServletException, IOException {
        int action = Integer.parseInt(ac);

        switch (action) {
            
            case 2:
                int pridToDelete = Integer.parseInt(request.getParameter("pid"));
                String content = request.getParameter("content");
                daocmt.updateContext(content,pridToDelete);
                response.sendRedirect("commentManage");
                break;
            
            default:
                response.sendRedirect("commentManage");
                break;
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
