/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import java.util.List;
import javax.xml.stream.events.Comment;
import entity.Block;
import java.sql.Connection;
import java.sql.PreparedStatement;
import entity.Brand;
import entity.Categories;
import entity.Product;
import entity.Product_Image;
import entity.Review;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Vector;
import entity.Review;
import java.time.LocalTime;
/**
 *
 * @author admin
 */
public class DAOComment {

    Connection conn;
    List<Review> cmt;

    public DAOComment() {
        conn = new DBContext().connection;
    }

    public List<Review> getCmt() {
        return cmt;
    }

    public void setCmt(List<Review> cmt) {
        this.cmt = cmt;
    }

  

    public static void main(String[] args) {
        DAOComment dao = new DAOComment();
        LocalTime time = LocalTime.now();
        String date = time.toString();
        System.out.println(date);
    }

    public void createCommentPro(int proid, String content, double rate, int cusid) {
        LocalDate time = LocalDate.now();
        String date = time.toString();
        LocalTime time2 = LocalTime.now();
        String date2 = time2.toString();
        int dotIndex = date2.indexOf(".");
        if (dotIndex != -1 && dotIndex + 2 <= date2.length()) {
            // Cắt chuỗi để lấy một ký tự sau dấu chấm
            date2 = date2.substring(0, dotIndex + 2);
        }
        String sql = "INSERT INTO [ProductComment]\n"
                + "           ([ProId]\n"
                + "           ,[CommentText]\n"
                + "           ,[Rating]\n"
                + "           ,[CreatedBy]\n"
                + "           ,[CreatedOn])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, proid);
            ps.setString(2, content);
            ps.setDouble(3, rate);
            ps.setInt(4, cusid);
            ps.setString(5, date+" " +date2);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void getReviewPro(int proid) {
        cmt = new Vector<>();
        String sql = "SELECT c.CommentId,c.ProId,c.CommentText,c.Rating, c.CreatedBy,c.CreatedOn,a.avatar,a.full_name\n"
                + "FROM ProductComment c\n"
                + "JOIN Account a ON c.CreatedBy = a.id\n"
                + "where c.ProId = ?\n"
                + "order by c.CommentId desc";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, proid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int commentId = rs.getInt(1);
                int proId = rs.getInt(2);
                String commentText = rs.getString(3);
                double rating = rs.getDouble(4);
                int createdBy = rs.getInt(5);
                String createdOn = rs.getString(6);
                String userava = rs.getString(7);
                String fullname = rs.getString(8);
                cmt.add(new Review(commentId, proId, commentText, rating, createdBy, createdOn, userava, fullname));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }
}
