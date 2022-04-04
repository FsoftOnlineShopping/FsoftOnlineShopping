/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Product;

import DBConnection.DBConnection;
import Model.Product;
import Model.ProductColor;
import Model.ProductSize;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class productDAO_1 {
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
                          rs.getFloat("productPrice"), 
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
                          rs.getFloat("productPrice"), 
                          rs.getInt("productNumber"), 
                          rs.getString("productDescription"), 
                          rs.getString("imageFolder")));    
            }
        } catch (Exception e) {
        } return listN;
    }
    
    public static List<Product> checkProductNameExist(int productID, String productName){
        List<Product> listN = new ArrayList<>();
        String query = "select * from [dbo].[Product] where [ProductName]=? and [ProductID]!=?";
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productName);
            ps.setInt(2, productID);
            rs = ps.executeQuery();
            while(rs.next()){
            listN.add(new Product(rs.getInt("productID"), 
                          rs.getInt("categoryID"), 
                          rs.getString("productName"), 
                          rs.getFloat("productPrice"), 
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
                          rs.getFloat("productPrice"), 
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
                          rs.getFloat("productPrice"), 
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
                          rs.getFloat("productPrice"), 
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
                          rs.getFloat("productPrice"), 
                          rs.getInt("productNumber"), 
                          rs.getString("productDescription"), 
                          rs.getString("imageFolder"));
            }
        } catch (Exception e) {
        } return new Product();
    }
    
    public static List<Product> getProductTop8  (){
        List<Product> listT = new ArrayList<>();
        String query = "SELECT TOP 8 * FROM [dbo].[Product]";
        try {
           
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();  
            while(rs.next()){
            listT.add(new Product(rs.getInt("productID"), 
                          rs.getInt("categoryID"), 
                          rs.getString("productName"), 
                          rs.getFloat("productPrice"), 
                          rs.getInt("productNumber"), 
                          rs.getString("productDescription"), 
                          rs.getString("imageFolder")));    
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return listT;
    }
    public static List<Product> getNext8Product(int amount){
        List<Product> listN = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Product] ORDER BY productID "
                + "OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY";
        try {
           
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();  
            while(rs.next()){
            listN.add(new Product(rs.getInt("productID"), 
                          rs.getInt("categoryID"), 
                          rs.getString("productName"), 
                          rs.getFloat("productPrice"), 
                          rs.getInt("productNumber"), 
                          rs.getString("productDescription"), 
                          rs.getString("imageFolder")));    
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return listN;
    }
    public static void deleteProduct(String productID){
        String query = "DELETE FROM [dbo].[ProductColor] WHERE [productID] =?\n" +
                        "DELETE FROM [dbo].[ProductSize] WHERE [productID] =?\n" +
                        "DELETE FROM [dbo].[Product] WHERE [productID] = ?";
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, productID);
            ps.setString(2, productID);
            ps.setString(3, productID);
            ps.executeQuery();  
        } catch (Exception e) {
        }
        
    }
    public static void addProduct(String name, String price, String number, String des, String category){
        String query = " INSERT [dbo].[Product] ([categoryID], [ProductName], [productPrice], [productNumber], [productDescription]) "
                + "VALUES (?,?,?,?,?)";
         try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, category);
            ps.setString(2, name);
            ps.setString(3, price);
            ps.setString(4, number);
            ps.setString(5, des);
            ps.executeQuery();  
        } catch (Exception e) {
        }
    }
    public static void addColorProduct(int productID, String[] color){
        for(int i = 0; i <= color.length - 1 ; i++){
            String query = "INSERT [dbo].[ProductColor] ([productID], [colorID]) VALUES (?, ?)";
            try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setString(2, color[i]);             
            ps.executeQuery();  
        } catch (Exception e) {
            e.printStackTrace();
        }
        }
       
    }
    public static void deleteColorProduct(int productID){
        String query = "delete from [dbo].[ProductColor]\n" +
                    "where [productID] = ?"; 
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.executeQuery(); 
        } catch (Exception e) {
        }
    }
    
    public static void addSizeProduct(int productID, String[] size){
        for(int i = 0; i <= size.length - 1 ; i++){
            String query = "INSERT [dbo].[ProductSize] ([productID], [sizeID]) VALUES (?, ?)";
            try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setString(2, size[i]);             
            ps.executeQuery();  
        } catch (Exception e) {
            e.printStackTrace();
        }
        }
       
    }
    public static void deleteSizeProduct(int productID){
        String query = "delete from [dbo].[ProductSize]\n" +
                    "where [productID] = ?"; 
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.executeQuery(); 
        } catch (Exception e) {
        }
    }
    public static void editProduct(String name, String price, String number, String des, String categoryid, String pid){
        String query = " update [dbo].[Product]\n" +
                        "set [ProductName] = ?,\n" +
                        "	[productPrice] = ?,\n" +
                        "	[productNumber] = ?,\n" +
                        "	[productDescription] = ?,\n" +
                        "	[categoryID] = ?\n" +
                        "where [productID] = ?";
         try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, number);
            ps.setString(4, des);
            ps.setString(5, categoryid);
            ps.setString(6, pid);
            
            
            ps.executeQuery();  
        } catch (Exception e) {
        }
    }
    
    public static void editImageFolderProduct(String image, int id){
        String query = " UPDATE [dbo].[Product] SET [IMAGEFOLDER] = ? WHERE [productID] = ?";
         try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, image);
            ps.setInt(2, id);
            ps.executeQuery();  
        } catch (Exception e) {
        }
    }
    public static List<ProductColor> getColorIDByProductID(int id){
        List<ProductColor> listCl = new ArrayList<>();
        String query = "SELECT * \n" +
                       "FROM ProductColor\n" +
                       "WHERE productID = ?" ;
        try {
            
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();  
            while(rs.next()){
            listCl.add(new ProductColor(rs.getInt("productID"), 
                          rs.getInt("colorID")));    
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return listCl;
    }
    public static List<ProductSize> getSizeByProductID(int id){
      List<ProductSize> listSz = new ArrayList<>();
      String query = "SELECT * \n" +
                    "FROM [dbo].[ProductSize]\n" +
                    "WHERE [productID] = ?";
      try {
            
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();  
            while(rs.next()){
            listSz.add(new ProductSize(rs.getInt("productID"), 
                          rs.getString("sizeID")));    
            }
        } catch (Exception e) {
            e.printStackTrace();
        } return listSz;
      
    }
      public static Product getProduct(String u) {
        try {
            conn = new DBConnection().makeConnection();
           
            
            if (conn != null) {
                String query = "select * from Product where ProductName=?";
                 ps = conn.prepareStatement(query);
                ps.setString(1, u);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7));
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(productDAO_1.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                Logger.getLogger(productDAO_1.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return null;
    }
    
    public static void main(String[] args) {
               

             Product list = productDAO_1.getProduct("Purl Knit Button-Front Cropped Cardigan");
        System.out.println(list);
        
    }
}
