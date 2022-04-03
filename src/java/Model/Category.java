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
public class Category {
    private int categoryID;
    private String categoryIcon;
    private String categoryName;

    public Category(){
        
    }
    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryIcon() {
        return categoryIcon;
    }

    public void setCategoryIcon(String categoryIcon) {
        this.categoryIcon = categoryIcon;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Category(int categoryID, String categoryIcon, String categoryName) {
        this.categoryID = categoryID;
        this.categoryIcon = categoryIcon;
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryID=" + categoryID + ", categoryIcon=" + categoryIcon + ", categoryName=" + categoryName + '}';
    }
}
