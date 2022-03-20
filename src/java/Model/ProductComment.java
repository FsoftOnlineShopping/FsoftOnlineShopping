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
public class ProductComment {
    private int productID;
    private String userName;
    private String commentContent;
    private int rating;

    public ProductComment() {
    }

    public ProductComment(int productID, String userName, String commentContent, int rating) {
        this.productID = productID;
        this.userName = userName;
        this.commentContent = commentContent;
        this.rating = rating;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    
    
}
