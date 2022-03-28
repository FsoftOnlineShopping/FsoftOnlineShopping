/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Shopping_Cart;

import DAO.Product.ProductDAO;
import Model.Account;
import Model.CartItem;
import Model.Item;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ハン
 */
public class BuyServlet extends HttpServlet {

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
            out.println("<title>Servlet BuyServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
        Account account = null;
        account = (Account) session.getAttribute("currentAccount");
        if (account == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        CartItem cartItem = null;
        Object o = session.getAttribute("cart");
//      available
        if (o != null) {
            cartItem = (CartItem) o;
        } else {
            cartItem = new CartItem();
        }
        String tnum = request.getParameter("num");
        String tid = request.getParameter("productID");
        int num, id;
        try {
            num = Integer.parseInt(tnum);
            id = Integer.parseInt(tid);
            ProductDAO proDao = new ProductDAO();
            Product p = proDao.getProductById(id);
            float price = (float) (p.getProductPrice());
            Item t = new Item(p, num, price);
            cartItem.addItem(t);
        } catch (Exception e) {
            num = 1;
        }
        List<Item> list = cartItem.getItems();
        session.setAttribute("cart", cartItem);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("product-detail.jsp").forward(request, response);
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
