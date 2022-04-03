/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Product;

import DBConnection.DBConnection;
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
public class productDAO {
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    
    public static List<Product> getAllProduct(){ 
        List<Product> listP = new ArrayList<>();
        String query = "select * from Product";
        
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {   
                  listP.add(new Product(rs.getInt("productID"), 
                          rs.getInt("categoryID"), 
                          rs.getString("productName"), 
                          rs.getDouble("productPrice"), 
                          rs.getInt("productNumber"), 
                          rs.getString("productDescription"), 
                          rs.getString("imageFolder")));

            }
        } catch (Exception e) {
        }
        
        return listP;
    }
    public static List<Product> getProductByName(String txtSearch){
        List<Product> listN = new ArrayList<>();
        String query = "select * from [dbo].[Product] where [ProductName] like ? ";
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,"%"+txtSearch+"%");
            rs = ps.executeQuery();
            while(rs.next()){
            listN.add(new Product(rs.getInt("productID"), 
                          rs.getInt("categoryID"), 
                          rs.getString("productName"), 
                          rs.getDouble("productPrice"), 
                          rs.getInt("productNumber"), 
                          rs.getString("productDescription"), 
                          rs.getString("imageFolder")));    
            }
        } catch (Exception e) {
        } return listN;
    }
    public static List<Product> getProductByOrder(String sort){
        List<Product> listLH = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Product] ORDER BY [productPrice] " + sort;
        try {
            System.out.println("productDAO: " + " " + sort); 
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();  
            while(rs.next()){
            listLH.add(new Product(rs.getInt("productID"), 
                          rs.getInt("categoryID"), 
                          rs.getString("productName"), 
                          rs.getDouble("productPrice"), 
                          rs.getInt("productNumber"), 
                          rs.getString("productDescription"), 
                          rs.getString("imageFolder")));    
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return listLH;
    }
    public static List<Product> getProductByNewID(){
        List<Product> listLH = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Product] ORDER BY [productID] DESC ";
        try {
           
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();  
            while(rs.next()){
            listLH.add(new Product(rs.getInt("productID"), 
                          rs.getInt("categoryID"), 
                          rs.getString("productName"), 
                          rs.getDouble("productPrice"), 
                          rs.getInt("productNumber"), 
                          rs.getString("productDescription"), 
                          rs.getString("imageFolder")));    
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return listLH;
    }
    public static List<Product> getProductByPrice(String price){
        List<Product> listBP = new ArrayList<>();
        String query = "SELECT * \n" +
                       "FROM Product\n" +
                       "WHERE productPrice " + price;
        try {
            System.out.println("productDAO: " + " " + price); 
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();  
            while(rs.next()){
            listBP.add(new Product(rs.getInt("productID"), 
                          rs.getInt("categoryID"), 
                          rs.getString("productName"), 
                          rs.getDouble("productPrice"), 
                          rs.getInt("productNumber"), 
                          rs.getString("productDescription"), 
                          rs.getString("imageFolder")));    
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return listBP;
    }
    public static Product getProductByID(String productID){
        String query = "select * from [dbo].[Product] where [productID] = ? "; 
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            rs = ps.executeQuery();
            if(rs.next()){
            return new Product(rs.getInt("productID"), 
                          rs.getInt("categoryID"), 
                          rs.getString("productName"), 
                          rs.getDouble("productPrice"), 
                          rs.getInt("productNumber"), 
                          rs.getString("productDescription"), 
                          rs.getString("imageFolder"));
            }
        } catch (Exception e) {
        } return new Product();
    }
}
