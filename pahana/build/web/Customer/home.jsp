<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Pahana Edu - Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #f9f9f9;
        color: #333;
    }

    /* Navbar */
    .navbar {
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 40px;
        position: sticky;
        top: 0;
        z-index: 1000;
    }
    .navbar h1 {
        color: #fff;
        margin: 0;
    }
    .nav-links {
        list-style: none;
        display: flex;
        gap: 20px;
    }
    .nav-links li {
        display: inline;
    }
    .nav-links a {
        color: #fff;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s;
    }
    .nav-links a:hover {
        color: #ffcc00;
    }

    /* Hero Section */
    .hero {
        text-align: center;
        padding: 80px 20px;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: #fff;
    }
    .hero h2 {
        font-size: 42px;
        margin-bottom: 15px;
    }
    .hero p {
        font-size: 18px;
        margin-bottom: 25px;
    }
    .btn {
        padding: 12px 24px;
        background: #ffcc00;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }
    .btn:hover {
        background: #e6b800;
    }

    /* Features Section */
    .features {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
        padding: 50px 40px;
        text-align: center;
    }
    .card {
        background: #fff;
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        transition: transform 0.3s;
    }
    .card:hover {
        transform: translateY(-8px);
    }
    .card h3 {
        color: #2575fc;
    }

    /* Footer */
    footer {
        text-align: center;
        padding: 20px;
        background: #222;
        color: #fff;
        margin-top: 30px;
    }
</style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <h1>Pahana Edu</h1>
    <ul class="nav-links">
        <li><a href="home.jsp">Home</a></li>
        <li><a href="profile.jsp">Profile</a></li>
        <li><a href="booking.jsp">Book Reservations</a></li>
        <li><a href="register.jsp">Register</a></li>
        <li><a href="login.jsp">login</a></li>
        <li><a href="#">Logout</a></li>
    </ul>
</div>

<!-- Hero -->
<div class="hero">
    <h2>Welcome to Pahana Edu</h2>
    <p>Your trusted educational bookstore in Colombo City</p>
    <button class="btn" onclick="window.location.href='booking.html'">Reserve a Book</button>
</div>

<!-- Features -->
<div class="features">
    <div class="card">
        <h3>Wide Collection</h3>
        <p>We provide textbooks, novels, and academic resources for all ages.</p>
    </div>
    <div class="card">
        <h3>Easy Reservations</h3>
        <p>Reserve your books online and collect them at your convenience.</p>
    </div>
    <div class="card">
        <h3>Customer Dashboard</h3>
        <p>Manage your profile, view reservations, and track your history.</p>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 Pahana Edu. All Rights Reserved.</p>
</footer>

</body>
</html>
