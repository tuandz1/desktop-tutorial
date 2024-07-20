/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author admin
 */
public class ShipStatus {
    private int ShipStatusID;
      private String Status;
      private String Reason;

    public ShipStatus() {
    }

    public ShipStatus(int ShipStatusID, String Status, String Reason) {
        this.ShipStatusID = ShipStatusID;
        this.Status = Status;
        this.Reason = Reason;
    }

    public int getShipStatusID() {
        return ShipStatusID;
    }

    public void setShipStatusID(int ShipStatusID) {
        this.ShipStatusID = ShipStatusID;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getReason() {
        return Reason;
    }

    public void setReason(String Reason) {
        this.Reason = Reason;
    }
      
      
}
