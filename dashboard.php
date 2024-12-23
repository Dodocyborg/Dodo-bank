<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['admin_logged_in']) || !$_SESSION['admin_logged_in']) {
    // If not logged in, redirect to login page
    header("Location: Loginwebsite.html");
    exit();
}

// Display dashboard
echo "Welcome, " . $_SESSION['admin_username'] . "!";
?>


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bank_system"; // Change to your DB name

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT role_name FROM roles WHERE role_id=" . $_SESSION['role_id'];
$result = $conn->query($sql);
$row = $result->fetch_assoc();
$role = $row['role_name'];

echo "<h1>Welcome, " . $_SESSION['username'] . "</h1>";
echo "<p>Your role: " . $role . "</p>";

if ($role == 'President/Senator') {
    echo "<a href='approve.php'>Approve Requests</a>";
}

$conn->close();
?>
