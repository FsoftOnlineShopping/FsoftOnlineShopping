/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Manager;

import DAO.Cart.CartDAO;
import Model.Cart;
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
 * @author ハン
 */
@WebServlet(name = "SearchOrderAdmin", urlPatterns = {"/SearchOrderAdmin"})
public class SearchOrderAdmin extends HttpServlet {

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
        CartDAO cdao = new CartDAO();
        List<Cart> listN = cdao.getCartById(txtSearch);
        PrintWriter out = response.getWriter();
        for(Cart o: listN){
            out.print("                                        <tr>\n" +
"                                            <th>ID</th>\n" +
"                                            <th>Username</th>\n" +
"                                            <th>Payment Date</th>\n" +
"                                            <th>Deliver Date</th>  \n" +
"                                            <th>Coupon</th>\n" +
"                                            <th>Payment Method</th>\n" +
"                                            <th>Discount</th>\n" +
"                                            <th>Bill Total</th>\n" +
"                                            <th>Status</th>\n" +
"                                        </tr><tr>\n" +
"                                        <td>#"+o.getCartID()+"</td>\n" +
"                                        <td>"+o.getUserName()+"</td>\n" +
"                                        <td>"+o.getPaymentDate()+"</td>\n" +
"                                        <td>"+o.getDeliverDate()+"</td>\n" +
"                                        <td>"+o.getCouponID()+"</td>\n" +
"                                        <td>"+o.getPaymentMethodID()+"</td>\n" +
"                                        <td>-$0</td>\n" +
"                                        <td>$"+o.getTotalPrice()+"</td>\n" +
"                                        <td><span class=\"status paid\">Paid</span></td>\n" +
"                                    </tr>");
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
