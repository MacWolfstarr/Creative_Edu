package com.example.Creative_Institute.QueryController;

import com.example.Creative_Institute.Database.DBHandler;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Student {
    public static int[] GetStudentData(String StudentId) {
        int[] Count = new int[3];
        Connection connection = null;
        ResultSet resultSet = null;
        try {
            connection = DBHandler.createDBConnection();
            try {
                resultSet = connection.createStatement().executeQuery("SELECT COUNT(*) AS Count FROM class_has_student WHERE StudentId= '"+StudentId+"'");
                while (resultSet.next()) {
                    Count[0] = resultSet.getInt("Count");
                }
            } catch (Exception Ex) {
                Ex.printStackTrace();
            } finally {
                if (resultSet != null) {
                    try {
                        resultSet.close();
                    } catch (SQLException throwable) {
                        throwable.printStackTrace();
                    }
                }
            }
        } catch (Exception Ex) {
            Ex.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }


        try {
            connection = DBHandler.createDBConnection();
            try {
                resultSet = connection.createStatement().executeQuery("SELECT COUNT(*) AS Count FROM class_has_student WHERE StudentId= '"+StudentId+"' AND PaidStatus = '0'");
                while (resultSet.next()) {
                    Count[1] = resultSet.getInt("Count");
                }
            } catch (Exception Ex) {
                Ex.printStackTrace();
            } finally {
                if (resultSet != null) {
                    try {
                        resultSet.close();
                    } catch (SQLException throwable) {
                        throwable.printStackTrace();
                    }
                }
            }
        } catch (Exception Ex) {
            Ex.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }

        try {
            connection = DBHandler.createDBConnection();
            try {
                resultSet = connection.createStatement().executeQuery("SELECT COUNT(*) AS Count FROM class_has_student WHERE StudentId= '"+StudentId+"' AND PaidStatus = '1'");
                while (resultSet.next()) {
                    Count[2] = resultSet.getInt("Count");
                }
            } catch (Exception Ex) {
                Ex.printStackTrace();
            } finally {
                if (resultSet != null) {
                    try {
                        resultSet.close();
                    } catch (SQLException throwable) {
                        throwable.printStackTrace();
                    }
                }
            }
        } catch (Exception Ex) {
            Ex.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        return Count;
    }

}
