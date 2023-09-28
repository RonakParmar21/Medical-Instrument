/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.entities;

/**
 *
 * @author LENOVO
 */
public class MainCategory {
    private int main_cat_id;
//    private String old_cat_name;
    private String main_cat_name;
    private String main_cat_image;

    public MainCategory(String main_cat_name, String main_cat_image) {
//        this.old_cat_name = old_cat_name;
        this.main_cat_name = main_cat_name;
        this.main_cat_image = main_cat_image;
    }

    public MainCategory() {
    }

    public MainCategory(int main_cat_id, String main_cat_name, String main_cat_image) {
        this.main_cat_id = main_cat_id;
        this.main_cat_name = main_cat_name;
        this.main_cat_image = main_cat_image;
    }

    public MainCategory(int main_cat_id) {
        this.main_cat_id = main_cat_id;
    }

//    public String getOld_cat_name() {
//        return old_cat_name;
//    }
//
//    public void setOld_cat_name(String old_cat_name) {
//        this.old_cat_name = old_cat_name;
//    }
    
    

    public int getMain_cat_id() {
        return main_cat_id;
    }

    public void setMain_cat_id(int main_cat_id) {
        this.main_cat_id = main_cat_id;
    }
    

    public String getMain_cat_name() {
        return main_cat_name;
    }

    public void setMain_cat_name(String main_cat_name) {
        this.main_cat_name = main_cat_name;
    }

    public String getMain_cat_image() {
        return main_cat_image;
    }

    public void setMain_cat_image(String main_cat_image) {
        this.main_cat_image = main_cat_image;
    }
    
    
}
