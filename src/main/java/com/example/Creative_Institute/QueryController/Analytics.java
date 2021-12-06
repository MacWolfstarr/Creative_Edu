package com.example.Creative_Institute.QueryController;

import com.example.Creative_Institute.Database.DBHandler;
import com.example.Creative_Institute.Model.ApexChart;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Analytics {

    public static int GetAllStudent() {

        int StudentCount = 0;


        Connection connection = null;

        try {
            connection = DBHandler.createDBConnection();
            try {
                ResultSet resultSet = connection.createStatement().executeQuery("SELECT COUNT(*) AS Count FROM student WHERE BlockStatus ='0' ");
                while (resultSet.next()) {
                    StudentCount = Integer.parseInt(resultSet.getString("Count"));
                }
            } catch (Exception Ex) {

                Ex.printStackTrace();

            }
        } finally {
            if (connection != null) {
                try {

                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }

        return StudentCount;
    }

    public static int GetAllClasses() throws SQLException {
        int ClassCount = 0;
        Connection connection = null;
        ResultSet resultSet = null;
        try {
            connection = DBHandler.createDBConnection();
            try {
                 resultSet = connection.createStatement().executeQuery("SELECT COUNT(*) AS Count FROM class");
                while (resultSet.next()) {
                    ClassCount = Integer.parseInt(resultSet.getString("Count"));
                }
            } catch (Exception Ex) {
                Ex.printStackTrace();
            }finally {
                resultSet.close();
            }
        } finally {
            if (connection != null) {
                try {

                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }

        return ClassCount;
    }

    public static int[] GetPaidStudents() throws SQLException {

        int[] PaidStatus = new int[2];

        Connection connection = null;

        try {
            connection = DBHandler.createDBConnection();
            ResultSet resultSet = null;
            try {
                resultSet = connection.createStatement().executeQuery("SELECT COUNT(*) AS Count FROM class_has_student WHERE PaidStatus =1");
                while (resultSet.next()) {
                    PaidStatus[0] = Integer.parseInt(resultSet.getString("Count"));
                }
            } catch (Exception Ex) {

                Ex.printStackTrace();

            } finally {
                resultSet.close();
            }

            try {
                resultSet = connection.createStatement().executeQuery("SELECT COUNT(*) AS Count FROM class_has_student WHERE PaidStatus =0");
                while (resultSet.next()) {
                    PaidStatus[1] = Integer.parseInt(resultSet.getString("Count"));
                }
            } catch (Exception Ex) {

                Ex.printStackTrace();

            } finally {
                resultSet.close();
            }

        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }

        return PaidStatus;
    }

    public static int[] StudentGenderCount() throws SQLException {
        int[] Gender = new int[2];
        Connection connection = null;
        ResultSet resultSet = null;
        try {
            connection = DBHandler.createDBConnection();
            try {
                resultSet = connection.createStatement().executeQuery("SELECT COUNT(*) as Count FROM student WHERE Gender = 'Male'");
                while (resultSet.next()) {
                    Gender[0] = resultSet.getInt("Count");
                }
            } catch (Exception Ex) {
                Ex.printStackTrace();
            } finally {
                resultSet.close();
            }

            try {
                resultSet = connection.createStatement().executeQuery("SELECT COUNT(*) as Count FROM student WHERE Gender = 'Female'");
                while (resultSet.next()) {
                    Gender[1] = resultSet.getInt("Count");
                }
            } catch (Exception Ex) {
                Ex.printStackTrace();
            } finally {
                resultSet.close();
            }
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        return Gender;
    }


    public static ArrayList<ApexChart> RegisteredStudentsDaily() {

        ArrayList<ApexChart> ChartData = new ArrayList<>();

        Connection connection = null;
        try {
            connection = DBHandler.createDBConnection();
            try {
                ResultSet resultSet = connection.createStatement().executeQuery("SELECT COUNT(*) AS COUNT,CAST(DATETIME AS DATE) AS DATE FROM `student` GROUP BY CAST(DATETIME AS DATE) DESC LIMIT 11");
                while (resultSet.next()) {

                    ApexChart apexChart = new ApexChart(resultSet.getString("Date"), resultSet.getInt("Count"));
                    ChartData.add(apexChart);
                }

            } catch (Exception Ex) {
                Ex.printStackTrace();
            }
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }


        return ChartData;
    }
}
