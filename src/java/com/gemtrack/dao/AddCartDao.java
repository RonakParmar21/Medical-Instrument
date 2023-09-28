/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.dao;

import com.gemtrack.entities.AddCart;
import com.gemtrack.entities.SubProduct;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author LENOVO
 */
public class AddCartDao {
    private Connection con;

    public AddCartDao(Connection con) {
        this.con = con;
    }
    
    public boolean deleteCart(AddCart addCart) {
        boolean f = false;
        
        try {
            
            String query = "DELETE FROM add_cart WHERE cart_id = ?";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setInt(1, addCart.getCart_id());
            
//            System.out.println("Id in SIgnupdao"+signup.getUser_id());
        
            ps.executeUpdate();
            
            f = true;
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public boolean saveCart(AddCart addCart) {
        
        boolean f = false;      
        try {
            
             String query = "insert into add_cart(user_name, p_id, p_name, price, quantity) values(?,?,?,?,?)";
            
            PreparedStatement ps = this.con.prepareStatement(query);
            
            ps.setString(1, addCart.getUser_name());
            ps.setInt(2, addCart.getP_id());
            ps.setString(3, addCart.getP_name());
            ps.setInt(4, addCart.getPrice());
            ps.setInt(5, addCart.getQuantity());
                    
            
            
//            
//            ps.setInt(1, sproduct.getMain_cat_id());
//            ps.setInt(2, sproduct.getSub_cat_id());
//            ps.setInt(3, sproduct.getProduct_id());
//            ps.setString(4, sproduct.getModel_no());
//            ps.setString(5, sproduct.getDescription());
//            ps.setString(6, sproduct.getFeatures());
//            ps.setInt(7, sproduct.getQuantity());
//            ps.setInt(8, sproduct.getPrice());
//            ps.setString(9, sproduct.getSub_product_image());
            
            ps.executeUpdate();
            
            f=true;
           
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
        
}
