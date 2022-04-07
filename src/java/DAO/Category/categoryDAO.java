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
import java.sql.SQLException;
import java.sql.Statement;
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

    public static List<Category> getAllCategory() {
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

    public static List<Product> getProductByCategoryID(String categoryID) {
        List<Product> listbyC = new ArrayList<>();
        String query = "select * from Product where categoryID = ?";
        try {

            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, categoryID);
            rs = ps.executeQuery();
            while (rs.next()) {
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
        }
        return listbyC;
    }
    
        public static int checkCategoryNameExists(String name) {
        String query = "select * from [dbo].[Category] where [categoryName] = ? COLLATE Latin1_General_CS_AS";
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            
            rs = ps.executeQuery();
            if (rs.next()) {
                return 1;
            } else return 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public static List<Category> getCategoryByName(String txtSearch) {
        List<Category> listN = new ArrayList<>();
        String query = "select * from [dbo].[Category] where [categoryName] like ? ";
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                listN.add(new Category(rs.getInt("categoryID"),
                        rs.getString("categoryIcon"),
                        rs.getString("categoryName")));

            }
        } catch (Exception e) {
        }
        return listN;
    }

    public static List<Category> getCategoryByOrder(String sort) {
        List<Category> listLH = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Category] ORDER BY [categoryName] " + sort;
        try {
            System.out.println("c: " + " " + sort);
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                listLH.add(new Category(rs.getInt("categoryID"),
                        rs.getString("categoryIcon"),
                        rs.getString("categoryName")));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listLH;
    }

    public static void addCategory(String name) {
        String query = " INSERT [dbo].[Category] ([categoryName]) "
                + "VALUES (?)";
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, name);

            ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();

            if (generatedKeys.next()) {

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static Category getCategoryByID(String id) {
        String query = "select * from [dbo].[Category] where [categoryID] = ? ";
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Category(rs.getInt("categoryID"), rs.getString("categoryIcon"), rs.getString("categoryName"));
            }
        } catch (Exception e) {
        }
        return new Category();
    }

    public static void editCategory(String id, String name) {
        String query = " update [dbo].[Category]\n"
                + "set [categoryName] = ?\n"
                + "where [categoryID] = ?";
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, id);
            System.out.println(id + " " + name);
            System.out.println(ps.executeUpdate());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

        addCategory("test2");

    }
}
