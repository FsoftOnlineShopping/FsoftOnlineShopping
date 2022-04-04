/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.LoadMore;

import DAO.Product.productDAO_1;
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
@WebServlet(name = "loadMoreControl", urlPatterns = {"/loadMoreControl"})
public class loadMoreControl extends HttpServlet {

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
        String amount = request.getParameter("amount"); 
        int iamount = Integer.parseInt(amount);
        List<Product> list = productDAO_1.getNext8Product(iamount);
        PrintWriter out = response.getWriter();
        for (Product o: list ){
            out.println(
            "                                <div class=\"col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women\">\n" +
"					<!-- Block2 -->\n" +
"                                        \n" +
"					<div id=\"content\" class=\"number block2\">\n" +
"                                             \n" +
"						<div class=\"block2-pic hov-img0\">\n" +
"							<img src=\""+o.getImageFolder()+"/"+o.getProductID()+" (1).jpg\" alt=\"IMG-PRODUCT\">\n" +
"\n" +
"							<button onclick=\"quickView("+ o.getProductID() +");showModal()\"><a href=\"#\" class=\"block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1\">\n" +
"								Quick View\n" +
"							</a></button>\n" +
"						</div>\n" +
"\n" +
"						<div class=\"block2-txt flex-w flex-t p-t-14\">\n" +
"							<div class=\"block2-txt-child1 flex-col-l \">\n" +
"								<a href=\"DetailControl?productID="+o.getProductID()+"\" class=\"stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6\">\n" +
"									"+o.getProductName()+"\n" +
"								</a>\n" +
"\n" +
"								<span class=\"stext-105 cl3\">\n" +
"									$"+o.getProductPrice()+"\n" +
"								</span>\n" +
"							</div>\n" +
"							<div class=\"block2-txt-child2 flex-r p-t-3\">\n" +
"								<a href=\"#\" class=\"btn-addwish-b2 dis-block pos-relative js-addwish-b2\">\n" +
"									<img class=\"icon-heart1 dis-block trans-04\" src=\"images/icons/icon-heart-01.png\" alt=\"ICON\">\n" +
"									<img class=\"icon-heart2 dis-block trans-04 ab-t-l\" src=\"images/icons/icon-heart-02.png\" alt=\"ICON\">\n" +
"								</a>\n" +
"							</div>\n" +
"						</div>\n" +
"					</div>\n" +
"				</div>"
            );
   
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
