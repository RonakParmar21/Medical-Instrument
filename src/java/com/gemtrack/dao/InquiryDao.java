/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.dao;


//import com.gemtrack.entities.Inquiry;
import com.gemtrack.entities.Inquiry;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author LENOVO
 */
public class InquiryDao {
    private Connection con;

    public InquiryDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean saveInquiry(Inquiry inquiry) {
        
        boolean f = false;
        
        try {
            
            // user go to db
//            String query = "insert into inquiry(user_name, user_email, user_mobile, main_cat_id, sub_cat_id, product_id, sub_product_id, user_description) values(?,?,?,?,?,?,?,?)";
//            
//            PreparedStatement ps = this.con.prepareStatement(query);
//            
//            ps.setString(1, inquiry.getUser_name());
//            ps.setString(2, inquiry.getUser_email());
//            ps.setString(3, inquiry.getUser_mobile());
//            ps.setInt(4, inquiry.getMain_cat_id());
//            ps.setInt(5, inquiry.getSub_cat_id());
//            ps.setInt(6, inquiry.getProduct_id());
//            ps.setInt(7, inquiry.getSub_product_id());
//            ps.setString(8, inquiry.getUser_description());
////            ps.setString(1, contact.getUser_name());
////            ps.setString(2, contact.getUser_email());
////            ps.setString(3, contact.getUser_mobile());
////            ps.setString(4, contact.getUser_description());
//            
//            ps.executeUpdate();
//            
//            f=true;


String query = "insert into inquiry(user_name, user_email, user_mobile, main_cat, sub_cat,product, sub_product, description) values(?,?,?,?,?,?,?,?)";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
//            ps.setString(1, signup.getUser_name());
//            ps.setString(2, signup.getUser_email());
//            ps.setString(3, signup.getUser_password());
//            ps.setString(4, signup.getUser_cpassword());
//            ps.setString(5, signup.getUser_mobile());
//            ps.setString(6, signup.getUser_bdate());
ps.setString(1, inquiry.getUser_name());
ps.setString(2, inquiry.getUser_email());
ps.setString(3, inquiry.getUser_mobile());
ps.setInt(4, inquiry.getMain_cat_id());
ps.setInt(5, inquiry.getSub_cat_id());
ps.setInt(6, inquiry.getProduct_id());
ps.setInt(7, inquiry.getSub_product_id());
ps.setString(8, inquiry.getUser_description());
            
            ps.executeUpdate();
            
            f=true;
            
            
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
}
