/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.dao;

import com.gemtrack.entities.MainCategory;
import com.gemtrack.entities.Signup;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.Part;
import org.apache.coyote.ActionCode;

/**
 *
 * @author LENOVO
 */
public class MainCategoryDao {
      private Connection con;

    public MainCategoryDao(Connection con) {
        this.con = con;
    }
    
    public boolean updateMainCategory(MainCategory mcat) {
        boolean f = false;
        try {
            String query = "UPDATE main_category SET main_cat_name=?, main_cat_image=? WHERE main_cat_id=?";
//            String query = "UPDATE signup SET user_name = 'ronak', user_email = 'rpk@gmail.com', user_password='Ronak@21', user_cpassword='Ronak@21', user_mobile='1234512345', user_bdate='2003-11-21' WHERE user_id = 27";
            PreparedStatement ps = this.con.prepareStatement(query);
            
//            ps.setInt(1, signup.getUser_id());
//            ps.setString(1, signup.getUser_name());
//            ps.setString(2, signup.getUser_email());
//            ps.setString(3, signup.getUser_password());
//            ps.setString(4, signup.getUser_cpassword());
//            ps.setString(5, signup.getUser_mobile());
//            ps.setString(6, signup.getUser_bdate());
//            ps.setInt(7,signup.getUser_id());
                ps.setString(1, mcat.getMain_cat_name());
                ps.setString(2, mcat.getMain_cat_image());
                ps.setInt(3, mcat.getMain_cat_id());
            
            
//            System.out.println("Id in SIgnupdao"+signup.getUser_id());
        
            ps.executeUpdate();
            
            f = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean saveMainCategory(MainCategory mcat) {
       
        boolean f = false;
        try {
            
            // user go to db
            String query = "insert into main_category(main_cat_name, main_cat_image) values(?,?)";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            //String img = mcat.getMain_cat_image();
//            Part mainCatImage = (Part)getPart(mcat.getMain_cat_image());
            
//            ps.setString(1, mcat.getMain_cat_name());
//            ps.setString(2, mcat.getMain_cat_image());
//ps.setString(1, mcat.getOld_cat_name());
ps.setString(1, mcat.getMain_cat_name());
ps.setString(2, mcat.getMain_cat_image());
            
            ps.executeUpdate();
            
            f=true;
            
            
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
//    public boolean deleteMainCategory(MainCategory mainC) {
//        boolean f = false;
        
//        try {
//            String query = "DELTE FROM main_category WHERE main_cat_id = ?";
//            PreparedStatement ps = this.con.prepareStatement(query);
//            ps.setInt(1, mainC.getMain_cat_id());
//            ps.executeUpdate();
//            f = true;
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//        
//        return f;
//        
//    }
    
    
    public boolean deleteMainCategory(MainCategory mainC) {
        boolean f = false;
        
        try {
            String query = "DELETE FROM main_category WHERE main_cat_id = ?";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setInt(1, mainC.getMain_cat_id());
            
            System.out.println("Id in main category dao"+mainC.getMain_cat_id());
        
            ps.executeUpdate();
            
            f = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
}
