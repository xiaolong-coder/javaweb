package com.edu.nefu.bean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Book {
    private String isbn;
    private String title;
    private String author;
    private String publisher;
    private int year;
    private double price;
    private String classify;
    private int num;

    private List<Book> books;

    public int addBook(Book b) throws SQLException {
        //获取连接
        Connection conn = ConnDatabase.getConnection();
        //sql
        String sql = "INSERT INTO book (isbn,title,author,publisher,year,price,classify,num) VALUES (?,?,?,?,?,?,?,?)";
        //预编译
        PreparedStatement ptmt = conn.prepareStatement(sql); //预编译SQL，减少sql执行

        //传参
        ptmt.setString(1, b.getIsbn());
        ptmt.setString(2, b.getTitle());
        ptmt.setString(3, b.getAuthor());
        ptmt.setString(4, b.getPublisher());
        ptmt.setInt(5, b.getYear());
        ptmt.setDouble(6, b.getPrice());
        ptmt.setString(7, b.getClassify());
        ptmt.setInt(8, b.getNum());

        //执行
        int n = ptmt.executeUpdate();

        ptmt.close();
        conn.close();

        return n;
    }

    public List<Book> queryBook() throws SQLException {
        Connection conn = ConnDatabase.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM book");

        List<Book> bs = new ArrayList<>();
        Book b;
        while (rs.next()) {
            b = new Book();
            b.setIsbn(rs.getString("isbn"));
            b.setTitle(rs.getString("title"));
            b.setAuthor(rs.getString("author"));
            b.setPublisher(rs.getString("publisher"));
            b.setYear(rs.getInt("year"));
            b.setPrice(rs.getDouble("price"));
            b.setClassify(rs.getString("classify"));
            b.setNum(rs.getInt("num"));
            bs.add(b);
        }

        rs.close();
        stmt.close();
        conn.close();

        return bs;
    }

    public int delBook(Book b) throws SQLException {
        //获取连接
        Connection conn = ConnDatabase.getConnection();
        //sql, 每行加空格
        String sql = "DELETE FROM book WHERE isbn = ? OR title = ? OR author = ? OR publisher = ? OR year = ? OR price = ? OR classify = ? OR num = ?";
        //预编译SQL，减少sql执行
        PreparedStatement ptmt = conn.prepareStatement(sql);

        //传参
        ptmt.setString(1, b.getIsbn());
        ptmt.setString(2, b.getTitle());
        ptmt.setString(3, b.getAuthor());
        ptmt.setString(4, b.getPublisher());
        ptmt.setInt(5, b.getYear());
        ptmt.setDouble(6, b.getPrice());
        ptmt.setString(7, b.getClassify());
        ptmt.setInt(8, b.getNum());

        //执行
        int n = ptmt.executeUpdate();

        ptmt.close();
        conn.close();

        return n;
    }

    public int insert() throws SQLException {
        return addBook(this);
    }

    public boolean query() throws SQLException {
        this.setBooks(queryBook());
        return this.books != null;
    }

    public int delete() throws SQLException {
        return delBook(this);
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }
}
