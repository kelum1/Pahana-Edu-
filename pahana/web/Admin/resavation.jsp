<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin - Book Reservations</title>
  <style>
    body {
      background: #121212;
      font-family: Arial, sans-serif;
      color: #eee;
      padding: 20px;
    }

    /* Top Navbar */
    .navbar {
      background: #1e1e1e;
      color: white;
      padding: 15px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-bottom: 1px solid #333;
    }
    .navbar h1 { font-size: 22px; color: #4dabf7; }
    .navbar a {
      margin-left: 20px;
      text-decoration: none;
      color: #bbb;
      font-weight: 500;
      transition: 0.3s;
    }
    .navbar a:hover { color: #4dabf7; }
    h1 {
      text-align: center;
      color: #fdd835;
      margin-bottom: 20px;
    }
    .form-container {
      
      background: #1e1e1e;
      padding: 20px;
      border-radius: 10px;
      max-width: 500px;
      margin: auto;
      box-shadow: 0 3px 10px rgba(0,0,0,0.6);
    }
    label {
      display: block;
      margin: 10px 0 5px;
      font-weight: bold;
    }
    input {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: none;
      border-radius: 5px;
      background: #2c2c2c;
      color: #fff;
    }
    button {
      padding: 8px 14px;
      border: none;
      border-radius: 6px;
      font-size: 14px;
      cursor: pointer;
      transition: 0.3s;
      font-weight: bold;
    }
    button:hover {
      opacity: 0.85;
    }
    .reservation-list {
      margin-top: 30px;
      background: #1e1e1e;
      padding: 20px;
      border-radius: 10px;
      max-width: 900px;
      margin: 30px auto;
      box-shadow: 0 3px 10px rgba(0,0,0,0.6);
    }
    table {
      width: 100%;
      border-collapse: collapse;
      color: #ddd;
    }
    th, td {
      padding: 12px;
      border-bottom: 1px solid #333;
      text-align: center;
    }
    th {
      background: #2c2c2c;
    }
    tr:hover {
      background: #2a2a2a;
    }

    /* Status Badges */
    .badge {
      padding: 6px 14px;
      border-radius: 20px;
      font-size: 13px;
      font-weight: bold;
      color: white;
      display: inline-block;
      text-shadow: 0 0 5px rgba(0,0,0,0.6);
    }
    .pending { background: linear-gradient(135deg, #ff9800, #ffb74d); box-shadow: 0 0 10px rgba(255,152,0,0.8);}
    .confirmed { background: linear-gradient(135deg, #2196f3, #64b5f6); box-shadow: 0 0 10px rgba(33,150,243,0.8);}
    .collected { background: linear-gradient(135deg, #4caf50, #81c784); box-shadow: 0 0 10px rgba(76,175,80,0.8);}
    .cancelled { background: linear-gradient(135deg, #e53935, #ef5350); box-shadow: 0 0 10px rgba(229,57,53,0.8);}

    .delete-btn { background: #e53935; color: white; }
    .edit-btn { background: #fbc02d; color: black; }
    .status-btn { background: #3949ab; color: white; }
  </style>
</head>
<body>

  <!-- Top Navbar -->
  <div class="navbar">
    <h1> Manage Reservations</h1>
    <div>
      <a href="dashboard.html">Dashboard</a>
      <a href="Management.html">Customers</a>
      <a href="item.html">Items</a>
      <a href="resavation.html">Resavation</a>
      <a href="billing.html">Billing</a>
      <a href="#">Logout</a>
    </div>
  </div>


  

  <!-- Reservation Form -->
  <div class="form-container">
    <label>Customer Name:</label>
    <input type="text" id="custName" placeholder="Enter Customer Name">

    <label>Phone Number:</label>
    <input type="text" id="custPhone" placeholder="Enter Phone Number">

    <label>Book Name:</label>
    <input type="text" id="bookName" placeholder="Enter Book Name">

    <label>Reservation Date:</label>
    <input type="date" id="resDate">

    <button style="width:100%; background:#43a047; color:white;" onclick="addReservation()">Add Reservation</button>
  </div>

  <!-- Reservation List -->
  <div class="reservation-list">
    <h2>📋 Reserved Books (Admin View)</h2>
    <table id="reservationTable">
      <tr>
        <th>ID</th>
        <th>Customer</th>
        <th>Phone</th>
        <th>Book</th>
        <th>Date</th>
        <th>Status</th>
        <th>Actions</th>
      </tr>
    </table>
  </div>

  <script>
    let resCount = 0;
    const statuses = ["Pending", "Confirmed", "Collected", "Cancelled"];
    const statusClasses = ["pending", "confirmed", "collected", "cancelled"];

    function addReservation() {
      const name = document.getElementById("custName").value;
      const phone = document.getElementById("custPhone").value;
      const book = document.getElementById("bookName").value;
      const date = document.getElementById("resDate").value;

      if(!name || !phone || !book || !date){
        alert("Please fill all fields!");
        return;
      }

      resCount++;
      const table = document.getElementById("reservationTable");
      const row = table.insertRow();

      row.innerHTML = `
        <td>${resCount}</td>
        <td>${name}</td>
        <td>${phone}</td>
        <td>${book}</td>
        <td>${date}</td>
        <td><span class="badge pending">Pending</span></td>
        <td>
          <button class="status-btn" onclick="changeStatus(this)">Change Status</button>
          <button class="edit-btn" onclick="editReservation(this)">Edit</button>
          <button class="delete-btn" onclick="deleteReservation(this)">Delete</button>
        </td>
      `;

      // Clear inputs
      document.getElementById("custName").value = '';
      document.getElementById("custPhone").value = '';
      document.getElementById("bookName").value = '';
      document.getElementById("resDate").value = '';
    }

    function deleteReservation(btn) {
      const row = btn.parentElement.parentElement;
      row.remove();
    }

    function editReservation(btn) {
      const row = btn.parentElement.parentElement;
      const cells = row.getElementsByTagName("td");
      document.getElementById("custName").value = cells[1].innerText;
      document.getElementById("custPhone").value = cells[2].innerText;
      document.getElementById("bookName").value = cells[3].innerText;
      document.getElementById("resDate").value = cells[4].innerText;
      row.remove();
    }

    function changeStatus(btn) {
      const row = btn.parentElement.parentElement;
      const statusCell = row.cells[5].querySelector(".badge");
      let currentStatus = statusCell.innerText;
      let index = statuses.indexOf(currentStatus);
      let nextIndex = (index + 1) % statuses.length;
      statusCell.innerText = statuses[nextIndex];
      statusCell.className = "badge " + statusClasses[nextIndex];
    }
  </script>

</body>
</html>
