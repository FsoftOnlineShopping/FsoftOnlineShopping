/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author ハン
 */
public class Cart {
    private int cartID;
    private String userName;
    private String couponID;
    private int paymentMethodID;
    private Date paymentDate;
    private Date deliverDate;
    private int cartStatus;
    private float totalPrice;

    public Cart() {
    }

    public Cart(int cartID, String userName, String couponID, int paymentMethodID, Date paymentDate, Date deliverDate, int cartStatus, float totalPrice) {
        this.cartID = cartID;
        this.userName = userName;
        this.couponID = couponID;
        this.paymentMethodID = paymentMethodID;
        this.paymentDate = paymentDate;
        this.deliverDate = deliverDate;
        this.cartStatus = cartStatus;
        this.totalPrice = totalPrice;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCouponID() {
        return couponID;
    }

    public void setCouponID(String couponID) {
        this.couponID = couponID;
    }

    public int getPaymentMethodID() {
        return paymentMethodID;
    }

    public void setPaymentMethodID(int paymentMethodID) {
        this.paymentMethodID = paymentMethodID;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public Date getDeliverDate() {
        return deliverDate;
    }

    public void setDeliverDate(Date deliverDate) {
        this.deliverDate = deliverDate;
    }

    public int getCartStatus() {
        return cartStatus;
    }

    public void setCartStatus(int cartStatus) {
        this.cartStatus = cartStatus;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    
}
