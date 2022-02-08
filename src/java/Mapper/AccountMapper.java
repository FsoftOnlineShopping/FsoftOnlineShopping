/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mapper;

import Model.Account;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class AccountMapper implements IRowMapper{

    @Override
    public Account mapRow(ResultSet rs) {
        try{
            Account account = new Account();
            account.setUserName(rs.getString("userName"));
            account.setUserPassword(rs.getString("userPassword"));
             account.setUserEmail(rs.getString("userEmail"));
            account.setUserFullname(rs.getString("userFullname"));
            account.setUserAddress(rs.getString("userAddress"));
            account.setUserCreateDate(rs.getTimestamp("userCreateDate"));
            account.setUserAvatar(rs.getString("userAvatar"));
            account.setUserFacebook(rs.getString("userFacebook"));
            account.setUserRole(rs.getInt("userRole"));
            account.setAccountState(rs.getInt("accountState"));
            return account;
        }catch(SQLException e){
            return null;
        }
    }
    
}
