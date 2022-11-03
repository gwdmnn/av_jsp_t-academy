package com.posts.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexão {
    public static Connection conectar(){
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/blog";
        String user = "root";
        String password = "tacademy2022";
        try {
            // Class.forName("org.mysql.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            return  con;
        }
        return con;
    }
}
