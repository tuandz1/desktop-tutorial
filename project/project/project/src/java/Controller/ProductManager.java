/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.DAOProduct;
import entity.Brand;
import entity.Categories;
import entity.Product;
import entity.Product_Image;
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
@WebServlet(name = "ProductManager", urlPatterns = {"/productmanage"})
public class ProductManager extends HttpServlet {

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
            out.println("<title>Servlet ProductManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductManager at " + request.getContextPath() + "</h1>");
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
        List<Product> allpro = null;

        if (ac == null) {
            if (search != null) {
                if (txt == null) {
                    allpro = (List<Product>) request.getAttribute("pro");
                } else {
                    dao.searchProduct(txt);
                    allpro = dao.getPro();
                }
            }else if(search == null && txt != null){
                dao.searchProduct(txt);
                    allpro = dao.getPro();
            }else {
                dao.getAllProduct();
                allpro = dao.getPro();
            }
            paginateAndForward(request, response, allpro, txt);
        } else {
            handleAction(request, response, ac);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ac = request.getParameter("action");
        String txt = request.getParameter("txt");
        if (ac == null) {
            dao.searchProduct(txt);
            List<Product> allpro = dao.getPro();
            request.setAttribute("pro", allpro);
            request.setAttribute("search", "search");
            doGet(request, response);
        } else {
            handleAction(request, response, ac);
        }
    }

    private void paginateAndForward(HttpServletRequest request, HttpServletResponse response, List<Product> allpro, String search) throws ServletException, IOException {
        int page, numberPage = 6;
        int size = allpro.size();
        int num = (size % numberPage == 0 ? (size / numberPage) : ((size / numberPage) + 1));
        String xpage = request.getParameter("xpage");

        if (xpage == null || xpage.isEmpty()) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }

        int start = (page - 1) * numberPage;
        int end = Math.min(page * numberPage, size);
        dao.getAllProductPagging(allpro, start, end);
        List<Product> proPagging = dao.getPro();

        dao.getAllCate();
        List<Categories> allcate = dao.getCate();
        dao.getAllBrand();
        List<Brand> allbr = dao.getBrand();
        
        HttpSession session = request.getSession();
        String message = (String) session.getAttribute("messpro");
       

        if (message != null) {
            // Xử lý thông báo, ví dụ hiển thị cho người dùng
            request.setAttribute("mess", message);
            // Xóa thông báo khỏi session sau khi lấy ra để tránh hiển thị lại sau khi tải lại trang
            session.removeAttribute("messpro");
        }


        request.setAttribute("search", search);
        request.setAttribute("num", num);
        request.setAttribute("page", page);
        request.setAttribute("pro", proPagging);
        request.setAttribute("cate", allcate);
        request.setAttribute("br", allbr);
        request.getRequestDispatcher("admin/Productmanager.jsp").forward(request, response);
    }

    private void handleAction(HttpServletRequest request, HttpServletResponse response, String ac) throws ServletException, IOException {
        int action = Integer.parseInt(ac);

        switch (action) {
            case 1:
                response.sendRedirect("createProduct");
                break;
            case 2:
                int pridToDelete = Integer.parseInt(request.getParameter("pid"));
                dao.DeleteProduct(pridToDelete);
                response.sendRedirect("productmanage");
                break;
            case 3:
                int pridToEdit = Integer.parseInt(request.getParameter("pid"));
                Product pro = dao.getProductbyId(pridToEdit);
                dao.getAllCate();
                List<Categories> allcate = dao.getCate();
                dao.getAllBrand();
                List<Brand> allbr = dao.getBrand();
                dao.getProImagebyId(pridToEdit);
                List<Product_Image> imgs = dao.getProimg();

                request.setAttribute("cate", allcate);
                request.setAttribute("imgs", imgs);
                request.setAttribute("br", allbr);
                request.setAttribute("pro", pro);
                request.getRequestDispatcher("admin/updateProduct.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect("productmanage");
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
