package com.edu.nefu.bean;

import java.sql.*;

public class ConnDatabase {
    public static final String URL = "jdbc:mysql://192.168.1.150:3306/book?serverTimezone=UTC";
    public static final String USER = "root";
    public static final String PASSWORD = "1111";
    private static Connection conn = null;

    static {
        try {
            //1.加载驱动程序
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        conn = DriverManager.getConnection(URL, USER, PASSWORD);
        return conn;
    }
}
