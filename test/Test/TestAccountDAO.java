package Test;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import DAO.Account.AccountDAO;
import GenericDAO.GenericDAO;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class TestAccountDAO {

    public static void main(String[] args) throws SQLException {
//        System.out.println(AccountDAO.createAccount("quang5", "quang1", "abc"));
//        System.out.println(AccountDAO.checkLogin("quang5","quang1"));
//        System.out.println(AccountDAO.updatePassword("quang3","quang22"));
//         System.out.println(AccountDAO.updateUserInfo("quang3","email", "aname","adress ne","avatar de","fb acc"));
//        System.out.println(AccountDAO.hashPassword("admin"));
        System.out.println(AccountDAO.isHaveUserName("quang7"));

    }
}
