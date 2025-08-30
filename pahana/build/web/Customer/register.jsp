<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Pahana Edu - Customer Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
    }
    /* Navbar */
    .navbar {
        width: 100%;
        background: rgba(0, 0, 0, 0.6);
        padding: 15px 10px 15px 0px ;
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 1000;
    }
    .navbar h1 {
        color: #fff;
        margin: 0;
        font-size: 22px;
    }
    .navbar ul {
        list-style: none;
        margin: 0;
        padding: 0;
        display: flex;
    }
    .navbar ul li {
        margin-left: 20px;
    }
    .navbar ul li a {
        text-decoration: none;
        color: #fff;
        font-size: 16px;
        transition: color 0.3s;
    }
    .navbar ul li a:hover {
        color: #ffd700;
    }

    .register-card {
        background: #fff;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        padding: 40px;
        width: 400px;
        color: #333;
        transition: transform 0.3s;
        margin-top: 100px; /* Push down because of navbar */
    }
    .register-card:hover {
        transform: translateY(-5px);
    }
    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #2575fc;
    }
    input, textarea {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 16px;
    }
    button {
        width: 100%;
        padding: 12px;
        margin-top: 15px;
        border: none;
        border-radius: 8px;
        background: linear-gradient(135deg, #2575fc, #6a11cb);
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s;
    }
    button:hover {
        background: linear-gradient(135deg, #6a11cb, #2575fc);
    }
    .error {
        color: red;
        font-size: 14px;
        margin-top: -5px;
    }
    .links {
        text-align: center;
        margin-top: 15px;
    }
    .links a {
        color: #2575fc;
        text-decoration: none;
        font-weight: bold;
    }
    .links a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <h1>Pahana Edu</h1>
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="booking.jsp">Reservations</a></li>
        <li><a href="profile.jsp">Profile</a></li>
        <li><a href="register.jsp">Register</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="LogoutServlet">Logout</a></li>
    </ul>
</div>

<div class="register-card">
    <h2>Customer Registration</h2>

    <!-- Form posts to RegisterServlet -->
    <form id="registerForm" action="RegisterServlet" method="post">
        <input type="text" name="name" id="name" placeholder="Full Name" required>
        <div id="nameError" class="error"></div>

        <textarea name="address" id="address" placeholder="Address" required></textarea>
        <div id="addrError" class="error"></div>

        <input type="text" name="phone" id="phone" placeholder="Phone Number" required>
        <div id="phoneError" class="error"></div>

        <input type="text" name="username" id="username" placeholder="Username" required>
        <div id="userError" class="error"></div>

        <input type="password" name="password" id="password" placeholder="Password" required>
        <div id="passError" class="error"></div>

        <input type="password" id="confirmPassword" placeholder="Confirm Password" required>
        <div id="confError" class="error"></div>

        <button type="submit">Register</button>
    </form>

    <div class="links">
        <a href="login.jsp">Already have an account? Login</a>
    </div>
</div>

<script>
document.getElementById('registerForm').addEventListener('submit', function(e) {
    let valid = true;

    const name = document.getElementById('name').value.trim();
    const address = document.getElementById('address').value.trim();
    const phone = document.getElementById('phone').value.trim();
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    const confirmPassword = document.getElementById('confirmPassword').value.trim();

    // Name validation
    if(!/^[A-Za-z ]{3,}$/.test(name)) {
        document.getElementById('nameError').innerText = "Enter a valid name (letters only).";
        valid = false;
    } else {
        document.getElementById('nameError').innerText = "";
    }

    // Address validation
    if(address.length < 5) {
        document.getElementById('addrError').innerText = "Address must be at least 5 characters.";
        valid = false;
    } else {
        document.getElementById('addrError').innerText = "";
    }

    // Phone validation
    if(!/^[0-9]{10}$/.test(phone)) {
        document.getElementById('phoneError').innerText = "Enter a valid 10-digit phone number.";
        valid = false;
    } else {
        document.getElementById('phoneError').innerText = "";
    }

    // Username validation
    if(username.length < 3) {
        document.getElementById('userError').innerText = "Username must be at least 3 characters.";
        valid = false;
    } else {
        document.getElementById('userError').innerText = "";
    }

    // Password validation
    if(!/^(?=.*[0-9]).{6,}$/.test(password)) {
        document.getElementById('passError').innerText = "Password must be at least 6 chars & include a number.";
        valid = false;
    } else {
        document.getElementById('passError').innerText = "";
    }

    // Confirm Password validation
    if(password !== confirmPassword) {
        document.getElementById('confError').innerText = "Passwords do not match.";
        valid = false;
    } else {
        document.getElementById('confError').innerText = "";
    }

    if(!valid){
        e.preventDefault(); // stop form submission if invalid
    }
});
</script>

</body>
</html>
