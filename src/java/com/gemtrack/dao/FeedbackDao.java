/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.dao;
import com.gemtrack.helper.ConnectionProvider;
import com.gemtrack.entities.Feedback;
import com.gemtrack.entities.Signup;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author LENOVO
 */
public class FeedbackDao {
//    private Connection con;
    private Connection con;

    public FeedbackDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean saveFeedback(Feedback feedback) {
        
        boolean f = false;
        
        try {
            
            // user go to db
            String query = "insert into feedback(user_name, user_email, user_mobile, user_description) values(?,?,?,?)";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setString(1, feedback.getUser_name());
            ps.setString(2, feedback.getUser_email());
            ps.setString(3, feedback.getUser_mobile());
            ps.setString(4, feedback.getUser_description());
            
            ps.executeUpdate();
            
            f=true;
            
            
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
}
