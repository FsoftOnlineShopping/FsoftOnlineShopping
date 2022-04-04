/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Product;

import DBConnection.DBConnection;
import Model.Product;
import Model.ProductComment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ハン
 */
public class ProductDAO {

    DBConnection db = new DBConnection();
    Connection con;
    PreparedStatement ps;
    Statement stmt;
    ResultSet rs;

    public List<Product> getFeaturedProduct() {
        List<Product> plist = new ArrayList<>();
        String sql = "SELECT top(8) * FROM Product;";
        try {
            con = db.makeConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Product pro = new Product();
                pro.setProductID(rs.getInt("productID"));
                pro.setCategoryID(rs.getInt("CategoryID"));
                pro.setProductName(rs.getString("ProductName"));
                pro.setProductPrice(rs.getFloat("ProductPrice"));
                pro.setProductNumber(rs.getInt("ProductNumber"));
                pro.setProductDescription(rs.getString("ProductDescription"));
                pro.setImageFolder(rs.getString("ImageFolder"));
                plist.add(pro);
            }
            con.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return plist;
    }
    
    public Product getProductById(int id) throws Exception {
        Product pro = new Product();
        String sql = "SELECT * FROM Product WHERE productID=?";
        try {
            con = db.makeConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int productID = rs.getInt("productID");
                int categoryID = rs.getInt("CategoryID");
                String productName = rs.getString("ProductName");
                float productPrice = rs.getFloat("ProductPrice");
                int productNumber = rs.getInt("ProductNumber");
                String productDescription = rs.getString("ProductDescription");
                String imageFolder = rs.getString("ImageFolder");
                pro = new Product(productID, categoryID, productName, productPrice, productNumber, productDescription, imageFolder);
            }
            con.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pro;
    }
    
    public int insertComment(ProductComment pc) throws Exception {
        int status = 0;
        String sql = "INSERT INTO ProductComment VALUES(?,?,?,?)";
        try {
            con = db.makeConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, pc.getProductID());
            ps.setString(2, pc.getUserName());
            ps.setString(3, pc.getCommentContent());
            ps.setInt(4, pc.getRating());
            status = ps.executeUpdate();
            con.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);	
        }
        return status;
    }
    
    public List<ProductComment> getListCommentByProID(int id) {
        List<ProductComment> pcList = new ArrayList<>();
        String sql = "SELECT * FROM ProductComment WHERE productID=?";
        try {
            con = db.makeConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductComment pc = new ProductComment();
                pc.setProductID(rs.getInt("productID"));
                pc.setUserName(rs.getString("userName"));
                pc.setCommentContent(rs.getString("commentContent"));
                pc.setRating(rs.getInt("rating"));
                pcList.add(pc);
            }
            con.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pcList;
    }
    
}
