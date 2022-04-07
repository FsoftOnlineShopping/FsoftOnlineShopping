/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.ManagerCategory;

import DAO.Category.categoryDAO;
import Model.Category;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoadEditCategory", urlPatterns = {"/LoadEditCategory"})
public class LoadEditCategory extends HttpServlet {

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
        String id = request.getParameter("caid");
        System.out.println(id);
        Category category = categoryDAO.getCategoryByID(id);
         try (PrintWriter out = response.getWriter()) {
            out.println(""
                    + " <div class=\"modal-id\">\n" +
"                <input id=\"cid\" type=\"hidden\" name=\"cid\" value=\""+category.getCategoryID()+"\">\n" +
"                <div class=\"modal-name\">\n" +
"                    <div>Category Name</div>\n" +
"                    <input id=\"name\" type=\"text\" name=\"cname\" value=\""+category.getCategoryName()+"\">\n" +
"                </div>\n" +
"                \n" +
"                <div class=\"modal-button\">\n" +
"                            <div class=\"modal-footer\">\n" +
"                                <input type=\"button\" value=\"Save\" onclick=\"validate()\">\n" +
"                            </div>\n" +
"                        </div>");
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
