/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Product;

import DAO.Category.categoryDAO;
import DAO.Color.colorDAO;
import DAO.Product.productDAO;
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
@WebServlet(name = "SortControl", urlPatterns = {"/SortControl"}) 
public class SortControl extends HttpServlet {

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
        
        String sort = request.getParameter("sort");
        
        List<Category> listC = categoryDAO.getAllCategory();
        List<Color> listCo = colorDAO.getAllColor();
         
        
        request.setAttribute("listC", listC);
        request.setAttribute("listCo", listCo);
        
        
        List<Product> listSortO;
        List<Product> listSortP;
      
        if(sort.equals("LH")){     
           listSortO = productDAO.getProductByOrder("ASC");
           request.setAttribute("listP", listSortO);   
        }else if(sort.equals("HL")) {
            listSortO = productDAO.getProductByOrder("DESC");
            request.setAttribute("listP", listSortO); 
        } else if(sort.equals("NN")){
            listSortO = productDAO.getProductByNewID();
            request.setAttribute("listP", listSortO);  
        }else
        if(sort.equals("P1")){
            listSortP = productDAO.getProductByPrice("BETWEEN 0 AND 10");
            request.setAttribute("listP", listSortP);
        } else if(sort.equals("P2")){
            listSortP = productDAO.getProductByPrice("BETWEEN 10 AND 25");
            request.setAttribute("listP", listSortP);
        }else if(sort.equals("P3")){
            listSortP = productDAO.getProductByPrice("BETWEEN 25 AND 40");
            request.setAttribute("listP", listSortP);
        }else if(sort.equals("P4")){
            listSortP = productDAO.getProductByPrice("BETWEEN 40 AND 50");
            request.setAttribute("listP", listSortP);
        }else if(sort.equals("P5")){
            listSortP = productDAO.getProductByPrice("> 50");
            request.setAttribute("listP", listSortP);
        }
        
        
        
        
        request.getRequestDispatcher("product.jsp").forward(request, response);
        
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
