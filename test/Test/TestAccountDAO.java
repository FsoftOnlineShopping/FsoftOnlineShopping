package Test;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Controller.Authen_Author.ResetPasswordEmailAPI;
import DAO.Account.AccountDAO;
import DAO.Cart.Dashboard_CartDAO;

import GenericDAO.GenericDAO;
import Mail.resetPasswordEmail;
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
//            System.out.println(AccountDAO.getAllAccount());
//            for(int i = 0; i < AccountDAO.getAllAccount().size(); i++){
//                System.out.println(AccountDAO.getAllAccount().get(i));
//            }
//         System.out.println(AccountDAO.updateUserInfo("quang2","email", null,"adress ne","avatar de","fb acc"));
//        System.out.println(AccountDAO.hashPassword("admin"));
//        System.out.println(AccountDAO.isHaveUserName("quang7"));
//        System.out.println(AccountDAO.updateUserInfo("103523771469159071556", "quanglnnde150066@fpt.edu.vn", "103523771469159071556", "103523771469159071556", "103523771469159071556", ""));
            System.out.println(Dashboard_CartDAO.getLatestOrders());
    }
}
