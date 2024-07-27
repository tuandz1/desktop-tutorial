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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author admin
 */
@WebServlet(name = "ApplyVoucher", urlPatterns = {"/applyvoucher"})
public class ApplyVoucher extends HttpServlet {
    
    DAOVoucher daovou = new DAOVoucher();

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
            out.println("<title>Servlet ApplyVoucher</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplyVoucher at " + request.getContextPath() + "</h1>");
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
        String vou = request.getParameter("vou");
        Voucher voucher = daovou.getVoucherbyId(vou);
        HttpSession session = request.getSession();
        if (voucher.getDiscountID() == null) {
            session.setAttribute("messvou", "Voucher is not exist");
            response.sendRedirect("showCart");
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
            try {
                // Tạo đối tượng Date từ chuỗi
                Date endate = sdf.parse(voucher.getEndDate());
                Date startdate = sdf.parse(voucher.getStartDate());
                // Lấy thời gian hiện tại
                Date currentDate = new Date();

                // So sánh thời gian
                String comparisonResult = "";
                if ((currentDate.before(endate) || currentDate.equals(endate)) && 
                        (currentDate.after(startdate) || currentDate.equals(startdate))) {
                    if(voucher.getAmount() > 0){
                    daovou.useVoucher(voucher.getDiscountID());
                    session.setAttribute("messvou", "Voucher apply sucessfull");
                    session.setAttribute("rate", " "+voucher.getDiscountRate());
                    session.setAttribute("vouid", voucher.getDiscountID());
                    response.sendRedirect("showCart");
                    }else{
                        daovou.deleteVoucher(voucher.getDiscountID());
                        session.setAttribute("messvou", "Voucher is end");
                    response.sendRedirect("showCart");
                    }
                } else {
                    session.setAttribute("messvou", "Voucher can not use now");
                    response.sendRedirect("showCart");
                }

                // Gửi kết quả so sánh đến client
               
                
            } catch (ParseException e) {
                e.printStackTrace();
                response.getWriter().println("Lỗi khi phân tích định dạng thời gian: " + e.getMessage());
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
