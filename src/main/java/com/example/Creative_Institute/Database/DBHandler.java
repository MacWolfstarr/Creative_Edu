package com.example.Creative_Institute.Database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHandler {

    static Connection dbconn;

    public static Connection createDBConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/creative_db", "root", "root");
            return dbconn;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }


    }


}
