/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Color;

import DBConnection.DBConnection;
import Model.Color;
import Model.ProductColor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class colorDAO {
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    
    
    public static List<Color> getAllColor(){
        List<Color> listCo = new ArrayList<>();
        String query = "select * from Color";
        
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {   
                  listCo.add(new Color(rs.getInt("colorID"), 
                          rs.getString("colorName")));

            }
        } catch (Exception e) {
        }
        
        return listCo;
    }

    public static void main(String[] args) {
    }
}
