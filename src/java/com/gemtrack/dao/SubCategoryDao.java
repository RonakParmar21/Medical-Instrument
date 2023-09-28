/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.dao;

import com.gemtrack.entities.MainCategory;
import com.gemtrack.entities.SubCategory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author LENOVO
 */
public class SubCategoryDao {
    private Connection con;

    public SubCategoryDao(Connection con) {
        this.con = con;
    }
    public boolean updateSubCategory(SubCategory scat) {
        boolean f = false;
        try {
            String query = "UPDATE sub_category SET sub_cat_name=?, sub_cat_image=? WHERE sub_cat_id=?";
//            String query = "UPDATE signup SET user_name = 'ronak', user_email = 'rpk@gmail.com', user_password='Ronak@21', user_cpassword='Ronak@21', user_mobile='1234512345', user_bdate='2003-11-21' WHERE user_id = 27";
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setString(1, scat.getSub_cat_name());
            ps.setString(2, scat.getSub_cat_image());
            ps.setInt(3, scat.getSub_cat_id());
            
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
    
    
    public boolean saveSubCategory(SubCategory scat) {
        
        boolean f = false;      
        try {
            
             String query = "insert into sub_category(main_cat_id, sub_cat_name, sub_cat_image) values(?,?,?)";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            //String img = mcat.getMain_cat_image();
//            Part mainCatImage = (Part)getPart(mcat.getMain_cat_image());
            
//            ps.setString(1, mcat.getMain_cat_name());
//            ps.setString(2, mcat.getMain_cat_image());
//ps.setString(1, mcat.getOld_cat_name());
ps.setInt(1, scat.getMain_cat_id());
ps.setString(2, scat.getSub_cat_name());
ps.setString(3, scat.getSub_cat_image());
            
            ps.executeUpdate();
            
            f=true;
           
//            int main_id=scat.getMain_cat_id();
//            String query1 = "select * from main_category where main_cat_id='"+main_id+"'";
//            
//            PreparedStatement ps1 = this.con.prepareStatement(query1);
//            ResultSet rs = ps1.executeQuery();
//            
////            if(rs.next()) {
//                MainCategory mcat = new MainCategory();
//                
//                String main_cat_name = rs.getString("main_cat_name");
////            }
////            String main_cat_name = scat.getMain_cat_name();
//            
//            System.out.println(main_cat_name);
//            // user go to db
//            String query = "insert into sub_category(main_cat_id, main_cat_name, sub_cat_name, sub_cat_image) values(?,'"+main_cat_name+"',?,?)";
//            
//            PreparedStatement ps = this.con.prepareStatement(query);
//            
//            //String img = mcat.getMain_cat_image();
////            Part mainCatImage = (Part)getPart(mcat.getMain_cat_image());
//            
////            ps.setString(1, mcat.getMain_cat_name());
////            ps.setString(2, mcat.getMain_cat_image());
////            ps.setString(1, scat.getMain_cat_name());
////            ps.setString(2, scat.getSub_cat_name());
////            ps.setString(3, scat.getSub_cat_image());
////ps.setString(1, scat.getOld_main_cat_name());
////ps.setString(2, scat.getMain_cat_name());
////ps.setString(3, scat.getOld_sub_cat_name());
////ps.setString(4, scat.getSub_cat_name());
////ps.setString(5, scat.getSub_cat_image());
////ps.setString(1, scat.get)
//
//ps.setInt(1, scat.getMain_cat_id());
////ps.setString(2, scat.getMain_cat_name());
//ps.setString(2, scat.getSub_cat_name());
//ps.setString(3, scat.getSub_cat_image());
//            
//            ps.executeUpdate();
//            
//            
//            
//            f=true;
//            
//            
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public boolean deleteSubCategory(SubCategory subC) {
        boolean f = false;
        
        try {
            String query = "DELETE FROM sub_category WHERE sub_cat_id = ?";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
//            ps.setInt(1, subC.getSub_cat_id());
ps.setInt(1, subC.getSub_cat_id());
            
            System.out.println("Id in main category dao"+subC.getSub_cat_id());
        
            ps.executeUpdate();
            
            f = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
}
