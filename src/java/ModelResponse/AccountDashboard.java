/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelResponse;

/**
 *
 * @author ADMIN
 */
public class AccountDashboard {
    private String userFullname;
    private int totalOrders;
    private float totalSpending;

    public AccountDashboard() {
    }

    public AccountDashboard(String userFullname, int totalOrders, float totalSpending) {
        this.userFullname = userFullname;
        this.totalOrders = totalOrders;
        this.totalSpending = totalSpending;
    }

    public String getUserFullname() {
        return userFullname;
    }

    public void setUserFullname(String userFullname) {
        this.userFullname = userFullname;
    }

    public int getTotalOrders() {
        return totalOrders;
    }

    public void setTotalOrders(int totalOrders) {
        this.totalOrders = totalOrders;
    }

    public float getTotalSpending() {
        return totalSpending;
    }

    public void setTotalSpending(float totalSpending) {
        this.totalSpending = totalSpending;
    }

    @Override
    public String toString() {
        return "AccountDashboard{" + "userFullname=" + userFullname + ", totalOrders=" + totalOrders + ", totalSpending=" + totalSpending + '}';
    }

  
    
    
}
