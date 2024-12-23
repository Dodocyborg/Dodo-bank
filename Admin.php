<?php
// Database connection setup
$servername = "localhost"; // Replace with your database server
$username = "root"; // Replace with your database username
$password = ""; // Replace with your database password
$dbname = "BankDatabase"; // Replace with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Admin credentials
$username = 'admin';
$password = 'Lambo2023@'; // Plaintext password

// Hash the password using bcrypt
$hashed_password = password_hash($password, PASSWORD_BCRYPT);

// Insert the admin record into the database
$sql = "INSERT INTO Admins (Username, PasswordHash, FullName) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$full_name = 'admin'; // Full name for the admin

// Bind the parameters and execute
$stmt->bind_param("sss", $username, $hashed_password, $full_name);
$stmt->execute();

echo "Admin inserted successfully with hashed password.";

// Close the connection
$stmt->close();
$conn->close();
?>
