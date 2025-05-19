<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Login.css">
</head>
<body>
    <header>
        <div class="logo">
           <img src="${pageContext.request.contextPath}/Resources/4130923.jpg" alt="Logo Image">
        </div>
        <nav>
            <a href="${pageContext.request.contextPath}/Signup.jsp">Sign up</a>
            <a href="#">Sign in</a>

            <div class="menu-icon">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </nav>
    </header>    

    <div class="container">
        <div class="image-section">
            <img src="${pageContext.request.contextPath}/Resources/travelling01.jpg" alt="Travel Image">
        </div>
        <div class="form-section">
            <h2>Registration Form</h2>
            <p>Register yourself to us.</p>
         <% 
    String errorMessage = (String) request.getAttribute("errorMessage");
    String successMessage = (String) request.getAttribute("successMessage");
%>

<script>
<% if (errorMessage != null) { %>
    alert("<%= errorMessage.replaceAll("\"", "\\\\\"") %>");
<% } else if (successMessage != null) { %>
    alert("<%= successMessage.replaceAll("\"", "\\\\\"") %>");
<% } %>
</script>
         
            <form method="post" action="<%= request.getContextPath() %>/Login">
                <div class="form-row">
                    <div class="form-group">
                        <label>Username:</label>
                        <input type="text" name="username" value="${param.username}" required>
                    </div>
                    </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" name="password" required>
                    </div>
                    </div>
               <button type="submit" onclick="return validateForm()">Submit</button>
                <div class="button-p">
                    <h3>Don't have an account? <a href="<%= request.getContextPath() %>WEB-INF/Pages/Signup.jsp">Create Account </a> now!</h3>
                </div>
            </form>
        </div>
    </div>

    <footer>
        <p>@2021 Your Company</p>
    </footer>
</body>
</html>
