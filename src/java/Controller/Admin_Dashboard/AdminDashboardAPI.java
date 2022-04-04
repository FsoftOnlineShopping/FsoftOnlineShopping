/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin_Dashboard;

import DAO.Account.AccountDAO;
import DAO.Cart.Dashboard_CartDAO;
import Model.Account;
import Model.Cart;
import ModelResponse.AccountDashboard;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class AdminDashboardAPI extends HttpServlet {

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
            out.println("<title>Servlet AdminDashboardAPI</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDashboardAPI at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        Account currentAccount = (Account) request.getSession().getAttribute("currentAccount");
        if (currentAccount != null && currentAccount.getUserRole() == 1) {
            try {
                int newUsers = AccountDAO.countNewUsers(60);
                int newOrders = Dashboard_CartDAO.countNewOrders(60);
                float totalIncome = Dashboard_CartDAO.countTotalIncome();

                float[] incomeThisMonth = new float[10], incomeLastMonth = new float[10];
                int j = 0;
                for (int i = 1; i <= 30; i += 3) {                   
                    incomeThisMonth[j] = Dashboard_CartDAO.countIncomeThisMonth(i, i + 2);                   
                    incomeLastMonth[j] = Dashboard_CartDAO.countIncomeLastMonth(i, i + 2);   
                    j++;
                }
                
                ArrayList<AccountDashboard> listAccount = Dashboard_CartDAO.getTopOrders();
                ArrayList<Cart> listCart = Dashboard_CartDAO.getLatestOrders();

                ObjectMapper mapper = new ObjectMapper();
                ObjectNode rootNode = mapper.createObjectNode();

                rootNode.put("newUsers", newUsers);
                rootNode.put("newOrders", newOrders);
                rootNode.put("totalIncome", totalIncome);
                rootNode.putPOJO("incomeThisMonth", incomeThisMonth);
                rootNode.putPOJO("incomeLastMonth", incomeLastMonth);
                rootNode.putPOJO("topCustomers", listAccount);
                rootNode.putPOJO("latestOrders", listCart);

                String dataReturn = mapper.writeValueAsString(rootNode);

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.print(dataReturn);
                out.flush();

            } catch (SQLException ex) {
                Logger.getLogger(AdminDashboardAPI.class.getName()).log(Level.SEVERE, null, ex);
            }
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
