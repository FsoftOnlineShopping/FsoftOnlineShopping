/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Cart;

import DBConnection.DBConnection;
import Model.Cart;
import ModelResponse.AccountDashboard;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class Dashboard_CartDAO {

    private static Connection con = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;

    public static int countNewOrders(int dayMax) {
        List<Cart> listCart = new ArrayList<>();
        String sql = "select *\n"
                + "from Cart\n"
                + "where DATEDIFF(day, paymentDate, GETDATE()) < ?";

        con = DBConnection.makeConnection();
        try {
            stm = con.prepareStatement(sql);
            stm.setInt(1, dayMax);
            rs = stm.executeQuery();
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

    public static float countTotalIncome() {
        String sql = "select sum(totalPrice) as 'Total Income'\n"
                + "from Cart\n"
                + "where cartStatus = 1";

        con = DBConnection.makeConnection();
        try {
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getFloat("Total Income");
            }
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(Dashboard_CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static ArrayList<AccountDashboard> getTopOrders() {
        List<AccountDashboard> listAccount = new ArrayList<>();
        String sql = "select top 5 b.userFullname, count(*) as 'Total Orders', sum(totalPrice) as 'Total Spending'\n"
                + "	from Cart a\n"
                + "	INNER JOIN Account b\n"
                + "	on a.userName = b.userName\n"
                + "	where cartStatus = 1\n"
                + "	group by b.userFullname\n"
                + "	order by [Total Spending] desc";

        con = DBConnection.makeConnection();
        try {
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                listAccount.add(new AccountDashboard(rs.getString("userFullname"),
                        rs.getInt("Total Orders"),
                        rs.getFloat("Total Spending")));
            }
            return (ArrayList<AccountDashboard>) listAccount;
        } catch (SQLException ex) {
            Logger.getLogger(Dashboard_CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ArrayList<Cart> getLatestOrders() {
        List<Cart> listCart = new ArrayList<>();
        String sql = "select top 5 a.cartID, b.userFullname, a.couponID, a.paymentMethodID, a.paymentDate, a.deliverDate, a.cartStatus, a.totalPrice\n"
                + "from Cart a, Account b\n"
                + "where a.userName = b.userName\n"
                + "order by cartID desc";

        con = DBConnection.makeConnection();
        try {
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                listCart.add(new Cart(rs.getInt("cartID"),
                        rs.getString("userFullname"),
                        rs.getString("couponID"),
                        rs.getInt("paymentMethodID"),
                        rs.getDate("paymentDate"),
                        rs.getDate("deliverDate"),
                        rs.getInt("cartStatus"),
                        rs.getFloat("totalPrice")));
            }
            return (ArrayList<Cart>) listCart;
        } catch (SQLException ex) {
            Logger.getLogger(Dashboard_CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static float countIncomeThisMonth(int start, int end) {
        String sql = "select sum(totalPrice) as 'This Month Day " + start + " to " + end + "'\n"
                + "from Cart\n"
                + "where cartStatus = 1 and (Day(paymentDate) >= " + start + " and Day(paymentDate) <= " + end + ") and Month(paymentDate) = Month(getDate())  and Year(paymentDate) = Year(getDate())\n"
                + "";

        con = DBConnection.makeConnection();
//        System.out.println(sql);
        try {
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getFloat("This Month Day " + start + " to " + end + "");
            }
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(Dashboard_CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static float countIncomeLastMonth(int start, int end) {
        String sql = "select sum(totalPrice) as 'This Month Day " + start + " to " + end + "'\n"
                + "from Cart\n"
                + "where cartStatus = 1 and (Day(paymentDate) >= " + start + " and Day(paymentDate) <= " + end + ") and Month(paymentDate) = Month(getDate()) - 1  and Year(paymentDate) = Year(getDate())\n"
                + "";

        con = DBConnection.makeConnection();
        System.out.println(sql);
        try {
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getFloat("This Month Day " + start + " to " + end + "");
            }
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(Dashboard_CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static void main(String[] args) {
//        System.out.println(getTopOrders());
//        System.out.println(getLatestOrders());
        for (int i = 1; i <= 30; i += 3) {
            System.out.println(countIncomeThisMonth(i, i + 2) + "   " + countIncomeLastMonth(i, i + 2));
        }
    }
}
