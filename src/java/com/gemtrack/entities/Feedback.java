/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.entities;

/**
 *
 * @author LENOVO
 */
public class Feedback {
    
    private int id;
    private String user_name;
    private String user_email;
    private String user_mobile;
    private String user_description;
    public Feedback(String user_name, String user_email, String user_mobile, String user_description) {
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_mobile = user_mobile;
        this.user_description = user_description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_mobile() {
        return user_mobile;
    }

    public void setUser_mobile(String user_mobile) {
        this.user_mobile = user_mobile;
    }

    public String getUser_description() {
        return user_description;
    }

    public void setUser_description(String user_description) {
        this.user_description = user_description;
    }
    

    
}
