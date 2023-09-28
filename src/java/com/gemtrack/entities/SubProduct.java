/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.entities;

/**
 *
 * @author LENOVO
 */
public class SubProduct {
    private int sub_product_id;
    private int main_cat_id;
    private int sub_cat_id;
    private int product_id;
    private String model_no;    
    private String description;
    private String features;
    private int quantity;
    private int price;
    private String sub_product_image;
    private String sub_cat_name;

    public SubProduct(int main_cat_id, int sub_cat_id, int product_id, String model_no, String description, String features, int quantity, int price, String sub_product_image, String sub_cat_name) {
        this.main_cat_id = main_cat_id;
        this.sub_cat_id = sub_cat_id;
        this.product_id = product_id;
        this.model_no = model_no;
        this.description = description;
        this.features = features;
        this.quantity = quantity;
        this.price = price;
        this.sub_product_image = sub_product_image;
        this.sub_cat_name = sub_cat_name;
    }

    public SubProduct(int sub_product_id, int quantity) {
        this.sub_product_id = sub_product_id;
        this.quantity = quantity;
    }

    
    public SubProduct(int sub_product_id, int main_cat_id, int sub_cat_id, int product_id, String model_no, String description, String features, int quantity, int price, String sub_product_image, String sub_cat_name) {
        this.sub_product_id = sub_product_id;
        this.main_cat_id = main_cat_id;
        this.sub_cat_id = sub_cat_id;
        this.product_id = product_id;
        this.model_no = model_no;
        this.description = description;
        this.features = features;
        this.quantity = quantity;
        this.price = price;
        this.sub_product_image = sub_product_image;
        this.sub_cat_name = sub_cat_name;
    }

    public SubProduct(int sub_product_id) {
        this.sub_product_id = sub_product_id;
    }

    
    
    public int getSub_product_id() {
        return sub_product_id;
    }

    public void setSub_product_id(int sub_product_id) {
        this.sub_product_id = sub_product_id;
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

    public String getModel_no() {
        return model_no;
    }

    public void setModel_no(String model_no) {
        this.model_no = model_no;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFeatures() {
        return features;
    }

    public void setFeatures(String features) {
        this.features = features;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getSub_product_image() {
        return sub_product_image;
    }

    public void setSub_product_image(String sub_product_image) {
        this.sub_product_image = sub_product_image;
    }

    public String getSub_cat_name() {
        return sub_cat_name;
    }

    public void setSub_cat_name(String sub_cat_name) {
        this.sub_cat_name = sub_cat_name;
    }
    
    
}
