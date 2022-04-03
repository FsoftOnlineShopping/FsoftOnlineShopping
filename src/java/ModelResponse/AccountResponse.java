/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelResponse;

import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class AccountResponse {
    private String userEmail;
    private String userFullname;
    private String userAddress;
    private String userAvatar;
    private String userFacebook;
    private int userRole;
    private int accountState;

    public AccountResponse() {
    }

    public AccountResponse(String userEmail, String userFullname, String userAddress, String userAvatar, String userFacebook, int userRole, int accountState) {
        this.userEmail = userEmail;
        this.userFullname = userFullname;
        this.userAddress = userAddress;
        this.userAvatar = userAvatar;
        this.userFacebook = userFacebook;
        this.userRole = userRole;
        this.accountState = accountState;
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
        return "AccountResponse{" + "userEmail=" + userEmail + ", userFullname=" + userFullname + ", userAddress=" + userAddress + ", userAvatar=" + userAvatar + ", userFacebook=" + userFacebook + ", userRole=" + userRole + ", accountState=" + accountState + '}';
    }
    
    
}
