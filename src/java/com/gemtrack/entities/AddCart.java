/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.entities;

/**
 *
 * @author LENOVO
 */
public class AddCart {
    private int cart_id;
    private String user_name;
    private int p_id;
    private String p_name;
    private int price;
    private int quantity;

    public AddCart(String user_name, int p_id, String p_name, int price, int quantity) {
        this.user_name = user_name;
        this.p_id = p_id;
        this.p_name = p_name;
        this.price = price;
        this.quantity = quantity;
    }

    public AddCart(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
