/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Account;

import GenericDAO.GenericDAO;
import Mapper.AccountMapper;
import Model.Account;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends GenericDAO {

    public static List<Account> getAllAccount() throws SQLException {
        String sql = "Select * from Account";
        List<Account> listAllAccount = query(sql, new AccountMapper());
        return listAllAccount.isEmpty() ? null : listAllAccount;
    }

    public static Account getAccountByUserName(String userName) throws SQLException {
        String sql = "select * from Account where userName = ? and accountState != 0";
        List<Account> listAccount = query(sql, new AccountMapper(), userName);
        return listAccount.isEmpty() ? null : (Account) listAccount.get(0);
    }

    public static Account checkLogin(String userName, String password) throws SQLException {
        Account currentAccount = getAccountByUserName(userName);
        if (currentAccount != null) {
            boolean isPasswordChecked = BCrypt.checkpw(password, currentAccount.getUserPassword());
            if (isPasswordChecked) {
                return currentAccount;
            }
        }
        return null;
    }

    //UserRole 1: Admin, 0:User
    //AccountState 1: Active, 0: Deleted    
    public static int createAccount(String userName, String password, String userEmail) throws SQLException {
        StringBuilder sql = new StringBuilder("insert into Account (userName, userPassword, userEmail, userFullName, userCreateDate, userRole, accountState) values ");
        sql.append("(?,?,?,?,?,?,?)");
        String passwordHash = hashPassword(password);
        int idInsert = insert(sql.toString(), userName, passwordHash, userEmail, userName, new Timestamp(System.currentTimeMillis()), 0, 1);
        return idInsert;
//      return true: 0, false: -1
    }

    public static boolean updatePassword(String userName, String newPassword) throws SQLException {
        String sql = "update Account set userPassword = ? where userName = ?";
        boolean update = update(sql, newPassword, userName);
        return update;
    }

    public static boolean updateUserInfo(String userName, String userEmail, String userFullname, String userAddress, String userAvatar, String userFacebook) throws SQLException {
        StringBuilder sql = new StringBuilder("update Account set userEmail = ?, ");
        sql.append("userFullname = ?, userAddress = ?, userAvatar = ?, userFacebook = ? ");
        sql.append("where userName = ?");
        boolean update = update(sql.toString(), userEmail, userFullname, userAddress, userAvatar, userFacebook, userName);
        return update;
    }

    public static String hashPassword(String password) {
        String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt(12));
        return passwordHash;
    }

}
