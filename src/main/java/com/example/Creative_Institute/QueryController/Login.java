package com.example.Creative_Institute.QueryController;

import com.example.Creative_Institute.Database.DBHandler;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String UserId = "";
        String PassWord = "";
        String ClassId = "";
        int BlockStatus = 0;
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");
        Connection con = null;
        ResultSet UserLogin = null;
        try {
            con = DBHandler.createDBConnection();

            if (request.getParameter("Username").startsWith("TREDU") || request.getParameter("Username").startsWith("tredu")) {
                if (!Username.equals("") && !Password.equals("")) {
                    try {
                        UserLogin = con.createStatement().executeQuery("SELECT * FROM student where StudentId ='" + Username + "' and Password ='" + Password + "'");

                        while (UserLogin.next()) {
                            UserId = UserLogin.getString("StudentId");
                            PassWord = UserLogin.getString("Password");
                            BlockStatus = UserLogin.getInt("BlockStatus");
                            ClassId = UserLogin.getString("ClassId");
                        }
                        if (UserId.equals(Username) && PassWord.equals(Password) && BlockStatus == 0) {
                            request.getSession().setAttribute("Student", UserId);
                            request.getSession().setAttribute("ClassId", ClassId);
                            RequestDispatcher dis = request.getRequestDispatcher("/StudentDashboard.jsp");
                            dis.forward(request, response);

                        } else if (UserId.equals(Username) && PassWord.equals(Password) && BlockStatus == 1) {
                            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                            request.setAttribute("errorMessage", "Your Account Has Been Suspended!");
                            dis.forward(request, response);

                        } else if(UserId.equals(Username) && PassWord.equals(Password) && BlockStatus == 2) {
                            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                            request.setAttribute("SuccessMessage", "Your Account is Under Review");
                            dis.forward(request, response);
                        }
                        else {
                            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                            request.setAttribute("errorMessage", "Invalid Username or Password");
                            dis.forward(request, response);
                        }

                    } catch (Exception ex) {

                        ex.printStackTrace();
                        RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                        request.setAttribute("errorMessage", "Application Error Please Contact Your Administrator!");

                        dis.forward(request, response);

                    } finally {
                        try {
                            UserLogin.close();
                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }
                    }
                } else {

                    RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                    request.setAttribute("errorMessage", "Invalid Username or Password");
                    dis.forward(request, response);

                }

            } else if (request.getParameter("Username").startsWith("TEC") || request.getParameter("Username").startsWith("tec")) {

                if (!Username.equals("") && !Password.equals("")) {
                    try {
                        UserLogin = con.createStatement().executeQuery("SELECT * FROM teacher where TeacherId ='" + Username + "' and Password ='" + Password + "'");

                        while (UserLogin.next()) {
                            UserId = UserLogin.getString("TeacherId");
                            PassWord = UserLogin.getString("Password");

                        }

                        if (UserId.equals(Username) && PassWord.equals(Password)) {
                            request.getSession().setAttribute("Teacher", UserId);
                            response.sendRedirect(request.getContextPath() + "/ManageClasses.jsp");

                        } else {
                            RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                            request.setAttribute("errorMessage", "Invalid Username or Password");
                            dis.forward(request, response);

                        }
                        
                    } catch (Exception ex) {

                        ex.printStackTrace();
                        RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                        request.setAttribute("errorMessage", "Application Error Please Contact Your Administrator!");

                        dis.forward(request, response);

                    } finally {
                        try {
                            UserLogin.close();
                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }
                    }
                } else {

                    RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                    request.setAttribute("errorMessage", "Invalid Username or Password");
                    dis.forward(request, response);

                }


            } else {
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                request.setAttribute("errorMessage", "Invalid Username or Password");
                dis.forward(request, response);
            }

            try {
                assert con != null;
                con.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                request.setAttribute("errorMessage", "Application Error Please Contact Your Administrator!");

                dis.forward(request, response);
            }
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }

    }
}

