/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Manager;

import DAO.Category.categoryDAO;
import DAO.Color.colorDAO;
import DAO.Product.productDAO_1;
import Model.Category;
import Model.Color;
import Model.Product;
import Model.ProductColor;
import Model.ProductSize;
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
@WebServlet(name = "LoadProductControl", urlPatterns = {"/LoadProductControl"})
public class LoadProductControl extends HttpServlet {

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
        String id = request.getParameter("pid");
        Product product = productDAO_1.getProductByID(id);
        List<ProductColor> productColor = productDAO_1.getColorIDByProductID(Integer.parseInt(id));
        List<Category> listC = categoryDAO.getAllCategory();
        List<Color> listCo = colorDAO.getAllColor();
        List<ProductSize> productSize = productDAO_1.getSizeByProductID(Integer.parseInt(id));

        try (PrintWriter out = response.getWriter()) {
            out.println(" \n"
                    + "                <div class=\"modal-image-all\">\n"
                    + "                    <div class=\"\"><img src=\"" + product.getImageFolder() + "/" + product.getProductID() + " (1).jpg\" alt=\"IMG-PRODUCT\"></div>\n"
                    + "                </div>\n"
                    + "                <div class=\"modal-id\">\n"
                    + "                    <div>Product ID</div>\n"
                    + "                    <input value=\""+product.getProductID()+"\" id=\"pid\" name=\"id\" type=\"text\" readonly>\n"
                    + "                </div>\n"        
                    + "                <div class=\"modal-name\">\n"
                    + "                    <div>Product Name<font color=\"red\" id=\"message-pname\"></font></div>\n"
                    + "                    <input type=\"text\" name=\"name\" id=\"pname\" value=\"" + product.getProductName() + "\">\n"
                    + "                </div>\n"
                    + "                <div class=\"modal-description\">\n"
                    + "                    <div>Product Description</div>\n"
                    + "                    <input type=\"text\" name=\"des\" value=\"" + product.getProductDescription() + "\">\n"
                    + "                </div>\n"
                    + "                <div class=\"modal-category\">\n"
                    + "                      <div> Category </div>\n"
                    + "                     <select name=\"category\" class=\"form-select\" aria-label=\"Default select example\">\n");
            for (Category cate : listC) {
                out.println("       <option " + (cate.getCategoryID() == product.getCategoryID() ? "selected" : "") + " value=\"" + cate.getCategoryID() + "\">" + cate.getCategoryName() + "</option>");
            }
            out.print("                                </select> "
                    + "  <div> Color </div>\n"
                    + "<select name=\"color\" multiple id=\"colorSelect\">");
            for (Color o : listCo) {
                boolean b = false;
                for (ProductColor e : productColor) {
                    if (o.getColorID() == e.getColorID()) {
                        b = true;
                        break;
                    }
                }
                out.println(""
                        + "<option " + (b == true ? "selected" : "") + " value=\"" + o.getColorID() + "\">" + o.getColorName() + " </option>\n"
                                + "");
            }
            out.println("</select>"
                    + "<div id=\"sizeSelect\">"
                    + "<div>Size</div>\n"
                    + "");
            for (int i = 0; i < productSize.size(); i++){
                ProductSize size = productSize.get(i);
                if (size.getSizeID().equals("S")){
                    out.print("<input checked name=\"size\" type=\"checkbox\"  value=\"S\">S\n");
                    break;
                }
                if (i == productSize.size() - 1) out.print("<input name=\"size\" type=\"checkbox\"  value=\"S\">S\n");
            }
            for (int i = 0; i < productSize.size(); i++){
                ProductSize size = productSize.get(i);
                if (size.getSizeID().equals("M")){
                    out.print("<input checked name=\"size\" type=\"checkbox\"  value=\"M\">M\n");
                    break;
                }
                if (i == productSize.size() - 1) out.print("<input name=\"size\" type=\"checkbox\"  value=\"M\">M\n");
            }
            for (int i = 0; i < productSize.size(); i++){
                ProductSize size = productSize.get(i);
                if (size.getSizeID().equals("L")){
                    out.print("<input checked name=\"size\" type=\"checkbox\"  value=\"L\">L\n");
                    break;
                }
                if (i == productSize.size() - 1) out.print("<input name=\"size\" type=\"checkbox\"  value=\"L\">L\n");
            }
            for (int i = 0; i < productSize.size(); i++){
                ProductSize size = productSize.get(i);
                if (size.getSizeID().equals("XL")){
                    out.print("<input checked name=\"size\" type=\"checkbox\"  value=\"XL\">XL\n");
                    break;
                }
                if (i == productSize.size() - 1) out.print("<input name=\"size\" type=\"checkbox\"  value=\"XL\">XL\n");
            } 
            for (int i = 0; i < productSize.size(); i++){
                ProductSize size = productSize.get(i);
                if (size.getSizeID().equals("2XL")){
                    out.print("<input checked name=\"size\" type=\"checkbox\"  value=\"2XL\">2XL\n");
                    break;
                }
                if (i == productSize.size() - 1) out.print("<input name=\"size\" type=\"checkbox\"  value=\"2XL\">2XL\n");
            }
            for (int i = 0; i < productSize.size(); i++){
                ProductSize size = productSize.get(i);
                if (size.getSizeID().equals("3XL")){
                    out.print("<input checked name=\"size\" type=\"checkbox\"  value=\"3XL\">3XL\n");
                    break;
                }
                if (i == productSize.size() - 1) out.print("<input name=\"size\" type=\"checkbox\"  value=\"3XL\">3XL\n");
            }
            out.print("</div>"
                    + "</div>\n"
                    + "                <div class=\"modal-number\">\n"
                    + "                    <div>Product Number</div>\n"
                    + "                    <input type=\"number\" min=\"0\" name=\"number\" value=\"" + product.getProductNumber() + "\">\n"
                    + "                </div>\n"
                    + "                <div class=\"modal-price\">\n"
                    + "                    <div>Product Price</div>\n"
                    + "                    <input type=\"number\" min=\"0\" name=\"price\" value=\"" + product.getProductPrice() + "\">\n"
                    + "                </div>\n"
                    + "                <div class=\"modal-image\">\n" +
"                    <div>Product Image</div>\n" +

"                                    <input name=\"image\" type=\"file\" size=\"60\"  id=\"file-upload-1\" accept=\"image/png, image/jpeg\"   />\n" +
                            "                    <div>Detail Image</div>\n" +
"                                    <input name=\"images\" type=\"file\" size=\"60\" id=\"file-upload-2\" accept=\"image/png, image/jpeg\" multiple />\n" +
"                   \n" +
"                </div>\n" +
"                <div class=\"modal-button\">\n" +
"                    <div class=\"modal-footer\">\n" +
"                                 <input type=\"submit\" role=\"button\" value=\"Save\">\n" +
"                    </div>\n" +
"                </div>"
                    + "           "
            );
        }

//        request.setAttribute("detail", product);
//        request.setAttribute("colordetail", productColor);
//        request.setAttribute("listC", listC);
//        request.setAttribute("listCo", listCo);
//        request.setAttribute("sizedetail", productSize);
//        request.getRequestDispatcher("admin-product.jsp").forward(request, response);
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
