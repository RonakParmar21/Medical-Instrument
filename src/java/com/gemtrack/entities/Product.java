/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.entities;

/**
 *
 * @author LENOVO
 */
public class Product {
    private int product_id;
    private int main_cat_id;
    private int sub_cat_id;
//    private String main_cat_name;
//    private String sub_cat_name;
    private String product_name;
    private String product_image;

    public Product(int product_id, int main_cat_id, int sub_cat_id, String product_name, String product_image) {
        this.product_id = product_id;
        this.main_cat_id = main_cat_id;
        this.sub_cat_id = sub_cat_id;
        this.product_name = product_name;
        this.product_image = product_image;
    }
    
    

    public Product(int main_cat_id, int sub_cat_id, String product_name, String product_image) {
        this.main_cat_id = main_cat_id;
        this.sub_cat_id = sub_cat_id;
        this.product_name = product_name;
        this.product_image = product_image;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
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

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }
    
    
}
