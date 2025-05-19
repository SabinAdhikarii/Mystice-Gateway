package com.Mystic_Gateway.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(asyncSupported = true, urlPatterns = { "/Login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 private static final String DB_URL = "jdbc:mysql://localhost:3306/user_registration";
	    private static final String DB_USER = "root";
	    private static final String DB_PASSWORD = "";

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String username = request.getParameter("username").trim();
	        String password = request.getParameter("password").trim();

	        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
	            String sql = "SELECT password FROM registration WHERE username = ?";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, username);
	            ResultSet rs = stmt.executeQuery();

	            if (rs.next()) {
	                String storedPassword = rs.getString("password");
	                if (storedPassword.equals(password)) {
	                    request.getRequestDispatcher("/WEB-INF/Pages/Home.jsp").forward(request, response);
	                    return;
	                }
	            }

	            request.setAttribute("error", "Invalid username or password.");
	            request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            request.setAttribute("error", "Database error: " + e.getMessage());
	            request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
	        }
	    }
	}