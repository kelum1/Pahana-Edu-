<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Customer Management - Dark Theme</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: 'Segoe UI', sans-serif; background: #121212; color: #e0e0e0; padding: 20px; }
    h1 { margin-bottom: 20px; color: #4dabf7; }

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

    .controls { display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; flex-wrap: wrap; gap: 10px; }
    .search-box input, .filter select { padding: 10px; border-radius: 5px; border: none; outline: none; background: #1e1e1e; color: #fff; }

    .buttons button { padding: 10px 15px; border: none; border-radius: 5px; margin-left: 8px; cursor: pointer; font-weight: 600; transition: 0.3s; }
    .add-btn { background: #43a047; color: white; }
    .buttons button:hover { opacity: 0.8; }

    table { width: 100%; border-collapse: collapse; margin-top: 15px; background: #1e1e1e; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,0.6); }
    th, td { padding: 14px; text-align: left; border-bottom: 1px solid #333; }
    th { background: #2c2c2c; color: #ddd; }
    tr:hover { background: #2a2a2a; }
    td.status-active { color: #43a047; font-weight: bold; }
    td.status-inactive { color: #e53935; font-weight: bold; }
    .action-btn { padding: 5px 8px; border: none; border-radius: 5px; cursor: pointer; font-size: 14px; margin-right: 5px; }
    .edit-btn { background: #ffb300; color: black; }
    .delete-btn { background: #e53935; color: white; }

    .modal { display: none; position: fixed; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0,0,0,0.7); justify-content: center; align-items: center; }
    .modal-content { background: #1e1e1e; padding: 20px; border-radius: 10px; width: 400px; box-shadow: 0 2px 8px rgba(0,0,0,0.6); }
    .modal-content h2 { color: #4dabf7; margin-bottom: 15px; }
    .modal-content input, .modal-content select, .modal-content textarea { width: 100%; padding: 10px; margin: 8px 0; border-radius: 5px; border: none; background: #2c2c2c; color: #fff; resize: none; }
    .modal-content button { margin-top: 10px; padding: 10px; border: none; border-radius: 5px; cursor: pointer; }
    .save-btn { background: #43a047; color: white; width: 100%; }
    .close-btn { background: #e53935; color: white; margin-top: 5px; width: 100%; }
  </style>
</head>
<body>

     <!-- Top Navbar -->
  <div class="navbar">
    <h1> Customer Management</h1>
  <div>
      <a href="dashboard.jsp">Dashboard</a>
      <a href="Management.jsp">Customers</a>
      <a href="item.jsp">Items</a>
      <a href="resavation.jsp"> Resavation</a>
      <a href="billing.jsp">Billing</a>
      <a href="#">Logout</a>
    </div>
  </div>


  

  <div class="controls">
    <div class="search-box">
      <input type="text" id="search" placeholder="Search Customer...">
    </div>
    <div class="filter">
      <select id="filter">
        <option value="all">All</option>
        <option value="active">Active</option>
        <option value="inactive">Inactive</option>
      </select>
    </div>
    <div class="buttons">
      <button class="add-btn" onclick="openModal()">➕ Add</button>
    </div>
  </div>

  <table id="customerTable">
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Phone</th>
      <th>Address</th>
      <th>Status</th>
      <th>Actions</th>
    </tr>
    <tr>
      <td>1</td>
      <td>John Doe</td>
      <td>john@example.com</td>
      <td>+94 77 123 4567</td>
      <td>Colombo, Sri Lanka</td>
      <td class="status-active">Active</td>
      <td>
        <button class="action-btn edit-btn" onclick="editCustomer(this)">✏️ Edit</button>
        <button class="action-btn delete-btn" onclick="deleteCustomer(this)">🗑 Delete</button>
      </td>
    </tr>
    <tr>
      <td>2</td>
      <td>Jane Smith</td>
      <td>jane@example.com</td>
      <td>+94 71 987 6543</td>
      <td>Kandy, Sri Lanka</td>
      <td class="status-inactive">Inactive</td>
      <td>
        <button class="action-btn edit-btn" onclick="editCustomer(this)">✏️ Edit</button>
        <button class="action-btn delete-btn" onclick="deleteCustomer(this)">🗑 Delete</button>
      </td>
    </tr>
  </table>

  <div class="modal" id="customerModal">
    <div class="modal-content">
      <h2 id="modalTitle">Add Customer</h2>
      <input type="text" id="custName" placeholder="Full Name">
      <input type="email" id="custEmail" placeholder="Email">
      <input type="text" id="custPhone" placeholder="Phone Number">
      <textarea id="custAddress" placeholder="Address"></textarea>
      <select id="custStatus">
        <option value="active">Active</option>
        <option value="inactive">Inactive</option>
      </select>
      <button class="save-btn" onclick="saveCustomer()">💾 Save</button>
      <button class="close-btn" onclick="closeModal()">❌ Close</button>
    </div>
  </div>

  <script>
    let editingRow = null;

    function openModal(mode = 'add') {
      document.getElementById("customerModal").style.display = "flex";
      document.getElementById("modalTitle").innerText = mode === 'edit' ? "Edit Customer" : "Add Customer";

      if(mode === 'add') {
        editingRow = null;
        document.getElementById("custName").value = '';
        document.getElementById("custEmail").value = '';
        document.getElementById("custPhone").value = '';
        document.getElementById("custAddress").value = '';
        document.getElementById("custStatus").value = 'active';
      }
    }

    function closeModal() {
      document.getElementById("customerModal").style.display = "none";
    }

    function saveCustomer() {
      const name = document.getElementById("custName").value;
      const email = document.getElementById("custEmail").value;
      const phone = document.getElementById("custPhone").value;
      const address = document.getElementById("custAddress").value;
      const status = document.getElementById("custStatus").value;

      if(editingRow) {
        // Update existing row
        editingRow.cells[1].innerText = name;
        editingRow.cells[2].innerText = email;
        editingRow.cells[3].innerText = phone;
        editingRow.cells[4].innerText = address;
        editingRow.cells[5].innerText = status.charAt(0).toUpperCase() + status.slice(1);
        editingRow.cells[5].className = status === 'active' ? 'status-active' : 'status-inactive';
      } else {
        // Add new row
        const table = document.getElementById("customerTable");
        const row = table.insertRow();
        const id = table.rows.length - 1;
        row.innerHTML = `
          <td>${id}</td>
          <td>${name}</td>
          <td>${email}</td>
          <td>${phone}</td>
          <td>${address}</td>
          <td class="${status === 'active' ? 'status-active' : 'status-inactive'}">${status.charAt(0).toUpperCase() + status.slice(1)}</td>
          <td>
            <button class="action-btn edit-btn" onclick="editCustomer(this)">✏️ Edit</button>
            <button class="action-btn delete-btn" onclick="deleteCustomer(this)">🗑 Delete</button>
          </td>
        `;
      }

      closeModal();
    }

    function editCustomer(button) {
      editingRow = button.parentElement.parentElement;
      document.getElementById("custName").value = editingRow.cells[1].innerText;
      document.getElementById("custEmail").value = editingRow.cells[2].innerText;
      document.getElementById("custPhone").value = editingRow.cells[3].innerText;
      document.getElementById("custAddress").value = editingRow.cells[4].innerText;
      document.getElementById("custStatus").value = editingRow.cells[5].innerText.toLowerCase();
      openModal('edit');
    }

    function deleteCustomer(button) {
      if(confirm("Are you sure you want to delete this customer?")) {
        const row = button.parentElement.parentElement;
        row.remove();
      }
    }
  </script>
</body>
</html>
