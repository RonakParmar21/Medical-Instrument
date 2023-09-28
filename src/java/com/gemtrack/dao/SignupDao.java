/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.dao;

//import com.gemtrack.entities.Contact;
import com.gemtrack.entities.Signup;
import java.sql.*;
import java.time.format.DateTimeFormatter;
import javax.mail.*;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import org.apache.jasper.runtime.ProtectedFunctionMapper;

public class SignupDao {
    
    public String getRandom() {
        
        Random ran = new Random();
        int number = ran.nextInt(999999);
        return String.format("%06d", number);
        
    }
    
    public boolean sendEmail(Signup signup) {
        
        boolean test = false;
        
        String toEmail = signup.getUser_email();
        String fromEmail = "parmarronak21112003@gmail.com";
        String password = "KJRK@21_11_2003";
        
        try {
            
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.mail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            
            pr.put("mail.smtp.socketFactory.port", "587");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            
            //
//            Session session = Session.getInstance(pr, Authenticator(){
//           
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(fromEmail, password);
//            }
//           
//        });
//            Session session = Session.getInstance(pr, Authenticator(){
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(fromEmail, password);
//            }
//        });
            
            
        } catch(Exception e) {
            
            e.printStackTrace();
            
        }
        return test;
    }
    
    private Connection con;

    public SignupDao(Connection con) {
        this.con = con;
    }
    
//    public boolean contactDetail(Contact contact) {
//        boolean f = false;
//        
//        try {
//            
//            // user go to db
//            String query = "insert into contact(user_name, user_email, user_mobile, user_description) values(?,?,?,?)";
//            
//            PreparedStatement ps = this.con.prepareStatement(query);
//            
//            ps.setString(1, contact.getUser_name());
//            ps.setString(2, contact.getUser_email());
//            ps.setString(3, contact.getUser_mobile());
//            ps.setString(4, contact.getUser_description());
//            
//            ps.executeUpdate();
//            
//            f=true;
//            
//            
//            
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//        
//        return f;
//    }
    
    
    /*public boolean deleteUser(Signup signup) {
        boolean f = false;
        
        
        try {
            
            String sql = "select * from signup where id = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                
                
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
    
        return f;
    }
    */
    
    public boolean updateCustomerUser(Signup signup) {
        boolean f = false;
        try {
            String query = "UPDATE signup SET user_name=?, user_email=?, user_password=?, user_cpassword=?, user_mobile=?, user_bdate=? WHERE user_id=?";
//            String query = "UPDATE signup SET user_name = 'ronak', user_email = 'rpk@gmail.com', user_password='Ronak@21', user_cpassword='Ronak@21', user_mobile='1234512345', user_bdate='2003-11-21' WHERE user_id = 27";
            PreparedStatement ps = this.con.prepareStatement(query);
            
//            ps.setInt(1, signup.getUser_id());
            ps.setString(1, signup.getUser_name());
            ps.setString(2, signup.getUser_email());
            ps.setString(3, signup.getUser_password());
            ps.setString(4, signup.getUser_cpassword());
            ps.setString(5, signup.getUser_mobile());
            ps.setString(6, signup.getUser_bdate());
            ps.setInt(7,signup.getUser_id());
            
            System.out.println(signup.getUser_id());
            System.out.println(signup.getUser_name());
            System.out.println(signup.getUser_email());
            System.out.println(signup.getUser_password());
            System.out.println(signup.getUser_cpassword());
            System.out.println(signup.getUser_mobile());
            System.out.println(signup.getUser_bdate());
            
//            System.out.println("Id in SIgnupdao"+signup.getUser_id());
        
            ps.executeUpdate();
            
            f = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean deleteUser(Signup signup) {
        boolean f = false;
        
        try {
            String query = "DELETE FROM signup WHERE user_id = ?";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setInt(1, signup.getUser_id());
            
//            System.out.println("Id in SIgnupdao"+signup.getUser_id());
        
            ps.executeUpdate();
            
            f = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    
    
    public boolean saveUser(Signup signup) {
        
        boolean f = false;
        
        try {
            
            // user go to db
            String query = "insert into signup(user_name, user_email, user_password, user_cpassword, user_mobile, user_bdate, user_verification_code) values(?,?,?,?,?,?,?)";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setString(1, signup.getUser_name());
            ps.setString(2, signup.getUser_email());
            ps.setString(3, signup.getUser_password());
            ps.setString(4, signup.getUser_cpassword());
            ps.setString(5, signup.getUser_mobile());
            ps.setString(6, signup.getUser_bdate());
            ps.setString(7, signup.getUser_verification_code());
            
            int i = ps.executeUpdate();
            if(i!=0) {
                // sending email code
//                SendingEmail se = new SedingEmail(signup.getUser_email(), signup.getUser_verification_code());
                SendingEmail se = new SendingEmail(signup.getUser_email(), signup.getUser_verification_code());
                
                f=true;
            }
            
            
            
            
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
//    get all customerUser
        public Signup getUsers(int user_id, String user_name, String user_email, String user_mobile, String user_bdate){
   
            Signup sign = null;
        
        try {
            
            String query = "select * from signup";
            
            PreparedStatement ps = con.prepareStatement(query);
            
//            ps.setString(1, user_email);
//            ps.setString(2, user_password);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
                
                sign = new Signup();
                
                // data from database
                user_id = rs.getInt("user_id");
                user_name = rs.getString("user_name");
                user_email = rs.getString("user_email");
                user_mobile = rs.getString("user_mobile");
                user_bdate = rs.getString("user_bdate");
                
                sign.setUser_id(user_id);
                sign.setUser_name(user_name);
                sign.setUser_email(user_email);
                sign.setUser_mobile(user_mobile);
                sign.setUser_bdate(user_bdate);
                
                
//                sign.setUser_id(rs.getInt("user_id"));
//                sign.setUser_email(rs.getString("user_email"));
//                sign.setUser_password(rs.getString("user_password"));
//                sign.setUser_mobile(rs.getString("user_mobile"));
//                sign.setUser_bdate(rs.getString("user_bdate"));
//                sign.setDateTime(rs.getTimeStamp("user_registration"));
                
                
                
                
                
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return sign;
    }
        
        
    
    // get user by email and password
    public Signup getUserByEmailAndPassword(String user_email, String user_password){
        Signup sign = null;
        
        try {
            
            String query = "select * from signup where user_email = ? and user_password=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, user_email);
            ps.setString(2, user_password);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
                
                sign = new Signup();
                
                // data from database
                String user_name = rs.getString("user_name");
                sign.setUser_name(user_name);
                
                
                sign.setUser_id(rs.getInt("user_id"));
                sign.setUser_email(rs.getString("user_email"));
                sign.setUser_password(rs.getString("user_password"));
                sign.setUser_mobile(rs.getString("user_mobile"));
                sign.setUser_bdate(rs.getString("user_bdate"));
//                sign.setDateTime(rs.getTimeStamp("user_registration"));
                
                
                
                
                
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return sign;
    }
    
    public boolean updateUser(Signup sign) {
        
        boolean f = false;
        
        try {
            
            String query = "update signup set user_name=?, user_email=?, user_password=?, user_cpassword=?, user_mobile=?, user_bdate=? where user_id=?";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, sign.getUser_name());
            ps.setString(2, sign.getUser_email());
            ps.setString(3, sign.getUser_password());
            ps.setString(4, sign.getUser_password());
            ps.setString(5, sign.getUser_mobile());
            ps.setString(6, sign.getUser_bdate());
            ps.setInt(7, sign.getUser_id());
            
            ps.executeUpdate();
            f = true;
        
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        
        return f;
        
    }
    
}
    /*
    private Connection con;
    boolean f = false;

    public signupDao(Connection con) {
        this.con = con;
    }

    // method to insert user to data base;
    public boolean saveUser(Signup signup1) {
        try {
//            ps.setString(2, signup1.getUser_email());
//            while()
//            String query1 = "select * from Signup where user_email = "
            String query = "insert into Signup(user_name, user_email, user_password, user_cpassword, user_mobile, user_bdate) value(?,?,md5(?),md5(?),?,?)";

            PreparedStatement ps = this.con.prepareStatement(query);

            ps.setString(1, signup1.getUser_name());
            ps.setString(2, signup1.getUser_email());
            ps.setString(3, signup1.getUser_password());
            ps.setString(4, signup1.getUser_cpassword());
            ps.setString(5, signup1.getUser_mobile());
            ps.setString(6, signup1.getUser_bdate());

            ps.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }*/
//}
