/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author admin
 */
public class SecurityQuestion {
    private int id;
    private String ques_name;

    public SecurityQuestion() {
    }

    public SecurityQuestion(int id, String ques_name) {
        this.id = id;
        this.ques_name = ques_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQues_name() {
        return ques_name;
    }

    public void setQues_name(String ques_name) {
        this.ques_name = ques_name;
    }
    
}
