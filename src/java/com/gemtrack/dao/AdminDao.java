/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.dao;

import com.gemtrack.entities.AdminSignup;
import com.gemtrack.entities.Signup;
import java.sql.*;

/**
 *
 * @author LENOVO
 */
public class AdminDao {
    private Connection con;

    public AdminDao(Connection con) {
        this.con = con;
    }
    
     public boolean deleteAdminUser(AdminSignup adminsignup) {
        boolean f = false;
        
        try {
            String query = "DELETE FROM admin_signup WHERE id = ?";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setInt(1, adminsignup.getAdmin_id());
            
//            System.out.println("Id in SIgnupdao"+adminsignup.getAdmin_id());
        
            ps.executeUpdate();
            
            f = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public boolean saveAdmin(AdminSignup adminsignup) {
        
        boolean f = false;
        
        try {
            
            // user go to db
            String query = "insert into admin_signup(admin_name, admin_email, admin_password) values(?,?,?)";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setString(1, adminsignup.getAdmin_name());
            ps.setString(2, adminsignup.getAdmin_email());
            ps.setString(3, adminsignup.getAdmin_password());
            
            ps.executeUpdate();
            
            f=true;
            
            
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public AdminSignup getAdmin(String admin_name, String admin_email, String admin_password){
        AdminSignup adminsign = null;
        
        try {
            
            String query = "select * from admin_signup where admin_name = ? and admin_email = ? and admin_password=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, admin_name);
            ps.setString(2, admin_email);
            ps.setString(3, admin_password);
            
            ResultSet rs = ps.executeQuery();
//            System.out.println(admin_name);
//            System.out.println(admin_email);
//            System.out.println(admin_password);
            if(rs.next()) {
                
//                System.out.println(admin_name);
//            System.out.println(admin_email);
//            System.out.println(admin_password);

                if(rs.getString("admin_name").equals(admin_name) && rs.getString("admin_email").equals(admin_email) && rs.getString("admin_password").equals(admin_password)) {
                
                adminsign = new AdminSignup(admin_name, admin_email, admin_password);
                
                // data from database
//                String admin_name = rs.getString("admin_name");
//                adminsign.setUser_name(admin_name);
                
                
//                adminsign.set_id(rs.getInt("user_id"));
                adminsign.setAdmin_name(rs.getString("admin_name"));
                adminsign.setAdmin_email(rs.getString("admin_email"));
                adminsign.setAdmin_password(rs.getString("admin_password"));
                
//                sign.setDateTime(rs.getTimeStamp("user_registration"));
                
                
                
                }
                
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return adminsign;
    }
    
}
