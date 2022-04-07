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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ハン
 */
@WebServlet(name = "CartSortingControl", urlPatterns = {"/CartSortingControl"})
public class CartSortingControl extends HttpServlet {

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
        String sortID = request.getParameter("sortID");
        CartDAO cdao = new CartDAO();
        try {
            if ("AToZ".equals(sortID)) {
                List<Cart> listAtoZ = cdao.getListCartByNameAsc();
                request.setAttribute("listC", listAtoZ);
                request.getRequestDispatcher("admin-order.jsp").forward(request, response);
            }
            if ("ZtoA".equals(sortID)) {
                List<Cart> listAtoZ = cdao.getListCartByNameDesc();
                request.setAttribute("listC", listAtoZ);
                request.getRequestDispatcher("admin-order.jsp").forward(request, response);
            }
            if ("orderDateNewest".equals(sortID)) {
                List<Cart> listAtoZ = cdao.getListCartByDayNewest();
                request.setAttribute("listC", listAtoZ);
                request.getRequestDispatcher("admin-order.jsp").forward(request, response);
            }
            if ("orderDateOldest".equals(sortID)) {
                List<Cart> listAtoZ = cdao.getListCartByDayOldest();
                request.setAttribute("listC", listAtoZ);
                request.getRequestDispatcher("admin-order.jsp").forward(request, response);
            }
            if ("billTotalLargeToSmall".equals(sortID)) {
                List<Cart> listAtoZ = cdao.getListCartByHighToLowPrice();
                request.setAttribute("listC", listAtoZ);
                request.getRequestDispatcher("admin-order.jsp").forward(request, response);
            }
            if ("billTotalSmallToLarge".equals(sortID)) {
                List<Cart> listAtoZ = cdao.getListCartByLowToHighPrice();
                request.setAttribute("listC", listAtoZ);
                request.getRequestDispatcher("admin-order.jsp").forward(request, response);
            }       
        } catch (Exception ex) {
            Logger.getLogger(CartManagerControl.class.getName()).log(Level.SEVERE, null, ex);
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
