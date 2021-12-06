package com.example.Creative_Institute.QueryController;

import com.example.Creative_Institute.Database.DBHandler;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "StudentCredentials", value = "/StudentCredentials")
public class StudentCredentials extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection connection = null;

        try {
            connection = DBHandler.createDBConnection();

            String RePassword = request.getParameter("RePassword");
            String Password = request.getParameter("Password");
            String StudentId = request.getParameter("StudentId");

            if(!RePassword.equals(Password)){
                request.setAttribute( "StudentId",StudentId);
                request.setAttribute( "ErrorMessage","Your Passwords Doesn't Match");
                RequestDispatcher dis = request.getRequestDispatcher("/RegisterSuccess.jsp");
                dis.forward(request,response);
            }else{
                try{
                   int  resultset = connection.createStatement().executeUpdate("UPDATE student SET Password = '"+Password+"' WHERE StudentId = '"+StudentId+"'");
                    if(resultset>0){
                        request.setAttribute( "SuccessMessage","You Have Successfully Registered! Please Login Now");
                        RequestDispatcher dis = request.getRequestDispatcher("/login.jsp");
                        dis.forward(request,response);
                    }
                }catch (Exception Ex){

                    Ex.printStackTrace();
                    RequestDispatcher dis = request.getRequestDispatcher("/RegisterSuccess.jsp");
                    dis.forward(request,response);
                }
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




    }
}
