    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProductCorlor;

import DAO.Product.productDAO_1;
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
public class ProductColorDAO {
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    
    public static List<Product> getProductByColorID(String ColorID){
        List<Product> products = new ArrayList();
        
        String query = "select * from ProductColor where colorID = ?";
        
        try {
            conn = new DBConnection().makeConnection();
            ps = conn.prepareStatement(query);
            
            ps.setInt(1, Integer.parseInt(ColorID));
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                String productID = Integer.toString(rs.getInt(1));
                System.out.println(productID);
                products.add(productDAO_1.getProductByID(productID));
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        
        System.out.println(products);
        return products;
    }
}
