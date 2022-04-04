/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Category;

import DBConnection.DBConnection;
import Model.Category;
import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class categoryDAO {
    
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    
    
    public static List<Category> getAllCategory(){
        List<Category> listC = new ArrayList<>();
        String query = "select * from Category";
        
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {   
                  listC.add(new Category(rs.getInt("categoryID"), 
                          rs.getString("categoryIcon"), 
                          rs.getString("categoryName")));

            }
        } catch (Exception e) {
        }
        
        return listC;
    }
    public static List<Product> getProductByCategoryID(String categoryID){
        List<Product> listbyC = new ArrayList<>();
        String query = "select * from Product where categoryID = ?";
        try {
           
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryID);
            rs = ps.executeQuery();  
            while(rs.next()){
            listbyC.add(new Product(rs.getInt("productID"), 
                          rs.getInt("categoryID"), 
                          rs.getString("productName"), 
                          rs.getFloat("productPrice"), 
                          rs.getInt("productNumber"), 
                          rs.getString("productDescription"), 
                          rs.getString("imageFolder")));    
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return listbyC;
    }
    
    
    public static void main(String[] args) {
       
        
            List<Product> list = categoryDAO.getProductByCategoryID("1");
        for (Product o : list){
            System.out.println(o);
        }
        
    }
}
