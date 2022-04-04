/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Manager;

import DAO.Category.categoryDAO;
import DAO.Color.colorDAO;
import DAO.Product.productDAO_1;
import Model.Category;
import Model.Color;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SearchProductAdmin", urlPatterns = {"/SearchProductAdmin"})
public class SearchProductAdmin extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        List<Product> listN = productDAO_1.getProductByName(txtSearch);
        PrintWriter out = response.getWriter();
        for(Product o: listN){
            out.print("<div  class=\"col l-3\">\n" +
"                                <div class=\"product-item\">\n" +
"                                    <div class=\"image-part\">\n" +
"                                        <div class=\"image\">\n" +
"                                            <img src=\""+o.getImageFolder()+"/"+o.getProductID()+" (1).jpg\" alt=\"IMG-PRODUCT\">\n" +
"                                        </div>\n" +
"                                        <div class=\"options\">\n" +
"                                            <div class=\"delete d-flex justify-content-center align-items-center\">\n" +
"                                                <i  onclick=\"location.href='DeleteProductControl?productID="+o.getProductID()+"';\" class='bx bx-trash'></i>\n" +
"                                            </div>\n" +
"                                            <div class=\"edit d-flex justify-content-center align-items-center\">\n" +
"                                                <i onclick=\"getProduct("+o.getProductID()+");showModal()\" class='bx bxs-edit'></i>\n" +
"                                            </div>\n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                    <div class=\"body-part\">\n" +
"                                        <div class=\"item-title\">\n" +
"                                            "+o.getProductName()+"\n" +
"                                        </div>\n" +
"                                        <div class=\"item-price\">\n" +
"                                            $"+o.getProductPrice()+"\n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                </div>\n" +
"                            </div>");
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
        processRequest(request, response);
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
