/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOAccount;
import entity.Account;
import entity.Email;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 *
 * @author admin
 */
@WebServlet(name = "mailControll", urlPatterns = {"/mail"})
public class mailControll extends HttpServlet {

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
            out.println("<title>Servlet mail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet mail at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        dao.getAllAccount();
        String newpass = generateRandomString();
        List<Account> allacc = dao.getAcc();

        Account acc = dao.getAccountformemailandphone(email, phone);
        if (acc == null) {
            String mes = "Invalid email or wrong phone number ";
            request.setAttribute("mes", mes);
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        } else {
            int flag = 0;
            String mes = "";
            for (Account account : allacc) {
                if (acc.getEmail().equals(email) && acc.getPhone().equals(phone)) {
                    flag++;
                }
            }
            if (flag != 0) {
                dao.changetAccountPass(email, phone, "@" + newpass);
                Email e = new Email();
                LocalDateTime currentDateTime = LocalDateTime.now();

                response.sendRedirect("login");

                executorService.submit(() -> {
                    e.sendEmail(e.forgotAccount(acc.getFull_name()), e.messagePass(currentDateTime, acc.getFull_name(), "@" + newpass), email);

                });
            } else {
                mes = "Invalid email or wrong phone number ";
                request.setAttribute("mes", mes);
                request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            }
        }
    }

    ExecutorService executorService = Executors.newSingleThreadExecutor();

    private static final String ALPHANUMERIC_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final String SPECIAL_CHARACTERS = "!@#$%^&*()-_=+[]{}|;:'\",.<>?/`~";
    private static final String CHARACTERS = ALPHANUMERIC_CHARACTERS + SPECIAL_CHARACTERS;
    private static final SecureRandom random = new SecureRandom();

    public static String generateRandomString() {
        StringBuilder sb = new StringBuilder(8);

        // Generate 7 random alphanumeric characters
        for (int i = 0; i < 7; i++) {
            sb.append(ALPHANUMERIC_CHARACTERS.charAt(random.nextInt(ALPHANUMERIC_CHARACTERS.length())));
        }

        // Add one special character
        sb.append(SPECIAL_CHARACTERS.charAt(random.nextInt(SPECIAL_CHARACTERS.length())));

        // Shuffle the characters in the string
        List<Character> charList = new ArrayList<>();
        for (char c : sb.toString().toCharArray()) {
            charList.add(c);
        }
        Collections.shuffle(charList);

        StringBuilder result = new StringBuilder(charList.size());
        for (char c : charList) {
            result.append(c);
        }

        return result.toString();
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
