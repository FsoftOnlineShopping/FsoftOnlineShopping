/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Admin
 */
public class Size {
    private int productID;
    private String sizeID;

    public Size(int productID, String sizeID) {
        this.productID = productID;
        this.sizeID = sizeID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getSizeID() {
        return sizeID;
    }

    public void setSizeID(String sizeID) {
        this.sizeID = sizeID;
    }

    @Override
    public String toString() {
        return "Size{" + "productID=" + productID + ", sizeID=" + sizeID + '}';
    }
    
}
