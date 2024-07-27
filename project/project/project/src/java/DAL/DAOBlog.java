/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import entity.Blog;
import java.sql.Connection;
import java.util.List;
import java.util.Vector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class DAOBlog {

    private Connection conn;
    private List<Blog> blg;

    public DAOBlog() {
        conn = new DBContext().connection;
    }

    public List<Blog> getBlg() {
        return blg;
    }

    public void setBlg(List<Blog> blg) {
        this.blg = blg;
    }

    public void getAllBlog() {
        String sql = "select b.*, a.full_name from Blog b join Account a on b.createBy  = a.id";
        blg = new Vector<Blog>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String description = rs.getString(3);
                String createOn = rs.getString(4);
                String content = rs.getString(5);
                int createBy = rs.getInt(6);
                String img = rs.getString(7);
                String acc_name = rs.getString(8); // Thay đổi chỉ số index

                blg.add(new Blog(id, title, description, createOn, content, createBy, img, acc_name));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ

        }
    }

    public void searchBlog(String txt) {
        String sql = "select b.*, a.full_name from Blog b join Account a on b.createBy  = a.id\n"
                + "where b.title like ? or b.description like ? or a.full_name like ?";
        blg = new Vector<Blog>();
        try {
            String searchTxt = "%" + txt + "%";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, searchTxt);
            ps.setString(2, searchTxt);
            ps.setString(3, searchTxt);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String description = rs.getString(3);
                String createOn = rs.getString(4);
                String content = rs.getString(5);
                int createBy = rs.getInt(6);
                String img = rs.getString(7);
                String acc_name = rs.getString(8); // Thay đổi chỉ số index

                blg.add(new Blog(id, title, description, createOn, content, createBy, img, acc_name));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ

        }
    }

    public void getRecomendBlog(int blid) {
        String sql = "select top 6 b.*, a.full_name from Blog b join Account a on b.createBy  = a.id where b.id != ? ";
        blg = new Vector<Blog>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, blid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String description = rs.getString(3);
                String createOn = rs.getString(4);
                String content = rs.getString(5);
                int createBy = rs.getInt(6);
                String img = rs.getString(7);
                String acc_name = rs.getString(8); // Thay đổi chỉ số index

                blg.add(new Blog(id, title, description, createOn, content, createBy, img, acc_name));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ

        }
    }

    public Blog getBlogbyId(int blgid) {
        Blog blog = new Blog();

        String sql = "select b.*, a.full_name from Blog b join Account a on b.createBy  = a.id\n"
                + "where b.id = ?"; // Sử dụng tham số để tránh lỗ hổng SQL Injection
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, blgid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String description = rs.getString(3);
                String createOn = rs.getString(4);
                String content = rs.getString(5);
                int createBy = rs.getInt(6);
                String img = rs.getString(7);
                String acc_name = rs.getString(8); // Thay đổi chỉ số index
                blog = new Blog(id, title, description, createOn, content, createBy, img, acc_name);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
        return blog;
    }

    public void deleteBlog(int id) {
        String sql = "DELETE FROM [Blog]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insertBlog(String title, String desc, String createOn, String content, int createBy, String img) {
        String sql = "INSERT INTO [Blog]\n"
                + "           ([title]\n"
                + "           ,[description]\n"
                + "           ,[createOn]\n"
                + "           ,[content]\n"
                + "           ,[createBy]\n"
                + "           ,[img])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, desc);
            ps.setString(3, createOn);
            ps.setString(4, content);
            ps.setString(6, img);
            ps.setInt(5, createBy);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateBlog(String title, String desc, String createOn, String content, int createBy, String img, int blgid) {
        String sql = "UPDATE [dbo].[Blog]\n"
                + "   SET [title] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[createOn] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[createBy] = ?\n"
                + "      ,[img] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, desc);
            ps.setString(3, createOn);
            ps.setString(4, content);
            ps.setInt(5, createBy);
            ps.setString(6, img);
            ps.setInt(7, blgid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void getAllBlogPagging(List<Blog> newsList, int start, int end) {
        blg = new Vector<Blog>();
        for (int i = start; i < end; i++) {
            blg.add(newsList.get(i));
        }
    }

    public static void main(String[] args) {
        DAOBlog dao = new DAOBlog();
        Blog bl = dao.getBlogbyId(1);
        System.out.println(bl.getAcc_name());
    }

}
