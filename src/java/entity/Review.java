/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author admin
 */
public class Review {
    private int commentId;
      private int proId;
      private  String commentText;
      private double rating;
      private int createdBy;
      private String  createdOn;
      private String userava;
      private String fullname;
      
    public Review() {
    }

    public Review(int commentId, int proId, String commentText, double rating, int createdBy, String createdOn, String userava, String fullname) {
        this.commentId = commentId;
        this.proId = proId;
        this.commentText = commentText;
        this.rating = rating;
        this.createdBy = createdBy;
        this.createdOn = createdOn;
        this.userava = userava;
        this.fullname = fullname;
    }

    

    

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getProId() {
        return proId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public String getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(String createdOn) {
        this.createdOn = createdOn;
    }

    public String getUserava() {
        return userava;
    }

    public void setUserava(String userava) {
        this.userava = userava;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
      
      
}
