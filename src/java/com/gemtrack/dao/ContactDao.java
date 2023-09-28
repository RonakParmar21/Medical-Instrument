/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.dao;
import com.gemtrack.helper.ConnectionProvider;
import com.gemtrack.entities.Contact;
import com.gemtrack.entities.Signup;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author LENOVO
 */
public class ContactDao {
    
    private Connection con;

    public ContactDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean saveContact(Contact contact) {
        
        boolean f = false;
        
        try {
            
            // user go to db
            String query = "insert into contact(user_name, user_email, user_mobile, user_description) values(?,?,?,?)";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setString(1, contact.getUser_name());
            ps.setString(2, contact.getUser_email());
            ps.setString(3, contact.getUser_mobile());
            ps.setString(4, contact.getUser_description());
            
            ps.executeUpdate();
            
            f=true;
            
            
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
}
