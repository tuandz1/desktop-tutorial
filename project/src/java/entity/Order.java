/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author admin
 */
public class Order {

    private int id;
    private int cus_id;
    private String orderDate;
    private int status_id;
    private String adress;
    private String phone;
    private String deliverDate;
    private int payment_id;
    private double totalAmount;
    private String cus_name;
    private int ship_id;
    private String shipstatus;

    public Order() {
    }

    public Order(int id, int cus_id, String orderDate, int status_id, String adress, String phone, String deliverDate, int payment_id, double totalAmount, String cus_name, int ship_id, String shipstatus) {
        this.id = id;
        this.cus_id = cus_id;
        this.orderDate = orderDate;
        this.status_id = status_id;
        this.adress = adress;
        this.phone = phone;
        this.deliverDate = deliverDate;
        this.payment_id = payment_id;
        this.totalAmount = totalAmount;
        this.cus_name = cus_name;
        this.ship_id = ship_id;
        this.shipstatus = shipstatus;
    }

    public String getCus_name() {
        return cus_name;
    }

    public String getShipstatus() {
        return shipstatus;
    }

    public void setShipstatus(String shipstatus) {
        this.shipstatus = shipstatus;
    }

    public void setCus_name(String cus_name) {
        this.cus_name = cus_name;
    }

    public int getShip_id() {
        return ship_id;
    }

    public void setShip_id(int ship_id) {
        this.ship_id = ship_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCus_id() {
        return cus_id;
    }

    public void setCus_id(int cus_id) {
        this.cus_id = cus_id;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDeliverDate() {
        return deliverDate;
    }

    public void setDeliverDate(String deliverDate) {
        this.deliverDate = deliverDate;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

}
