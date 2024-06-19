/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import entity.Account;
import entity.Block;
import entity.Role;
import entity.SecurityQuestion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author admin
 */
public class DAOAccount {

    private Connection conn;
    private List<Account> acc;
    private List<SecurityQuestion> sq;
    private List<Block> bl;
    private List<Role> role;

    public List<Role> getRole() {
        return role;
    }

    public void setRole(List<Role> role) {
        this.role = role;
    }

    public List<Block> getBl() {
        return bl;
    }

    public void setBl(List<Block> bl) {
        this.bl = bl;
    }

    public List<Account> getAcc() {
        return acc;
    }

    public List<SecurityQuestion> getSq() {
        return sq;
    }

    public void setSq(List<SecurityQuestion> sq) {
        this.sq = sq;
    }

    public void setAcc(List<Account> acc) {
        this.acc = acc;
    }

    public DAOAccount() {
        conn = new DBContext().connection;
    }

    public Account loginAccount(String userName, String pass) {
        Account a = new Account(); // Khởi tạo giá trị ban đầu là null
        String sql = "SELECT [id]\n"
                + "      ,[acc_name]\n"
                + "      ,[email]\n"
                + "      ,[adress]   \n"
                + "      ,[cus_password]\n"
                + "      ,[full_name]\n"
                + "      ,[phone]\n"
                + "      ,[role_id]\n"
                + "      ,[avatar]\n"
                + "      ,[ques_id]\n"
                + "      ,[answer]\n"
                + "  FROM [Account]\n"
                + "  WHERE [acc_name] = ? \n"
                + "    AND [cus_password] = ?\n"
                + "    AND [id] NOT IN (SELECT [accid] FROM [block])"; // Sử dụng tham số để tránh lỗ hổng SQL Injection
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) { // Sử dụng if thay vì while vì chỉ cần lấy một tài khoản duy nhất
                int id = rs.getInt(1);
                String acc_name = rs.getString(2);
                String email = rs.getString(3);
                String address = rs.getString(4);
                String cus_password = rs.getString(5);
                String full_name = rs.getString(6);
                String phone = rs.getString(7);
                int role_id = rs.getInt(8);
                String avatar = rs.getString(9);
                int ques_id = rs.getInt(10);
                String answer = rs.getString(11);
                a = new Account(id, acc_name, email, address, cus_password, full_name, phone, avatar, answer, role_id, ques_id);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
        return a;
    }

    public Account getAccountbyId(int cusid) {
        Account a = new Account(); // Khởi tạo giá trị ban đầu là null
        String sql = "SELECT [id]\n"
                + "      ,[acc_name]\n"
                + "      ,[email]\n"
                + "      ,[adress]\n" // Sửa tên cột
                + "      ,[cus_password]\n"
                + "      ,[full_name]\n"
                + "      ,[phone]\n"
                + "      ,[role_id]\n"
                + "      ,[avatar]\n"
                + "      ,[ques_id]\n"
                + "      ,[answer]\n"
                + "  FROM [Account]\n"
                + "  WHERE [id] = ?"; // Sử dụng tham số để tránh lỗ hổng SQL Injection
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cusid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) { // Sử dụng if thay vì while vì chỉ cần lấy một tài khoản duy nhất
                int id = rs.getInt(1);
                String acc_name = rs.getString(2);
                String email = rs.getString(3);
                String address = rs.getString(4);
                String cus_password = rs.getString(5);
                String full_name = rs.getString(6);
                String phone = rs.getString(7);
                int role_id = rs.getInt(8);
                String avatar = rs.getString(9);
                int ques_id = rs.getInt(10);
                String answer = rs.getString(11);
                a = new Account(id, acc_name, email, address, cus_password, full_name, phone, avatar, answer, role_id, ques_id);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
        return a;
    }

    public void getAllAccount() {
        String sql = "SELECT * FROM Account";
        acc = new Vector<Account>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String acc_name = rs.getString(2);
                String email = rs.getString(3);
                String address = rs.getString(4);
                String cus_password = rs.getString(5);
                String full_name = rs.getString(6);
                String phone = rs.getString(7);
                int role_id = rs.getInt(8); // Thay đổi chỉ số index
                String avatar = rs.getString(9); // Thay đổi chỉ số index
                int ques_id = rs.getInt(10); // Thay đổi chỉ số index
                String answer = rs.getString(11); // Thay đổi chỉ số index
                acc.add(new Account(id, acc_name, email, address, cus_password, full_name, phone, avatar, answer, role_id, ques_id));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }
    public void gettop4Account() {
        String sql = "SELECT top 4 * FROM Account";
        acc = new Vector<Account>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String acc_name = rs.getString(2);
                String email = rs.getString(3);
                String address = rs.getString(4);
                String cus_password = rs.getString(5);
                String full_name = rs.getString(6);
                String phone = rs.getString(7);
                int role_id = rs.getInt(8); // Thay đổi chỉ số index
                String avatar = rs.getString(9); // Thay đổi chỉ số index
                int ques_id = rs.getInt(10); // Thay đổi chỉ số index
                String answer = rs.getString(11); // Thay đổi chỉ số index
                acc.add(new Account(id, acc_name, email, address, cus_password, full_name, phone, avatar, answer, role_id, ques_id));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void searchAllAccount(String txt) {
        String sql = "SELECT a.[id]\n"
                + "      ,a.[acc_name]\n"
                + "      ,a.[email]\n"
                + "      ,a.[adress]\n"
                + "      ,a.[cus_password]\n"
                + "      ,a.[full_name]\n"
                + "      ,a.[phone]\n"
                + "      ,a.[role_id]\n"
                + "      ,a.[avatar]\n"
                + "      ,a.[ques_id]\n"
                + "      ,a.[answer]\n"
                + "FROM [Account] a\n"
                + "JOIN [Role] r ON a.[role_id] = r.[id]";
        if (txt != null) {
            sql += "WHERE (a.[acc_name] LIKE '%search_term%'\n"
                    + "    OR a.[full_name] LIKE ?\n"
                    + "    OR a.[phone] LIKE ?\n"
                    + "    OR a.[adress] LIKE ?\n"
                    + "    OR a.[email] LIKE ?\n"
                    + "    OR r.[role_name] LIKE ?\n"
                    + "	)";
        }
        acc = new Vector<Account>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            String searchTxt = "%" + txt + "%";
            ps.setString(1, searchTxt);
            ps.setString(2, searchTxt);
            ps.setString(3, searchTxt);
            ps.setString(4, searchTxt);
            ps.setString(5, searchTxt);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String acc_name = rs.getString(2);
                String email = rs.getString(3);
                String address = rs.getString(4);
                String cus_password = rs.getString(5);
                String full_name = rs.getString(6);
                String phone = rs.getString(7);
                int role_id = rs.getInt(8); // Thay đổi chỉ số index
                String avatar = rs.getString(9); // Thay đổi chỉ số index
                int ques_id = rs.getInt(10); // Thay đổi chỉ số index
                String answer = rs.getString(11); // Thay đổi chỉ số index
                acc.add(new Account(id, acc_name, email, address, cus_password, full_name, phone, avatar, answer, role_id, ques_id));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void insertAccount(String acc_name, String email, String pass, int roleid) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([acc_name]\n"
                + "           ,[email]\n"
                + "           ,[adress]\n"
                + "           ,[cus_password]\n"
                + "           ,[full_name]\n"
                + "           ,[role_id])\n"
                + "     VALUES\n"
                + "           (?,?,'',?,'',?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, acc_name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setInt(4, roleid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insertAccountByAdmin(String acc_name, String email, String address, String pass, String full_name, String phone, int roleid, String img, int qsid, String ans) {
        String sql = "INSERT INTO [Account] ([acc_name], [email], [adress], [cus_password], [full_name], [phone], [role_id], [avatar], [ques_id], [answer]) \n"
                + "               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\n";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, acc_name);
            ps.setString(2, email);
            ps.setString(3, address); // Updated field name from "adress" to "address"
            ps.setString(4, pass);
            ps.setString(5, full_name);
            ps.setString(6, phone);
            ps.setInt(7, roleid);
            ps.setString(8, img);
            ps.setInt(9, qsid);
            ps.setString(10, ans);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging purposes
        }
    }

    public void updateAccountByAdmin(String acc_name, String email, String address, String pass, String full_name, String phone, int roleid, String img, int qsid, String ans, int id) {
        String sql = "UPDATE [Account]\n"
                + "   SET [acc_name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[adress] = ?\n"
                + "      ,[cus_password] = ?\n"
                + "      ,[full_name] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[role_id] = ?\n"
                + "      ,[avatar] = ?\n"
                + "      ,[ques_id] = ?\n"
                + "      ,[answer] = ?\n"
                + " WHERE id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, acc_name);
            ps.setString(2, email);
            ps.setString(3, address); // Updated field name from "adress" to "address"
            ps.setString(4, pass);
            ps.setString(5, full_name);
            ps.setString(6, phone);
            ps.setInt(7, roleid);
            ps.setString(8, img);
            ps.setInt(9, qsid);
            ps.setString(10, ans);
            ps.setInt(11, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging purposes
        }
    }

    public void insertAccountbyGoogle(String email) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([acc_name]\n"
                + "           ,[email]\n"
                + "           ,[adress]\n"
                + "           ,[cus_password]\n"
                + "           ,[full_name]\n"
                + "           ,[role_id])\n"
                + "     VALUES\n"
                + "           (?,?,'','1','',1)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void changetAccountInfo(String email, String adress, String fullname, String phone, String ava, int sqid, String ans, int id) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [email] = ?\n"
                + "      ,[adress] = ?\n"
                + "      ,[full_name] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[avatar] = ?\n"
                + "      ,[ques_id] = ?\n"
                + "      ,[answer] = ?\n"
                + " WHERE id = ? ";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, adress);
            ps.setString(3, fullname);
            ps.setString(4, phone);
            ps.setString(5, ava);
            ps.setInt(6, sqid);
            ps.setString(7, ans);
            ps.setInt(8, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void changetAccountPass(String email, String phone, String newpass) {
        String sql = "UPDATE [Account]\n"
                + "SET [cus_password] = ?\n"
                + "WHERE [email] = ? and [phone] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newpass);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void changetAccountPassbyQues(String ans, String oldpass, String newpass, int sq) {
        String sql = "UPDATE [Account]\n"
                + "   SET [cus_password] = ?\n"
                + " WHERE cus_password = ? and answer = ? and ques_id = ? ";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newpass);
            ps.setString(2, oldpass);
            ps.setString(3, ans);
            ps.setInt(4, sq);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        DAOAccount dao = new DAOAccount();
        dao.searchAllAccount("Ha Noi");
        List<Account> bl = dao.getAcc();

        for (Account account : bl) {
            System.out.println(account.getAcc_name());
        }

    }

    public void BlockAccount(int accid) {
        String sql = "INSERT INTO [Block]\n"
                + "           ([proid]\n"
                + "           ,[accid]\n"
                + "           ,[brandid])\n"
                + "     VALUES\n"
                + "           (0,?,0)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void aciveAccount(int accid) {
        String sql = "DELETE FROM [Block]\n"
                + "      WHERE accid = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Account loginAccountbyGoogle(String userName) {
        Account a = null; // Khởi tạo giá trị ban đầu là null
        String sql = "SELECT *\n"
                + "FROM Account\n"
                + "WHERE acc_name = ? \n"
                + "  AND email = ?\n"
                + "  AND id NOT IN (SELECT accid FROM Block)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, userName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) { // Sử dụng if thay vì while vì chỉ cần lấy một tài khoản duy nhất
                int id = rs.getInt(1);
                String acc_name = rs.getString(2);
                String email = rs.getString(3);
                String address = rs.getString(4);
                String cus_password = rs.getString(5);
                String full_name = rs.getString(6);
                String phone = rs.getString(7);
                int role_id = rs.getInt(8); // Sửa chỉ số index
                String avatar = rs.getString(9);
                int ques_id = rs.getInt(10);
                String answer = rs.getString(11);
                a = new Account(id, acc_name, email, address, cus_password, full_name, phone, avatar, answer, role_id, ques_id);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
        return a;
    }

    public Account getAccountformemailandphone(String fgemail, String fgphone) {
        Account a = null; // Khởi tạo giá trị ban đầu là null
        String sql = "SELECT *\n"
                + "FROM Account\n"
                + "WHERE [email] = ? and [phone] = ? \n";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fgemail);
            ps.setString(2, fgphone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) { // Sử dụng if thay vì while vì chỉ cần lấy một tài khoản duy nhất
                int id = rs.getInt(1);
                String acc_name = rs.getString(2);
                String email = rs.getString(3);
                String address = rs.getString(4);
                String cus_password = rs.getString(5);
                String full_name = rs.getString(6);
                String phone = rs.getString(7);
                int role_id = rs.getInt(8); // Sửa chỉ số index
                String avatar = rs.getString(9);
                int ques_id = rs.getInt(10);
                String answer = rs.getString(11);
                a = new Account(id, acc_name, email, address, cus_password, full_name, phone, avatar, answer, role_id, ques_id);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
        return a;
    }

    public void getQuestion() {
        String sql = "SELECT [id]\n"
                + "      ,[ques_name]\n"
                + "  FROM [dbo].[SecurityQuestions]";
        sq = new Vector<SecurityQuestion>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String acc_name = rs.getString(2);

                sq.add(new SecurityQuestion(id, acc_name));
            }
        } catch (SQLException e) {

        }
    }

    public void getBlockAcc() {
        String sql = "SELECT [proid]\n"
                + "      ,[accid]\n"
                + "      ,[brandid]\n"
                + "  FROM [Block]\n"
                + "  WHERE [proid] = 0\n"
                + "    AND [brandid] = 0";
        bl = new Vector<Block>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int proid = rs.getInt(1);
                int accid = rs.getInt(2);
                int brandid = rs.getInt(3);

                bl.add(new Block(proid, accid, brandid));
            }
        } catch (SQLException e) {

        }
    }

    public void getAllRole() {
        String sql = "SELECT  [id]\n"
                + "      ,[role_name]\n"
                + "  FROM [Role]";
        role = new Vector<Role>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int proid = rs.getInt(1);
                String name = rs.getString(2);

                role.add(new Role(proid, name));
            }
        } catch (SQLException e) {

        }
    }

}
