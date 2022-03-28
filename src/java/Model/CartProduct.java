/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ハン
 */
public class CartProduct {
    public int cartID;
    public int productID;
    public int quantity;

    public CartProduct() {
    }

    public CartProduct(int productID, int quantity) {
        this.productID = productID;
        this.quantity = quantity;
    }
    
    public CartProduct(int cartID, int productID, int quantity) {
        this.cartID = cartID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public void incrementQuantity() {
        this.quantity++;
    }
}
