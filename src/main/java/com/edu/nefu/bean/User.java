package com.edu.nefu.bean;

import java.sql.*;

public class User {
    private String un;
    private String pw;
    private String sex;
    private int age;
    private String home;
    private double grade;

    public User() {
    }

    public User(String un, String pw) {
        this.un = un;
        this.pw = pw;
    }

    public User(String un, String pw, String sex, int age, String home, double grade) {
        this.un = un;
        this.pw = pw;
        this.sex = sex;
        this.age = age;
        this.home = home;
        this.grade = grade;
    }

    public int addUser(User u) throws SQLException {
        //获取连接
        Connection conn = ConnDatabase.getConnection();
        //sql
        String sql = "INSERT INTO user (un, pw, sex, age, home, grade) VALUES (?,?,?,?,?,?)";
        //预编译
        PreparedStatement ptmt = conn.prepareStatement(sql); //预编译SQL，减少sql执行

        System.out.println(u.getUn());
        //传参
        ptmt.setString(1, u.getUn());
        ptmt.setString(2, u.getPw());
        ptmt.setString(3, u.getSex());
        ptmt.setInt(4, u.getAge());
        ptmt.setString(5, u.getHome());
        ptmt.setDouble(6, u.getGrade());

        //执行
        int n = ptmt.executeUpdate();

        ptmt.close();
        conn.close();

        return n;
    }

    public boolean query(User u) throws SQLException {
        Connection conn = ConnDatabase.getConnection();
        String sql = "SELECT * FROM user WHERE un = ? AND pw = ?";
        PreparedStatement ptmt = conn.prepareStatement(sql); //预编译SQL，减少sql执行

        ptmt.setString(1, u.getUn());
        ptmt.setString(2, u.getPw());

        ResultSet rs = ptmt.executeQuery();

        boolean rsflag = rs.next();

        rs.close();
        ptmt.close();
        conn.close();

        return rsflag;
    }

    public void get() throws SQLException {
        //获取连接
        Connection conn = ConnDatabase.getConnection();
        //sql, 每行加空格
        String sql = "SELECT * FROM user WHERE un = ?";
        //预编译SQL，减少sql执行
        PreparedStatement ptmt = conn.prepareStatement(sql);
        //传参
        ptmt.setString(1, this.getUn());
        //执行
        ResultSet rs = ptmt.executeQuery();
        while (rs.next()) {
            this.setPw(rs.getString("pw"));
            this.setSex(rs.getString("sex"));
            this.setAge(rs.getInt("age"));
            this.setHome(rs.getString("home"));
            this.setGrade(rs.getDouble("grade"));
        }
    }

    public boolean login() {
        boolean flag;
        try {
            flag = query(this);
            if (flag)
                this.get();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return flag;
    }

    public int register() {
        int flag;
        try {
            flag = addUser(this);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return flag;
    }

    public String getUn() {
        return un;
    }

    public void setUn(String un) {
        this.un = un;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getHome() {
        return home;
    }

    public void setHome(String home) {
        this.home = home;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }
}
