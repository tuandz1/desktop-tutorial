/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author admin
 */
public class Voucher {
    private String DiscountID;
      private double DiscountRate;
      private int  Amount;
      private String StartDate;
      private String EndDate;
      private int Status;

    public Voucher() {
    }

    public Voucher(String DiscountID, double DiscountRate, int Amount, String StartDate, String EndDate, int Status) {
        this.DiscountID = DiscountID;
        this.DiscountRate = DiscountRate;
        this.Amount = Amount;
        this.StartDate = StartDate;
        this.EndDate = EndDate;
        this.Status = Status;
    }

    

    public String getDiscountID() {
        return DiscountID;
    }

    public void setDiscountID(String DiscountID) {
        this.DiscountID = DiscountID;
    }

    public double getDiscountRate() {
        return DiscountRate;
    }

    public void setDiscountRate(double DiscountRate) {
        this.DiscountRate = DiscountRate;
    }

    public int getAmount() {
        return Amount;
    }

    public void setAmount(int Amount) {
        this.Amount = Amount;
    }

    public String getStartDate() {
        return StartDate;
    }

    public void setStartDate(String StartDate) {
        this.StartDate = StartDate;
    }

    public String getEndDate() {
        return EndDate;
    }

    public void setEndDate(String EndDate) {
        this.EndDate = EndDate;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }
      
      
}
