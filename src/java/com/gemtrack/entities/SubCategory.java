/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.entities;

/**
 *
 * @author LENOVO
 */
public class SubCategory {
    private int sub_cat_id;
    private int main_cat_id;
    private String sub_cat_name;
    private String sub_cat_image;

    public SubCategory(int main_cat_id, String sub_cat_name, String sub_cat_image) {
        this.main_cat_id = main_cat_id;
        this.sub_cat_name = sub_cat_name;
        this.sub_cat_image = sub_cat_image;
    }

    public SubCategory() {
    }

    public SubCategory(int sub_cat_id, int main_cat_id, String sub_cat_name, String sub_cat_image) {
        this.sub_cat_id = sub_cat_id;
        this.main_cat_id = main_cat_id;
        this.sub_cat_name = sub_cat_name;
        this.sub_cat_image = sub_cat_image;
    }
    
    

    public int getSub_cat_id() {
        return sub_cat_id;
    }

    public void setSub_cat_id(int sub_cat_id) {
        this.sub_cat_id = sub_cat_id;
    }

    public int getMain_cat_id() {
        return main_cat_id;
    }

    public void setMain_cat_id(int main_cat_id) {
        this.main_cat_id = main_cat_id;
    }

    public String getSub_cat_name() {
        return sub_cat_name;
    }

    public void setSub_cat_name(String sub_cat_name) {
        this.sub_cat_name = sub_cat_name;
    }

    public String getSub_cat_image() {
        return sub_cat_image;
    }

    public void setSub_cat_image(String sub_cat_image) {
        this.sub_cat_image = sub_cat_image;
    }

    
}
