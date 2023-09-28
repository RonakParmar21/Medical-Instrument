/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.entities;

import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

/**
 *
 * @author LENOVO
 */
public class Signup {

    private int user_id;
    private String user_name;
    private String user_email;
    private String user_password;
    private String user_cpassword;
    private String user_mobile;
    private String user_bdate;
    private DateTimeFormatter user_registration;
    private String user_profile;
    private String user_verification_code;
    
    
    public Signup() {
    }
    
    public Signup(int user_id) {
        this.user_id = user_id;
    }   

    public Signup(int user_id, String user_name, String user_email, String user_mobile, String user_bdate) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_mobile = user_mobile;
        this.user_bdate = user_bdate;
    }
    
     
            public Signup(String user_name, String user_email, String user_password, String user_cpassword, String user_mobile, String user_bdate, String user_verification_code) {
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_password = user_password;
        this.user_cpassword = user_cpassword;
        this.user_mobile = user_mobile;
        this.user_bdate = user_bdate;
        this.user_verification_code = user_verification_code;
    }

    public Signup(String user_name, String user_email, String user_password, String user_cpassword, String user_mobile, String user_bdate) {
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_password = user_password;
        this.user_cpassword = user_cpassword;
        this.user_mobile = user_mobile;
        this.user_bdate = user_bdate;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_cpassword() {
        return user_cpassword;
    }

    public void setUser_cpassword(String user_cpassword) {
        this.user_cpassword = user_cpassword;
    }

    public String getUser_mobile() {
        return user_mobile;
    }

    public void setUser_mobile(String user_mobile) {
        this.user_mobile = user_mobile;
    }

    public String getUser_bdate() {
        return user_bdate;
    }

    public void setUser_bdate(String user_bdate) {
        this.user_bdate = user_bdate;
    }

    public DateTimeFormatter getUser_registration() {
        return user_registration;
    }

    public void setUser_registration(DateTimeFormatter user_registration) {
        this.user_registration = user_registration;
    }

    public String getUser_profile() {
        return user_profile;
    }

    public void setUser_profile(String user_profile) {
        this.user_profile = user_profile;
    }

    public String getUser_verification_code() {
        return user_verification_code;
    }

    public void setUser_verification_code(String user_verification_code) {
        this.user_verification_code = user_verification_code;
    }

    
    
    
}
