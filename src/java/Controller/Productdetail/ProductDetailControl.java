/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Productdetail;

import DAO.Color.colorDAO;
import DAO.Product.ProductDAO;
import DAO.Product.productDAO_1;
import Model.Color;
import Model.Product;
import Model.ProductColor;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ハン
 */
@WebServlet(name = "ProductDetailControl", urlPatterns = {"/ProductDetailControl"})
public class ProductDetailControl extends HttpServlet {

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
        ProductDAO pdao = new ProductDAO();
        productDAO_1 pdao1 = new productDAO_1();
        Product p;
        String tid = request.getParameter("productID");
        int id;
        try {
            id = Integer.parseInt(tid);
            p = pdao.getProductById(id);
            List<ProductColor> pColor = pdao1.getColorIDByProductID(id);
            List<Color> color = colorDAO.getAllColor();
            List<String> colorName = new ArrayList<>();
            for (ProductColor c : pColor) {
                for (Color co : color) {
                    if (c.getColorID() == co.getColorID()) {
                        colorName.add(co.getColorName());
                    }
                }
            }
            
            File path = new File(request.getServletContext().getRealPath("/"));
            File dir = new File(path + "/" + p.getImageFolder());
            List<String> images = Arrays.asList(dir.listFiles())
                    .stream()
                    .map(f -> {
                        return path.toURI().relativize(f.toURI()).getPath();
                    })
                    .collect(Collectors.toList());
            System.out.println(path);
            System.out.println(images);
            request.setAttribute("images", images);
            request.setAttribute("colorName", colorName);
            request.getRequestDispatcher("product-detail.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProductDetailControl.class.getName()).log(Level.SEVERE, null, ex);
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
