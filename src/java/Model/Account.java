/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class Account {
    private String userName;
    private String userPassword;
    private String userEmail;
    private String userFullname;
    private String userAddress;
    private Timestamp  userCreateDate;
    private String userAvatar;
    private String userFacebook;
    private int userRole;
    private int accountState;

    public Account() {
    }

    public Account(String userName, String userPassword, String userEmail, String userFullname, String userAddress, Timestamp userCreateDate, String userAvatar, String userFacebook, int userRole, int accountState) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userEmail = userEmail;
        this.userFullname = userFullname;
        this.userAddress = userAddress;
        this.userCreateDate = userCreateDate;
        this.userAvatar = userAvatar;
        this.userFacebook = userFacebook;
        this.userRole = userRole;
        this.accountState = accountState;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserFullname() {
        return userFullname;
    }

    public void setUserFullname(String userFullname) {
        this.userFullname = userFullname;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public Timestamp getUserCreateDate() {
        return userCreateDate;
    }

    public void setUserCreateDate(Timestamp userCreateDate) {
        this.userCreateDate = userCreateDate;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }

    public String getUserFacebook() {
        return userFacebook;
    }

    public void setUserFacebook(String userFacebook) {
        this.userFacebook = userFacebook;
    }

    public int getUserRole() {
        return userRole;
    }

    public void setUserRole(int userRole) {
        this.userRole = userRole;
    }

    public int getAccountState() {
        return accountState;
    }

    public void setAccountState(int accountState) {
        this.accountState = accountState;
    }

    @Override
    public String toString() {
        return "Account{" + "userName=" + userName + ", userPassword=" + userPassword + ", userEmail=" + userEmail + ", userFullname=" + userFullname + ", userAddress=" + userAddress + ", userCreateDate=" + userCreateDate + ", userAvatar=" + userAvatar + ", userFacebook=" + userFacebook + ", userRole=" + userRole + ", accountState=" + accountState + '}';
    }
    
    
}
