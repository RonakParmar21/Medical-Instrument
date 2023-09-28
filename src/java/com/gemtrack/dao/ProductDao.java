/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.dao;

import com.gemtrack.entities.MainCategory;
import com.gemtrack.entities.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.Part;
import java.io.FileOutputStream;
/**
 *
 * @author LENOVO
 */
public class ProductDao {
    private Connection con;
    
    public ProductDao(Connection con) {
        this.con = con;
    }
    public boolean updateProduct(Product product) {
        boolean f = false;
        try {
            String query = "UPDATE product SET product_name=?, product_image=? WHERE product_id=?";
//            String query = "UPDATE signup SET user_name = 'ronak', user_email = 'rpk@gmail.com', user_password='Ronak@21', user_cpassword='Ronak@21', user_mobile='1234512345', user_bdate='2003-11-21' WHERE user_id = 27";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, product.getProduct_name());
            ps.setString(2, product.getProduct_image());
            ps.setInt(3,product.getProduct_id());
            
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
            
            
//            System.out.println("Id in SIgnupdao"+signup.getUser_id());
        
            ps.executeUpdate();
            
            f = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean saveProduct(Product product) {
        boolean f = false;
        try {
            String query = "insert into product(main_cat_id, sub_cat_id, product_name, product_image) values(?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            
            System.out.println(product.getMain_cat_id());
            System.out.println(product.getSub_cat_id());
            System.out.println(product.getProduct_name());
            
            
//            String img = product.getProduct_image();
//            Part product_image = (Part)getPart(product.getProduct_image());
            ps.setInt(1, product.getMain_cat_id());
            ps.setInt(2, product.getSub_cat_id());
            ps.setString(3, product.getProduct_name());
            ps.setString(4, product.getProduct_image());
            
            ps.executeUpdate();
            
            f = true;
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }         
}

