/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author admin
 */
public class Account {
    private int id;
    private String acc_name;
    private String email;
    private String address;
    private String cus_password;
    private String full_name;
    private String phone;
    private String avatar;
    private String answer;
    private int role_id;
    private int ques_id;

    public Account() {
    }

    public Account(int id, String acc_name, String cus_password) {
        this.id = id;
        this.acc_name = acc_name;
        this.cus_password = cus_password;
    }

    public Account(String email, String address, String full_name, String phone, String avatar, String answer, int ques_id) {
        this.email = email;
        this.address = address;
        this.full_name = full_name;
        this.phone = phone;
        this.avatar = avatar;
        this.answer = answer;
        this.ques_id = ques_id;
    }

    public Account(int id, String acc_name, String email, String address, String cus_password, String full_name, String phone, String avatar, String answer, int role_id, int ques_id) {
        this.id = id;
        this.acc_name = acc_name;
        this.email = email;
        this.address = address;
        this.cus_password = cus_password;
        this.full_name = full_name;
        this.phone = phone;
        this.avatar = avatar;
        this.answer = answer;
        this.role_id = role_id;
        this.ques_id = ques_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAcc_name() {
        return acc_name;
    }

    public void setAcc_name(String acc_name) {
        this.acc_name = acc_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCus_password() {
        return cus_password;
    }

    public void setCus_password(String cus_password) {
        this.cus_password = cus_password;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public int getQues_id() {
        return ques_id;
    }

    public void setQues_id(int ques_id) {
        this.ques_id = ques_id;
    }
    
}
