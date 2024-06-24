/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import entity.Account;
import entity.Brand;
import entity.Cart;
import entity.Items;
import entity.Order;
import entity.OrderDetail;
import entity.OrderStatus;
import entity.PaymentMethod;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author admin
 */
public class DAOOrder {

    List<Order> ord;
    List<OrderDetail> detail;
    List<PaymentMethod> pay;
    List<OrderStatus> sta;
    Connection conn;

    public DAOOrder() {
        conn = new DBContext().connection;
    }

    public List<OrderStatus> getSta() {
        return sta;
    }

    public void setSta(List<OrderStatus> sta) {
        this.sta = sta;
    }

    public List<PaymentMethod> getPay() {
        return pay;
    }

    public void setPay(List<PaymentMethod> pay) {
        this.pay = pay;
    }

    public List<Order> getOrd() {
        return ord;
    }

    public void setOrd(List<Order> ord) {
        this.ord = ord;
    }

    public List<OrderDetail> getDetail() {
        return detail;
    }

    public void setDetail(List<OrderDetail> detail) {
        this.detail = detail;
    }

    public void addOrder(int cusid, int status, String phone, String name, String address, int payid, Cart cart) {
        LocalDate time = LocalDate.now();
        String date = time.toString();
        String sql = "INSERT INTO [Order]\n"
                + "           ([cus_id]\n"
                + "           ,[orderDate]\n"
                + "           ,[adress]\n"
                + "           ,[phone]\n"
                + "           ,[payment_id]\n"
                + "           ,[totalAmount]\n"
                + "           ,[cus_name],"
                + "             [status_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cusid);
            ps.setString(2, date);
            ps.setString(3, address);
            ps.setString(4, phone);
            ps.setInt(5, payid);
            ps.setDouble(6, cart.getTotalMoney(cusid));
            ps.setString(7, name);
            ps.setInt(8, status);
            ps.executeUpdate();

            // Get the ID of the last inserted order
            String sql1 = "SELECT TOP (1) [id]\n"
                    + "  FROM [Order]\n"
                    + "  ORDER BY [id] DESC";
            PreparedStatement ps1 = conn.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Items items : cart.getItems()) {
                    if (items.getAccid() == cusid) {
                        String sql2 = "INSERT INTO [orderDetail]\n"
                                + "           ([order_id]\n"
                                + "           ,[product_id]\n"
                                + "           ,[total_price]\n"
                                + "           ,[quantity]\n"
                                + "           ,[proName]\n"
                                + "           ,[description]\n"
                                + "           ,[proimg]\n"
                                + "           ,[caid]\n"
                                + "           ,[brand_id])\n"
                                + "     VALUES\n"
                                + "           (?,?,?,?,?,?,?,?,?)";
                        PreparedStatement ps2 = conn.prepareStatement(sql2);
                        ps2.setInt(1, oid);
                        ps2.setInt(2, items.getProduct().getId());
                        ps2.setDouble(3, items.getPrice());
                        ps2.setInt(4, items.getQuantity());
                        ps2.setString(5, items.getProduct().getProName());
                        ps2.setString(6, items.getProduct().getDescription());
                        ps2.setString(7, items.getProduct().getImg());
                        ps2.setInt(8, items.getProduct().getCaid());
                        ps2.setInt(9, items.getProduct().getBrand_id());
                        ps2.executeUpdate();
                    }
                }
            }

            // Update the product stock
            String sql3 = "UPDATE [Product]\n"
                    + "   SET [stockQuantity] = [stockQuantity] - ?\n"
                    + " WHERE [id] = ?";
            PreparedStatement ps3 = conn.prepareStatement(sql3);
            for (Items i : cart.getItems()) {
                if (i.getAccid() == cusid) {
                    ps3.setInt(1, i.getQuantity());
                    ps3.setInt(2, i.getProduct().getId());
                    ps3.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DAOOrder dao = new DAOOrder();
         LocalDate time = LocalDate.now();
        String date = time.toString();
        System.out.println(date);
    }

    public int Orderid(int cusid) {
        int order = 0;
        String sql = "SELECT TOP (1) [id]\n"
                + "  FROM [Order] where [cus_id] =?\n"
                + "  order by id desc";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cusid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                order = rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return order;
    }

    public Order getOrderbyId(int orid) {
        Order order = new Order();
        String sql = "SELECT [id]\n"
                + "      ,[cus_id]\n"
                + "      ,[orderDate]\n"
                + "      ,[status_id]\n"
                + "      ,[adress]\n"
                + "      ,[phone]\n"
                + "      ,[deliverDate]\n"
                + "      ,[payment_id]\n"
                + "      ,[totalAmount]\n"
                + "      ,[cus_name]\n"
                + "      ,[ship_id]\n"
                + "  FROM [dbo].[Order]\n"
                + "  where id = ?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int cus_id = rs.getInt(2);
                String orderDate = rs.getString(3);
                int status_id = rs.getInt(4);
                String adress = rs.getString(5);
                String phone = rs.getString(6);
                String deliverDate = rs.getString(7);
                int payment_id = rs.getInt(8);
                double totalAmount = rs.getDouble(9);
                String cus_name = rs.getString(10);
                int ship_id = rs.getInt(11);
                order = new Order(id, cus_id, orderDate, status_id, adress, phone, deliverDate, payment_id, totalAmount, cus_name, ship_id);
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
        return order;
    }

    public void getAllOrder() {
        ord = new Vector<>();
        String sql = "SELECT [id]\n"
                + "      ,[cus_id]\n"
                + "      ,[orderDate]\n"
                + "      ,[status_id]\n"
                + "      ,[adress]\n"
                + "      ,[phone]\n"
                + "      ,[deliverDate]\n"
                + "      ,[payment_id]\n"
                + "      ,[totalAmount]\n"
                + "      ,[cus_name]\n"
                + "      ,[ship_id]\n"
                + "  FROM [Order]\n"
                + " ";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int cus_id = rs.getInt(2);
                String orderDate = rs.getString(3);
                int status_id = rs.getInt(4);
                String adress = rs.getString(5);
                String phone = rs.getString(6);
                String deliverDate = rs.getString(7);
                int payment_id = rs.getInt(8);
                double totalAmount = rs.getDouble(9);
                String cus_name = rs.getString(10);
                int ship_id = rs.getInt(11);
                ord.add(new Order(id, cus_id, orderDate, status_id, adress, phone, deliverDate, payment_id, totalAmount, cus_name, ship_id));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void getAllPayment() {
        String sql = "SELECT  [PaymentMethodID]\n"
                + "      ,[Name]\n"
                + "      ,[Description]\n"
                + "  FROM [PaymentMethod]";
        pay = new Vector<PaymentMethod>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                pay.add(new PaymentMethod(id, name, des));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }

    public void deleteOrder(int orderid) {
        String sql = "DELETE FROM [orderDetail]\n"
                + "      WHERE order_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderid);
            ps.executeUpdate();

            String sql2 = "DELETE FROM [Order]\n"
                    + "      WHERE id = ?";
            PreparedStatement ps1 = conn.prepareStatement(sql2);
            ps1.setInt(1, orderid);
            ps1.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void getAllStatus() {
        String sql = "SELECT [StatusID]\n"
                + "      ,[Name]\n"
                + "      ,[Description]\n"
                + "  FROM [OrderStatus]";
        sta = new Vector<OrderStatus>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                sta.add(new OrderStatus(id, name, des));
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ
        }
    }
}
