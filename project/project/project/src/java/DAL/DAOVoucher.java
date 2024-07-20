/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import entity.Voucher;
import java.sql.Connection;
import java.util.List;
import java.util.Vector;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

/**
 *
 * @author admin
 */
public class DAOVoucher {

    Connection conn;
    List<Voucher> vou;

    public DAOVoucher() {
        conn = new DBContext().connection;
    }

    public List<Voucher> getVou() {
        return vou;
    }

    public void setVou(List<Voucher> vou) {
        this.vou = vou;
    }

    public void getAllVoucherShop() {
        String sql = "SELECT  [DiscountID],[DiscountRate],[Amount],[StartDate],[EndDate],[Status] FROM [Discount] where [Status] = 1";
        vou = new Vector<Voucher>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String DiscountID = rs.getString(1);
                double DiscountRate = rs.getDouble(2);
                int Amount = rs.getInt(3);
                String StartDate = rs.getString(4);
                String EndDate = rs.getString(5);
                int Status = rs.getInt(6);
                vou.add(new Voucher(DiscountID, DiscountRate, Amount, StartDate, EndDate, Status));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getAllVoucher() {
        String sql = "SELECT  [DiscountID],[DiscountRate],[Amount],[StartDate],[EndDate],[Status] FROM [Discount] ";
        vou = new Vector<Voucher>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String DiscountID = rs.getString(1);
                double DiscountRate = rs.getDouble(2);
                int Amount = rs.getInt(3);
                String StartDate = rs.getString(4);
                String EndDate = rs.getString(5);
                int Status = rs.getInt(6);
                vou.add(new Voucher(DiscountID, DiscountRate, Amount, StartDate, EndDate, Status));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void searchVoucher(String txt) {
        String sql = "SELECT  [DiscountID],[DiscountRate],[Amount],[StartDate],[EndDate],[Status] FROM [Discount] \n"
                + "where [DiscountID] like ? or [DiscountRate] like ?";
        vou = new Vector<Voucher>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            String searchTxt = "%" + txt + "%";
            ps.setString(1, searchTxt);
            ps.setString(2, searchTxt);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String DiscountID = rs.getString(1);
                double DiscountRate = rs.getDouble(2);
                int Amount = rs.getInt(3);
                String StartDate = rs.getString(4);
                String EndDate = rs.getString(5);
                int Status = rs.getInt(6);
                vou.add(new Voucher(DiscountID, DiscountRate, Amount, StartDate, EndDate, Status));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getAllVoucherPagging(List<Voucher> newsList, int start, int end) {
        vou = new Vector<Voucher>();
        for (int i = start; i < end; i++) {
            vou.add(newsList.get(i));
        }
    }

    public Voucher getVoucherbyId(String vouid) {
        String sql = "SELECT  [DiscountID]\n"
                + "      ,[DiscountRate]\n"
                + "      ,[Amount]\n"
                + "      ,[StartDate]\n"
                + "      ,[EndDate]\n"
                + "      ,[Status]\n"
                + "  FROM [Discount]\n"
                + "  where DiscountID = ?";
        Voucher vour = new Voucher();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, vouid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String DiscountID = rs.getString(1);
                double DiscountRate = rs.getDouble(2);
                int Amount = rs.getInt(3);
                String StartDate = rs.getString(4);
                String EndDate = rs.getString(5);
                int Status = rs.getInt(6);
                vour = new Voucher(DiscountID, DiscountRate, Amount, StartDate, EndDate, Status);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
        return vour;
    }

    public void useVoucher(String voucherID) {
        String sql = "UPDATE [dbo].[Discount]\n"
                + "   SET [Amount] = [Amount] - 1\n"
                + " WHERE [DiscountID] =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, voucherID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateVoucher(String voucherID, String startdate, String enddate, double rate, int amount,String oldid) {
        String sql = "UPDATE [Discount]\n"
                + "   SET [DiscountID] = ?\n"
                + "      ,[DiscountRate] =?\n"
                + "      ,[Amount] = ?\n"
                + "      ,[StartDate] = ?\n"
                + "      ,[EndDate] = ?\n"
                + " WHERE [DiscountID] = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, voucherID);
            ps.setDouble(2, rate);
            ps.setInt(3, amount);
            ps.setString(4, startdate);
            ps.setString(5, enddate);
            ps.setString(6, oldid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void blockVoucher(String voucherID) {
        String sql = "UPDATE [dbo].[Discount]\n"
                + "      SET [Status] = 0\n"
                + " WHERE [DiscountID] =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, voucherID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void activeVoucher(String voucherID) {
        String sql = "UPDATE [dbo].[Discount]\n"
                + "      SET [Status] = 1\n"
                + " WHERE [DiscountID] =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, voucherID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertVoucher(String voucherID, String startdate, String enddate, double rate, int amount) {
        String sql = "INSERT INTO [Discount]\n"
                + "           ([DiscountID]\n"
                + "           ,[DiscountRate]\n"
                + "           ,[Amount]\n"
                + "           ,[StartDate]\n"
                + "           ,[EndDate]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (? ,? ,?,?,?,1)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, voucherID);
            ps.setDouble(2, rate);
            ps.setInt(3, amount);
            ps.setString(4, startdate);
            ps.setString(5, enddate);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteVoucher(String voucherID) {
        String sql = "DELETE FROM [Discount]\n"
                + "      WHERE DiscountID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, voucherID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        DAOVoucher dao = new DAOVoucher();
        dao.insertVoucher("12345678", "2024-07-13 08:15:00.000", "2024-07-13 08:15:00.000", 0.12, 12);
    }
}
