/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;
    private static Statement stm;

    public static Connection getConnection() {

        try {
            if (con == null) {
                String url = "jdbc:mysql://localhost:3306/gemtrack";
                String userName = "root";
                String password = "Ronak@21_11";

                // Load the MySQL JDBC driver class
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Create the connection
                con = DriverManager.getConnection(url, userName, password);
                stm = con.createStatement();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}