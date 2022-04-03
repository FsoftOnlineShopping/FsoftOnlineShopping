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
public class ProductColor {
    private int productID;
    private int colorID;

    public ProductColor() {
    }

    public ProductColor(int productID, int colorID) {
        this.productID = productID;
        this.colorID = colorID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getColorID() {
        return colorID;
    }

    public void setColorID(int colorID) {
        this.colorID = colorID;
    }

    @Override
    public String toString() {
        return "ProductColor{" + "productID=" + productID + ", colorID=" + colorID + '}';
    }
  
}
