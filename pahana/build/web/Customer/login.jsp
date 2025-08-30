<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Pahana Edu - Login</title>
<style>
    body {
        margin: 0;
        font-family: 'Arial', sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
    }
    .login-card {
        background: #fff;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        padding: 40px;
        width: 350px;
        text-align: center;
        color: #333;
        transition: transform 0.3s;
    }
    .login-card:hover {
        transform: translateY(-5px);
    }
    h2 {
        margin-bottom: 20px;
        color: #2575fc;
    }
    input {
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
        display: flex;
        justify-content: space-between;
        margin-top: 15px;
        font-size: 14px;
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

<div class="login-card">
    <h2>Pahana Edu Login</h2>
   <form id="loginForm" action="LoginServlet" method="post">
    <input type="text" name="username" id="username" placeholder="Username" required>
    <input type="password" name="password" id="password" placeholder="Password" required>
    <button type="submit">Login</button>
</form>

    <div class="links">
        <a href="#" id="forgot">Forgot Username / Password?</a>
        <a href="#" id="register">Register Now</a>
    </div>
</div>

<script>
document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();
    let valid = true;
    
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    
    // Username validation: only letters, min 3 chars
    if(!/^[A-Za-z]{3,}$/.test(username)) {
        document.getElementById('userError').innerText = "Username must be at least 3 letters.";
        valid = false;
    } else {
        document.getElementById('userError').innerText = "";
    }
    
    // Password validation: min 6 chars
    if(password.length < 6) {
        document.getElementById('passError').innerText = "Password must be at least 6 characters.";
        valid = false;
    } else {
        document.getElementById('passError').innerText = "";
    }
    
    if(valid) {
        alert("Login successful! Redirecting to dashboard...");
        // Redirect to dashboard or next page
        // window.location.href = "home.jsp";
    }
});

// Add alert for Register Now button
document.getElementById('register').addEventListener('click', function(e) {
    e.preventDefault();
    alert("Redirecting to registration page...");
    // window.location.href = "register.jsp";
});

// Add alert for Forgot Username / Password button
document.getElementById('forgot').addEventListener('click', function(e) {
    e.preventDefault();
    alert("Redirecting to password recovery page...");
    // window.location.href = "forgot_password.html";
});
</script>

</body>
</html>
