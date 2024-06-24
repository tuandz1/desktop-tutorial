/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author admin
 */
public class OrderDetail {

    private int id;
    private int order_id;
    private int product_id;
    private double total_price;
    private int quantity;
    private String proName;
    private String description;
    private String proimg;
    private int caid;
    private int brand_id;

    public OrderDetail() {
    }

    public OrderDetail(int id, int order_id, int product_id, double total_price, String cus_name, int quantity, String proName, String description, String proimg, int caid, int brand_id) {
        this.id = id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.total_price = total_price;
        this.quantity = quantity;
        this.proName = proName;
        this.description = description;
        this.proimg = proimg;
        this.caid = caid;
        this.brand_id = brand_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

 
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProimg() {
        return proimg;
    }

    public void setProimg(String proimg) {
        this.proimg = proimg;
    }

    public int getCaid() {
        return caid;
    }

    public void setCaid(int caid) {
        this.caid = caid;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }
    
    
}
