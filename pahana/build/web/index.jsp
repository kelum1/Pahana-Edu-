<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Pahana Edu - Welcome</title>
<style>
    body {
        margin: 0;
        font-family: 'Arial', sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: #fff;
    }
    .container {
        text-align: center;
    }
    h1 {
        font-size: 40px;
        margin-bottom: 40px;
    }
    .btn-group {
        display: flex;
        justify-content: center;
        gap: 30px;
    }
    .btn {
        padding: 20px 40px;
        border-radius: 12px;
        border: none;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        transition: transform 0.3s, background 0.3s;
    }
    .btn-admin {
        background: linear-gradient(135deg, #ff416c, #ff4b2b);
    }
    .btn-admin:hover {
        transform: translateY(-5px);
        background: linear-gradient(135deg, #ff4b2b, #ff416c);
    }
    .btn-customer {
        background: linear-gradient(135deg, #00c6ff, #0072ff);
    }
    .btn-customer:hover {
        transform: translateY(-5px);
        background: linear-gradient(135deg, #0072ff, #00c6ff);
    }
    p {
        margin-top: 30px;
        font-size: 16px;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Welcome to Pahana Edu</h1>
    <div class="btn-group">
        <button class="btn btn-admin" onclick="location.href='Admin/login.jsp'">Admin </button>
        <button class="btn btn-customer" onclick="location.href='Customer/home.jsp'">Customer </button>
    </div>
    <p>Select your role to continue.</p>
</div>

</body>
</html>
