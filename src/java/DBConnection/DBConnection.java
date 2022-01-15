/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author truon
 */
public class DBConnection {
    public static Connection makeConnection(){
        String connectionUrl = "jdbc:sqlserver://localhost:1433;"
                +"databaseName=FsoftOnlineShopping;User=sa;Password=admin";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con = null;
        try {
            con = DriverManager.getConnection(connectionUrl);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
//    Run main function to make sure you're connected with DB
    public static void main(String[] args) {
        System.out.println(DBConnection.makeConnection());
    }
}
