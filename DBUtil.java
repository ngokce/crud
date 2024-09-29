package com.example.crudapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL = "jdbc:sqlserver://<MSSQL-server-ip>:1433;databaseName=CRUDAppDB";
    private static final String USER = "your_db_user";
    private static final String PASSWORD = "your_db_password";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
