/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author admin
 */
public class PaymentMethod {
    private int PaymentMethodID;
      private String Name;
      private String Description;

    public PaymentMethod() {
    }

    public PaymentMethod(int PaymentMethodID, String Name, String Description) {
        this.PaymentMethodID = PaymentMethodID;
        this.Name = Name;
        this.Description = Description;
    }

    public int getPaymentMethodID() {
        return PaymentMethodID;
    }

    public void setPaymentMethodID(int PaymentMethodID) {
        this.PaymentMethodID = PaymentMethodID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }
      
      
}
