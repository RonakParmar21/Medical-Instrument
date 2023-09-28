/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.entities;

/**
 *
 * @author LENOVO
 */
public class Inquiry {
    private int inquiry_id;
    private String user_name;
    private String user_email;
    private String user_mobile;
    private int main_cat_id;
    private int sub_cat_id;
    private int product_id;
    private int sub_product_id;
    private String user_description;

    public Inquiry(String user_name, String user_email, String user_mobile, int main_cat_id, int sub_cat_id, int product_id, int sub_product_id, String user_description) {
        this.user_name = user_name;
        this.user_email = user_email;
        this.user_mobile = user_mobile;
        this.main_cat_id = main_cat_id;
        this.sub_cat_id = sub_cat_id;
        this.product_id = product_id;
        this.sub_product_id = sub_product_id;
        this.user_description = user_description;
    }

    public int getInquiry_id() {
        return inquiry_id;
    }

    public void setInquiry_id(int inquiry_id) {
        this.inquiry_id = inquiry_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_mobile() {
        return user_mobile;
    }

    public void setUser_mobile(String user_mobile) {
        this.user_mobile = user_mobile;
    }

    public int getMain_cat_id() {
        return main_cat_id;
    }

    public void setMain_cat_id(int main_cat_id) {
        this.main_cat_id = main_cat_id;
    }

    public int getSub_cat_id() {
        return sub_cat_id;
    }

    public void setSub_cat_id(int sub_cat_id) {
        this.sub_cat_id = sub_cat_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getSub_product_id() {
        return sub_product_id;
    }

    public void setSub_product_id(int sub_product_id) {
        this.sub_product_id = sub_product_id;
    }

    public String getUser_description() {
        return user_description;
    }

    public void setUser_description(String user_description) {
        this.user_description = user_description;
    }
    
    
}
