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
        try {
            String sql = "INSERT INTO [Cart] VALUES(?, ?, ?, ?, ?, ?, ?)";
            Connection con = db.makeConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cart.getUserName());
            ps.setString(2, cart.getCouponID());
            ps.setInt(3, cart.getPaymentMethodID());
            ps.setDate(4, cart.getPaymentDate());
            ps.setDate(5, cart.getDeliverDate());
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
    
    public ArrayList<Cart> getListCart() throws Exception {
        try {
            String sql = "SELECT * FROM Cart";
            Connection con = db.makeConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            ArrayList<Cart> list = new ArrayList<>();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCartID(rs.getInt(1));
                c.setUserName(rs.getString(2));
                c.setCouponID(rs.getString(3));
                c.setPaymentMethodID(rs.getInt(4));
                c.setPaymentDate(rs.getDate(5));
                c.setDeliverDate(rs.getDate(6));
                c.setCartStatus(rs.getInt(7));
                c.setTotalPrice(rs.getFloat(8));
                list.add(c);
            }
            con.close();
            rs.close();
            return list;
        } catch (Exception e) {
            throw e;
        } 
    }
    
    public List<Cart> getCartById(String txtSearch){
        List<Cart> listN = new ArrayList<>();
        String query = "  select * from [dbo].[Cart] where [userName] like ? OR [cartID] like ?";
        try {
            Connection con = db.makeConnection();
            ps = con.prepareStatement(query);
            ps.setString(1,"%"+txtSearch+"%");
            ps.setString(2,"%"+txtSearch+"%");
            rs = ps.executeQuery();
            while(rs.next()){
            Cart c = new Cart();
            c.setCartID(rs.getInt("cartID"));
            c.setUserName(rs.getString("userName"));
            c.setCouponID(rs.getString("couponID"));
            c.setPaymentMethodID(rs.getInt("paymentMethodID"));
            c.setPaymentDate(rs.getDate("paymentDate"));
            c.setDeliverDate(rs.getDate("deliverDate"));
            c.setCartStatus(rs.getInt("cartStatus"));
            c.setTotalPrice(rs.getFloat("totalPrice"));
            listN.add(c); 
            }
        } catch (Exception e) {     
        } 
        return listN;
    }
    
    public ArrayList<Cart> getListCartByNameAsc() {
        ArrayList<Cart> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Cart order by [userName] asc";
            Connection con = db.makeConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCartID(rs.getInt(1));
                c.setUserName(rs.getString(2));
                c.setCouponID(rs.getString(3));
                c.setPaymentMethodID(rs.getInt(4));
                c.setPaymentDate(rs.getDate(5));
                c.setDeliverDate(rs.getDate(6));
                c.setCartStatus(rs.getInt(7));
                c.setTotalPrice(rs.getFloat(8));
                list.add(c);
            }
            con.close();
            rs.close();
            
        } catch (Exception e) {
            
        } 
        return list;
    }
    
    public ArrayList<Cart> getListCartByNameDesc() {
        ArrayList<Cart> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Cart order by [userName] desc";
            Connection con = db.makeConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCartID(rs.getInt(1));
                c.setUserName(rs.getString(2));
                c.setCouponID(rs.getString(3));
                c.setPaymentMethodID(rs.getInt(4));
                c.setPaymentDate(rs.getDate(5));
                c.setDeliverDate(rs.getDate(6));
                c.setCartStatus(rs.getInt(7));
                c.setTotalPrice(rs.getFloat(8));
                list.add(c);
            }
            con.close();
            rs.close();
            
        } catch (Exception e) {
            
        } 
        return list;
    }
    
    public ArrayList<Cart> getListCartByDayNewest() {
        ArrayList<Cart> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Cart order by [paymentDate] desc";
            Connection con = db.makeConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCartID(rs.getInt(1));
                c.setUserName(rs.getString(2));
                c.setCouponID(rs.getString(3));
                c.setPaymentMethodID(rs.getInt(4));
                c.setPaymentDate(rs.getDate(5));
                c.setDeliverDate(rs.getDate(6));
                c.setCartStatus(rs.getInt(7));
                c.setTotalPrice(rs.getFloat(8));
                list.add(c);
            }
            con.close();
            rs.close();
            
        } catch (Exception e) {
            
        } 
        return list;
    }
    
    public ArrayList<Cart> getListCartByDayOldest() {
        ArrayList<Cart> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Cart order by [paymentDate] asc";
            Connection con = db.makeConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCartID(rs.getInt(1));
                c.setUserName(rs.getString(2));
                c.setCouponID(rs.getString(3));
                c.setPaymentMethodID(rs.getInt(4));
                c.setPaymentDate(rs.getDate(5));
                c.setDeliverDate(rs.getDate(6));
                c.setCartStatus(rs.getInt(7));
                c.setTotalPrice(rs.getFloat(8));
                list.add(c);
            }
            con.close();
            rs.close();
            
        } catch (Exception e) {
            
        } 
        return list;
    }
    
    public ArrayList<Cart> getListCartByHighToLowPrice() {
        ArrayList<Cart> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Cart order by [totalPrice] desc";
            Connection con = db.makeConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCartID(rs.getInt(1));
                c.setUserName(rs.getString(2));
                c.setCouponID(rs.getString(3));
                c.setPaymentMethodID(rs.getInt(4));
                c.setPaymentDate(rs.getDate(5));
                c.setDeliverDate(rs.getDate(6));
                c.setCartStatus(rs.getInt(7));
                c.setTotalPrice(rs.getFloat(8));
                list.add(c);
            }
            con.close();
            rs.close();
            
        } catch (Exception e) {
            
        } 
        return list;
    }
    
    public ArrayList<Cart> getListCartByLowToHighPrice() {
        ArrayList<Cart> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Cart order by [totalPrice] asc";
            Connection con = db.makeConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setCartID(rs.getInt(1));
                c.setUserName(rs.getString(2));
                c.setCouponID(rs.getString(3));
                c.setPaymentMethodID(rs.getInt(4));
                c.setPaymentDate(rs.getDate(5));
                c.setDeliverDate(rs.getDate(6));
                c.setCartStatus(rs.getInt(7));
                c.setTotalPrice(rs.getFloat(8));
                list.add(c);
            }
            con.close();
            rs.close();
            
        } catch (Exception e) {
            
        } 
        return list;
    }
    
    public int countNewOrders(int dayMax) {
        List<Cart> listCart = new ArrayList<>();
        String sql = "select *\n"
                + "from Cart\n"
                + "where DATEDIFF(day, paymentDate, GETDATE()) < ?";

        con = DBConnection.makeConnection();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, dayMax);
            rs = ps.executeQuery();
            while (rs.next()) {
                listCart.add(new Cart(rs.getInt("cartID"),
                        rs.getString("userName"),
                        rs.getString("couponID"),
                        rs.getInt("paymentMethodID"),
                        rs.getDate("paymentDate"),
                        rs.getDate("deliverDate"),
                        rs.getInt("cartStatus"),
                        rs.getFloat("totalPrice")));
            }
            return listCart.isEmpty() ? 0 : listCart.size();
        } catch (SQLException ex) {
            Logger.getLogger(Dashboard_CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    
    public List<Cart> getNext10Cart(int amount) {
        List<Cart> listCart = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Cart] ORDER BY [cartID] OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        con = DBConnection.makeConnection();
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                listCart.add(new Cart(rs.getInt("cartID"),
                        rs.getString("userName"),
                        rs.getString("couponID"),
                        rs.getInt("paymentMethodID"),
                        rs.getDate("paymentDate"),
                        rs.getDate("deliverDate"),
                        rs.getInt("cartStatus"),
                        rs.getFloat("totalPrice")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Dashboard_CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCart;
    }
    
    public List<Cart> getListTop10Cart() {
        List<Cart> listCart = new ArrayList<>();
        String sql = "SELECT TOP 10 * FROM [dbo].[Cart]";
        con = DBConnection.makeConnection();
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listCart.add(new Cart(rs.getInt("cartID"),
                        rs.getString("userName"),
                        rs.getString("couponID"),
                        rs.getInt("paymentMethodID"),
                        rs.getDate("paymentDate"),
                        rs.getDate("deliverDate"),
                        rs.getInt("cartStatus"),
                        rs.getFloat("totalPrice")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Dashboard_CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCart;
    }
}
