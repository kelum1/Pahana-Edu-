package com.pahanaedu.servlets;

import com.pahanaedu.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {
            // First check admin
            String sqlAdmin = "SELECT * FROM admins WHERE username=? AND password=?";
            PreparedStatement psAdmin = con.prepareStatement(sqlAdmin);
            psAdmin.setString(1, username);
            psAdmin.setString(2, password);
            ResultSet rsAdmin = psAdmin.executeQuery();

            if (rsAdmin.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("role", "admin");
                session.setAttribute("username", username);
                response.sendRedirect("dashboard.jsp");
                return;
            }

            // Then check customer
            String sqlCust = "SELECT * FROM customers WHERE username=? AND password=?";
            PreparedStatement psCust = con.prepareStatement(sqlCust);
            psCust.setString(1, username);
            psCust.setString(2, password);
            ResultSet rsCust = psCust.executeQuery();

            if (rsCust.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("role", "customer");
                session.setAttribute("username", username);
                response.sendRedirect("home.jsp");
            } else {
                response.sendRedirect("login.jsp?msg=invalid");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?msg=error");
        }
    }
}
