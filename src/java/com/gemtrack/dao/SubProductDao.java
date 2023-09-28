/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.dao;

import com.gemtrack.entities.AdminSignup;
import com.gemtrack.entities.SubCategory;
import com.gemtrack.entities.SubProduct;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author LENOVO
 */
public class SubProductDao {

    private Connection con;

    public SubProductDao(Connection con) {
        this.con = con;
    }
    
    public boolean deleteSubProduct(SubProduct sproduct) {
        boolean f = false;
        
        try {
            String query = "DELETE FROM sub_product WHERE sub_product_id = ?";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
//            ps.setInt(1, adminsignup.getAdmin_id());
ps.setInt(1, sproduct.getSub_product_id());
            
//            System.out.println("Id in SIgnupdao"+adminsignup.getAdmin_id());
        
            ps.executeUpdate();
            
            f = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public boolean updateQuantity(SubProduct sproduct) {
        boolean f = false;
        
        try {
            
            String query = "UPDATE sub_product SET quantity=quantity+? WHERE sub_product_id=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setInt(1, sproduct.getQuantity());
            ps.setInt(2, sproduct.getSub_product_id());
            ps.executeUpdate();
            
            f = true;
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public boolean updateQ(SubProduct sproduct) {
        boolean f = false;
        
        try {
         
//            String query = "select * from sub_product WHERE sub_product_id=?";
            
//            PreparedStatement ps = this.con.prepareStatement(query);
            
//            ps.setString(1, sproduct.getModel_no());
//            int spid = (int)ps.setInt(1, sproduct.getSub_product_id());
            
//            ResultSet rs = ps.executeQuery();
//            String query = "UPDATE sub_product SET model_no=?, description=?, features=?, quantity=?, price=?, sub_product_image=? WHERE sub_product_id=?";
            
String query = "UPDATE sub_product SET quantity=quantity-? WHERE sub_product_id=?";
//            String query = "UPDATE signup SET user_name = 'ronak', user_email = 'rpk@gmail.com', user_password='Ronak@21', user_cpassword='Ronak@21', user_mobile='1234512345', user_bdate='2003-11-21' WHERE user_id = 27";
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setInt(1, sproduct.getQuantity());
            ps.setInt(2, sproduct.getSub_product_id());
//            ps.setString(1, sproduct.getModel_no());
//            ps.setString(2, sproduct.getDescription());
//            ps.setString(3, sproduct.getFeatures());
//            ps.setInt(4, sproduct.getQuantity());
//            ps.setInt(5, sproduct.getPrice());
//            ps.setString(6, sproduct.getSub_product_image());
//            ps.setInt(7, sproduct.getSub_product_id());
            
//            ps.setInt(1, signup.getUser_id());
//            ps.setString(1, signup.getUser_name());
//            ps.setString(2, signup.getUser_email());
//            ps.setString(3, signup.getUser_password());
//            ps.setString(4, signup.getUser_cpassword());
//            ps.setString(5, signup.getUser_mobile());
//            ps.setString(6, signup.getUser_bdate());
//            ps.setInt(7,signup.getUser_id());
//                ps.setString(1, mcat.getMain_cat_name());
//                ps.setString(2, mcat.getMain_cat_image());
//                ps.setInt(3, mcat.getMain_cat_id());
//ps.setInt(1, scat.getMain_cat_id());
//ps.setString(1, scat.getSub_cat_name());
//ps.setString(2, scat.getSub_cat_image());
//ps.setInt(3, scat.getMain_cat_id());
            
            
//            System.out.println("Id in SIgnupdao"+signup.getUser_id());
        
            ps.executeUpdate();
            
            f = true;

            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public boolean updateSubProduct(SubProduct sproduct) {
        boolean f = false;
        try {
            String query = "UPDATE sub_product SET model_no=?, description=?, features=?, quantity=?, price=?, sub_product_image=? WHERE sub_product_id=?";
//            String query = "UPDATE signup SET user_name = 'ronak', user_email = 'rpk@gmail.com', user_password='Ronak@21', user_cpassword='Ronak@21', user_mobile='1234512345', user_bdate='2003-11-21' WHERE user_id = 27";
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setString(1, sproduct.getModel_no());
            ps.setString(2, sproduct.getDescription());
            ps.setString(3, sproduct.getFeatures());
            ps.setInt(4, sproduct.getQuantity());
            ps.setInt(5, sproduct.getPrice());
            ps.setString(6, sproduct.getSub_product_image());
            ps.setInt(7, sproduct.getSub_product_id());
            
//            ps.setInt(1, signup.getUser_id());
//            ps.setString(1, signup.getUser_name());
//            ps.setString(2, signup.getUser_email());
//            ps.setString(3, signup.getUser_password());
//            ps.setString(4, signup.getUser_cpassword());
//            ps.setString(5, signup.getUser_mobile());
//            ps.setString(6, signup.getUser_bdate());
//            ps.setInt(7,signup.getUser_id());
//                ps.setString(1, mcat.getMain_cat_name());
//                ps.setString(2, mcat.getMain_cat_image());
//                ps.setInt(3, mcat.getMain_cat_id());
//ps.setInt(1, scat.getMain_cat_id());
//ps.setString(1, scat.getSub_cat_name());
//ps.setString(2, scat.getSub_cat_image());
//ps.setInt(3, scat.getMain_cat_id());
            
            
//            System.out.println("Id in SIgnupdao"+signup.getUser_id());
        
            ps.executeUpdate();
            
            f = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean saveSubProduct(SubProduct sproduct) {
        
        boolean f = false;      
        try {
            
             String query = "insert into sub_product(main_cat_id, sub_cat_id, product_id, model_no, description, features, quantity, price, sub_product_image) values(?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setInt(1, sproduct.getMain_cat_id());
            ps.setInt(2, sproduct.getSub_cat_id());
            ps.setInt(3, sproduct.getProduct_id());
            ps.setString(4, sproduct.getModel_no());
            ps.setString(5, sproduct.getDescription());
            ps.setString(6, sproduct.getFeatures());
            ps.setInt(7, sproduct.getQuantity());
            ps.setInt(8, sproduct.getPrice());
            ps.setString(9, sproduct.getSub_product_image());
            
            ps.executeUpdate();
            
            f=true;
           
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
}
