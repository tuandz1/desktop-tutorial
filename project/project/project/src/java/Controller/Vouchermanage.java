/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOVoucher;
import entity.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "Vouchermanage", urlPatterns = {"/vouchermanage"})
public class Vouchermanage extends HttpServlet {

    DAOVoucher dao = new DAOVoucher();

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
            out.println("<title>Servlet Vouchermanage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Vouchermanage at " + request.getContextPath() + "</h1>");
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
        List<Voucher> allvou = null;

        if (ac == null) {
            if (search != null) {
                if (txt == null) {
                    allvou = (List<Voucher>) request.getAttribute("vou");
                } else {
                    dao.searchVoucher(txt);
                    allvou = dao.getVou();
                }
            } else if (search == null && txt != null) {
                dao.searchVoucher(txt);
                allvou = dao.getVou();
            } else {
                dao.getAllVoucher();
                allvou = dao.getVou();
            }
            paginateAndForward(request, response, allvou, txt);
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
            dao.searchVoucher(txt);
            List<Voucher> allvou = dao.getVou();
            request.setAttribute("pro", allvou);
            request.setAttribute("search", "search");
            doGet(request, response);
        } else {
            handleAction(request, response, ac);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    private void paginateAndForward(HttpServletRequest request, HttpServletResponse response, List<Voucher> allvou, String search) throws ServletException, IOException {
        int page, numberPage = 6;
        int size = allvou.size();
        int num = (size % numberPage == 0 ? (size / numberPage) : ((size / numberPage) + 1));
        String xpage = request.getParameter("xpage");

        if (xpage == null || xpage.isEmpty()) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }

        int start = (page - 1) * numberPage;
        int end = Math.min(page * numberPage, size);
        dao.getAllVoucherPagging(allvou, start, end);
        List<Voucher> vouPagging = dao.getVou();
        LocalDateTime currentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedCurrentTime = currentTime.format(formatter);
        HttpSession session = request.getSession();
        String message = (String) session.getAttribute("messvo");
        String message2 = (String) request.getAttribute("messvouc");

        if (message2 != null) {
            // Xử lý thông báo, ví dụ hiển thị cho người dùng
            request.setAttribute("mess", message2);
            // Xóa thông báo khỏi session sau khi lấy ra để tránh hiển thị lại sau khi tải lại trang
            request.removeAttribute("messvouc");
        }

        if (message != null) {
            // Xử lý thông báo, ví dụ hiển thị cho người dùng
            request.setAttribute("mess", message);
            // Xóa thông báo khỏi session sau khi lấy ra để tránh hiển thị lại sau khi tải lại trang
            session.removeAttribute("messvo");
        }

        request.setAttribute("currentTime", formattedCurrentTime);

        request.setAttribute("search", search);
        request.setAttribute("num", num);
        request.setAttribute("page", page);
        request.setAttribute("vou", vouPagging);
        request.getRequestDispatcher("admin/Vouchermanage.jsp").forward(request, response);
    }

    private void handleAction(HttpServletRequest request, HttpServletResponse response, String ac) throws ServletException, IOException {
        int action = Integer.parseInt(ac);

        switch (action) {
            case 1:
                LocalDateTime currentTime = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String formattedCurrentTime = currentTime.format(formatter);
                request.setAttribute("currentTime", formattedCurrentTime);
                request.getRequestDispatcher("admin/insertVoucher.jsp").forward(request, response);
                break;
            case 2:
                String pridToDelete = request.getParameter("vid");
                dao.deleteVoucher(pridToDelete);
                HttpSession session = request.getSession();
                session.setAttribute("messvo", "Delete change sucessfull!");
                response.sendRedirect("vouchermanage");
                break;
            case 3:
                String  pridToUpdate = request.getParameter("vid");
                Voucher vouch = dao.getVoucherbyId(pridToUpdate);
                request.setAttribute("vou", vouch);
                request.getRequestDispatcher("admin/updateVoucher.jsp").forward(request, response);
                break;
            case 4:
                String Statusvou = request.getParameter("vid");
                dao.blockVoucher(Statusvou);
                request.setAttribute("messvouc", "Block voucher successful");
                response.sendRedirect("vouchermanage");
                break;
            case 5:
                String Statusvou2 = request.getParameter("vid");
                dao.activeVoucher(Statusvou2);

                request.setAttribute("messvouc", "Active voucher successful");
                response.sendRedirect("vouchermanage");
                break;
            default:
                response.sendRedirect("productmanage");
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
