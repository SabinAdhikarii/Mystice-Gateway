<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/Registration.css">
</head>
<body>
    <header>
        <div class="logo">
            <h2><b><I> Mystic GateWay</I></b></h2>
        </div>
        <nav>
            <a href="#">Sign up</a>
            <a href="${pageContext.request.contextPath}/Login">Sign in</a>
        </nav>
    </header>    

    <div class="container">
        <div class="image-section">
            <img src="${pageContext.request.contextPath}/Resources/travelling01.jpg" alt="Travel Image">
        </div>
        <div class="form-section">
            <h2>Registration Form</h2>
            <p>Register yourself to us.</p>
            <%-- Global error or success messages --%>
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                String successMessage = (String) request.getAttribute("successMessage");
                if (errorMessage != null) {
            %>
                <p class="error-message"><%= errorMessage %></p>
            <% } else if (successMessage != null) { %>
                <p class="success-message"><%= successMessage %></p>
            <% } %>

            <form method="post" action="<%= request.getContextPath() %>/Signup">
               <div class="form-row">
                    <div class="form-group">
                        <label>First Name:</label>
                        <input type="text" name="firstName" value="${param.firstName}" required>
                        <span class="error"><%= request.getAttribute("firstNameError") != null ? request.getAttribute("firstNameError") : "" %></span>
                    </div>
                    <div class="form-group">
                        <label>Last Name:</label>
                        <input type="text" name="lastName" value="${param.lastName}" required>
                        <span class="error"><%= request.getAttribute("lastNameError") != null ? request.getAttribute("lastNameError") : "" %></span>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Username:</label>
                        <input type="text" name="username" value="${param.username}" required>
                        <span class="error"><%= request.getAttribute("usernameError") != null ? request.getAttribute("usernameError") : "" %></span>
                    </div>
                    <div class="form-group">
                        <label>Birthday:</label>
                        <input type="date" name="birthday" value="${param.birthday}" required>
                        <span class="error"><%= request.getAttribute("birthdayError") != null ? request.getAttribute("birthdayError") : "" %></span>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Phone Number:</label>
                        <input type="text" name="phone" value="${param.phone}" required>
                        <span class="error"><%= request.getAttribute("phoneError") != null ? request.getAttribute("phoneError") : "" %></span>
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" name="email" value="${param.email}" required>
                        <span class="error"><%= request.getAttribute("emailError") != null ? request.getAttribute("emailError") : "" %></span>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" name="password" required>
                        <span class="error"><%= request.getAttribute("passwordError") != null ? request.getAttribute("passwordError") : "" %></span>
                    </div>
                    <div class="form-group">
                        <label>Retype Password:</label>
                        <input type="password" name="retypePassword" required>
                        <span class="error"><%= request.getAttribute("retypePasswordError") != null ? request.getAttribute("retypePasswordError") : "" %></span>
                    </div>
                </div>
                <button type="submit">Submit</button>

                <div class="button-p">
                    <h3>Already have an account? Please <a href="${pageContext.request.contextPath}/Login">Sign in</a></h3>
                </div>
            </form>
        </div>
    </div>

    <footer>
        <p>@2021 Your Company</p>
    </footer>
</body>
</html>
