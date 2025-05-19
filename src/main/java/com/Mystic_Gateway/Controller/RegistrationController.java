package com.Mystic_Gateway.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.regex.Pattern;

import com.Mystic_Gateway.Config.DBConfig;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/Signup" })
public class RegistrationController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName").trim();
        String lastName = request.getParameter("lastName").trim();
        String username = request.getParameter("username").trim();
        String birthday = request.getParameter("birthday").trim();
        String phone = request.getParameter("phone").trim();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();
        String retypePassword = request.getParameter("retypePassword").trim();

        // Basic Validations
        if (!isValidName(firstName) || !isValidName(lastName)) {
            request.setAttribute("errorMessage", "Invalid name format.");
            request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
            return;
        }

        if (username.length() <= 6 || !username.matches("[a-zA-Z0-9]+")) {
            request.setAttribute("errorMessage", "Invalid username.");
            request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
            return;
        }

        try {
            LocalDate birthDate = LocalDate.parse(birthday);
            if (birthDate.isAfter(LocalDate.now())) {
                request.setAttribute("errorMessage", "Birthdate is in the future.");
                request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
                return;
            }
        } catch (DateTimeParseException e) {
            request.setAttribute("errorMessage", "Invalid birthdate format.");
            request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
            return;
        }

        if (!phone.startsWith("+") || phone.length() != 14) {
            request.setAttribute("errorMessage", "Invalid phone number format.");
            request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
            return;
        }
        
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            request.setAttribute("emailError", "Invalid email format.");
            request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
            return;
            }
    

        if (!isValidPassword(password)) {
            request.setAttribute("errorMessage", "Password does not meet complexity requirements.");
            request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
            return;
        }

        if (!password.equals(retypePassword)) {
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
            return;
        }

        // Insert into database using DBConfig
        try (Connection conn = DBConfig.getDbConnection()) {
            String query = "INSERT INTO registration (first_name, last_name, username, birthday, phone, email, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, username);
            stmt.setString(4, birthday);
            stmt.setString(5, phone);
            stmt.setString(6, email);
            stmt.setString(7, hashedPassword);


            int result = stmt.executeUpdate();

            if (result > 0) {
                request.setAttribute("successMessage", "Registration successful!");
                request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Failed to register user.");
                request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException e) {
            // Handle the case where JDBC driver is not found
            e.printStackTrace();
            request.setAttribute("errorMessage", "JDBC Driver not found: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
        } catch (SQLException e) {
            // Handle SQLExceptions
            e.printStackTrace();
            String errorMessage = e.getMessage();

            if (errorMessage.contains("Duplicate entry") && errorMessage.contains("username")) {
                request.setAttribute("usernameError", "Username already exists.");
            } else if (errorMessage.contains("Duplicate entry") && errorMessage.contains("email")) {
                request.setAttribute("emailError", "Email already exists.");
            } else if (errorMessage.contains("Duplicate entry") && errorMessage.contains("phone")) {
                request.setAttribute("phoneError", "Phone number already exists.");
            } else {
                request.setAttribute("errorMessage", "Database error: " + errorMessage);
            }

            request.getRequestDispatcher("/WEB-INF/Pages/Registration.jsp").forward(request, response);
        }
    }

    private boolean isValidName(String name) {
        return Pattern.matches("^[a-zA-Z]+$", name);
    }

    private boolean isValidPassword(String password) {
        return password.length() > 6 &&
                password.matches(".*[A-Z].*") &&
                password.matches(".*[0-9].*") &&
                password.matches(".*[!@#$%^&*(),.?\":{}|<>].*");
    }
}
