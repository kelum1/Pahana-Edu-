<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Pahana Edu - Book Reservation</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #6a11cb, #2575fc); /* Blue gradient */
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 30px;
    }

     /* Navbar */
    .navbar {
        width: 100%;
        background: rgba(0, 0, 0, 0.7);
        padding: 15px 0px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: fixed;
        top: 0;
        left: 0;
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

    .reservation-card {
        background: #fff;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        padding: 40px;
        width: 450px;
        transition: transform 0.3s ease;
    }
    .reservation-card:hover {
        transform: translateY(-5px);
    }
    h2 {
        margin-bottom: 20px;
        text-align: center;
        color: #5b86e5;
    }
    label {
        font-weight: bold;
        display: block;
        margin-top: 10px;
        color: #333;
    }
    input, select {
        width: 100%;
        padding: 12px;
        margin: 6px 0 15px 0;
        border-radius: 10px;
        border: 1px solid #ccc;
        font-size: 15px;
    }
    .btn {
        width: 100%;
        padding: 12px;
        margin-top: 15px;
        border: none;
        border-radius: 10px;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }
    .btn:hover {
        background: linear-gradient(135deg, #6a11cb, #2575fc);
    }
    .links {
        margin-top: 15px;
        text-align: center;
    }
    .links a {
        color: #5b86e5;
        text-decoration: none;
        font-weight: bold;
    }
    .links a:hover {
        text-decoration: underline;
    }
    .error {
        font-size: 14px;
        color: red;
        margin-top: -10px;
        margin-bottom: 10px;
    }
</style>
</head>
<body>

    <!-- Navbar -->
<div class="navbar">
    <h1>Pahana Edu</h1>
    <ul>
        <li><a href="home.jsp">home</a></li>
        <li><a href="booking.jsp">Reservations</a></li>
        <li><a href="profile.jsp">Profile</a></li>
        <li><a href="register.jsp">Register</a></li>
        <li><a href="login.jsp">login</a></li>
        <li><a href="#">Logout..</a></li>
    </ul>
</div>


<div class="reservation-card">
    <h2>Book Reservation</h2>
    <form id="reservationForm">
        <label>Full Name</label>
        <input type="text" id="name" required>
        <div id="nameError" class="error"></div>

        <label>Email</label>
        <input type="email" id="email" required>
        <div id="emailError" class="error"></div>

        <label>Phone</label>
        <input type="text" id="phone" required>
        <div id="phoneError" class="error"></div>

        <label>Book Title</label>
        <select id="bookTitle" required>
            <option value="">-- Select a Book --</option>
            <option>Introduction to Artificial Intelligence</option>
            <option>Advanced Java Programming</option>
            <option>Data Science Essentials</option>
            <option>Modern Web Development</option>
            <option>Business Management Basics</option>
        </select>
        <div id="bookError" class="error"></div>

        <label>Reservation Date</label>
        <input type="date" id="resDate" required>
        <div id="dateError" class="error"></div>

        <button type="submit" class="btn">Reserve Book</button>
    </form>

    <div class="links">
        <a href="customer_dashboard.html">← Back to Dashboard</a>
    </div>
</div>

<script>
document.getElementById('reservationForm').addEventListener('submit', function(e) {
    e.preventDefault();
    let valid = true;

    const name = document.getElementById('name').value.trim();
    const email = document.getElementById('email').value.trim();
    const phone = document.getElementById('phone').value.trim();
    const bookTitle = document.getElementById('bookTitle').value;
    const resDate = document.getElementById('resDate').value;

    // Name validation
    if(!/^[A-Za-z ]{3,}$/.test(name)) {
        document.getElementById('nameError').innerText = "Enter a valid name.";
        valid = false;
    } else document.getElementById('nameError').innerText = "";

    // Email validation
    if(!/^[^ ]+@[^ ]+\.[a-z]{2,3}$/.test(email)) {
        document.getElementById('emailError').innerText = "Enter a valid email.";
        valid = false;
    } else document.getElementById('emailError').innerText = "";

    // Phone validation
    if(!/^[0-9]{10}$/.test(phone)) {
        document.getElementById('phoneError').innerText = "Enter a valid 10-digit phone number.";
        valid = false;
    } else document.getElementById('phoneError').innerText = "";

    // Book validation
    if(bookTitle === "") {
        document.getElementById('bookError').innerText = "Please select a book.";
        valid = false;
    } else document.getElementById('bookError').innerText = "";

    // Date validation
    if(resDate === "") {
        document.getElementById('dateError').innerText = "Please select a date.";
        valid = false;
    } else document.getElementById('dateError').innerText = "";

    if(valid) {
        alert("Book reserved successfully!");
        // Save reservation in DB here
    }
});
</script>

</body>
</html>
