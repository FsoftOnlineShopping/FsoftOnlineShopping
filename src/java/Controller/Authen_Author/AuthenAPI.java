/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Authen_Author;

import DAO.Account.AccountDAO;
import Utils.HttpUtil;
import Model.Account;
import ModelResponse.AccountResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
//url pattern: '/api-authen'
public class AuthenAPI extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet AuthenAPI</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet AuthenAPI at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
        doPost(request,response);
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

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Account account = HttpUtil.of(request.getReader()).toModel(Account.class);
        System.out.println(account);
        try {
            Account currentAccount = AccountDAO.checkLogin(account.getUserName(), account.getUserPassword());
            AccountResponse currentAccountResponse = null;
            if (currentAccount != null) {
//                System.out.println(currentAccount);
                 currentAccountResponse = 
                        new AccountResponse(currentAccount.getUserEmail(), 
                                currentAccount.getUserFullname(), 
                                currentAccount.getUserAddress(), 
                                currentAccount.getUserAvatar(),
                                currentAccount.getUserFacebook(),
                                currentAccount.getUserRole(),
                                currentAccount.getAccountState());
                HttpSession session = request.getSession();
                session.setAttribute("currentAccount", currentAccount);
            }
           
            ObjectMapper mapper = new ObjectMapper();
            String currentAccountJson = mapper.writeValueAsString(currentAccountResponse);
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(currentAccountJson);
            out.flush();
//            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AuthenAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
//        System.out.println(account);

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
