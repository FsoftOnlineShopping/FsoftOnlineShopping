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
public class Product {
    private int productID;
    private int categoryID;
    private String productName;
    private double productPrice;
    private int productNumber;
    private String productDescription;
    private String imageFolder;

    public Product() {
    }

    public Product(int productID, int categoryID, String productName, double productPrice, int productNumber, String productDescription, String imageFolder) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productNumber = productNumber;
        this.productDescription = productDescription;
        this.imageFolder = imageFolder;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(int productNumber) {
        this.productNumber = productNumber;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getImageFolder() {
        return imageFolder;
    }

    public void setImageFolder(String imageFolder) {
        this.imageFolder = imageFolder;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", categoryID=" + categoryID + ", productName=" + productName + ", productPrice=" + productPrice + ", productNumber=" + productNumber + ", productDescription=" + productDescription + ", imageFolder=" + imageFolder + '}';
    }
    
}
    