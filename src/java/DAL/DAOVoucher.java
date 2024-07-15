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

    public void getAllVoucher() {
        String sql = "SELECT  [DiscountID],[DiscountRate],[Amount],[StartDate],[EndDate],[Status] FROM [Discount]";
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
        Voucher vo = dao.getVoucherbyId("DISC001");
        System.out.println(vo.getStartDate());
    }
}
