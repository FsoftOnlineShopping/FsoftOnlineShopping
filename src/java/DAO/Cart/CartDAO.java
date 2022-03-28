/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Cart;

import DAO.Product.ProductDAO;
import DBConnection.DBConnection;
import Model.Cart;
import Model.CartItem;
import Model.CartProduct;
import Model.Item;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ハン
 */
public class CartDAO {
    DBConnection db = new DBConnection();
    Connection con;
    PreparedStatement ps;
    Statement stmt;
    ResultSet rs;
    
    public List<CartProduct> getListCartProduct(int cartID) throws Exception {
        List<CartProduct> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM CartProduct WHERE cartID = ?";
            Connection con = db.makeConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, cartID);
            rs = ps.executeQuery();
            while (rs.next()) {
                CartProduct cartPro = new CartProduct();
                cartPro.setCartID(rs.getInt("cartID"));
                cartPro.setProductID(rs.getInt("productID"));
                cartPro.setQuantity(rs.getInt("quantity"));
                list.add(cartPro);
            }
            con.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public void addCart(Cart cart, CartItem cartItem) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            String sql = "INSERT INTO [Cart] VALUES(?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, cart.getUserName());
            ps.setString(2, cart.getCouponID());
            ps.setInt(3, cart.getPaymentMethodID());
            ps.setString(4, date);
            ps.setString(5, date);
            ps.setInt(6, cart.getCartStatus());
            ps.setFloat(7, cart.getTotalPrice());
            ps.executeUpdate();
//          get id of newest order
            String sql1 = "SELECT TOP 1 cartID from [Cart] ORDER BY cartID DESC";
            PreparedStatement st1 = con.prepareStatement(sql1);
            rs = st1.executeQuery();
//          add to cart product
            if (rs.next()) {
                int cartID = rs.getInt(1);
                for (Item i : cartItem.getItems()) {
                    String sql2 = "INSERT INTO [CartProduct] VALUES(?, ?, ?)";
                    PreparedStatement st2 = con.prepareCall(sql2);
                    st2.setInt(1, cartID);
                    st2.setInt(2, i.getProduct().getProductID());
                    st2.setInt(3, i.getQuantity());
                    st2.executeUpdate();
                }
            } 
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
