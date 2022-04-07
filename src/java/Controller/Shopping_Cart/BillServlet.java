/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Shopping_Cart;

import DAO.Cart.CartDAO;
import Model.Account;
import Model.Cart;
import Model.CartItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ハン
 */
public class BillServlet extends HttpServlet {

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
            out.println("<title>Servlet BillServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BillServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        CartItem cartItem = null;
        CartDAO cdao = new CartDAO();
        Object o = session.getAttribute("cart");
//      available
        if (o != null) {
            cartItem = (CartItem) o;
        }
        Account account = null;
        account = (Account) session.getAttribute("currentAccount");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        } else {
            String userName = account.getUserName();
            String couponID = "0";
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String payment = request.getParameter("payment");
            int paymentMethodID = 0;
            if("Momo".equals(payment)) {
                paymentMethodID = 1;
            } if("CreditCard".equals(payment)) {
                paymentMethodID = 2;
            } if("Bank".equals(payment)) {
                paymentMethodID = 3;
            } if("COD".equals(payment)) {
                paymentMethodID = 4;  // COD
            } 
            Date paymentDate = new Date(System.currentTimeMillis());
            Date deliverDate = new Date(System.currentTimeMillis());
            float totalPrice = cartItem.getTotalMoney();                 
            Cart c = new Cart(userName, couponID, paymentMethodID, paymentDate, deliverDate, 0, totalPrice);
            cdao.addCart(c, cartItem);
            session.removeAttribute("cart");
            request.getRequestDispatcher("shoping-cart.jsp").forward(request, response);
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
