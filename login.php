<?php
session_start();
$servername = "localhost";
$username = "Logankeener";
$password = Lambo2023@
$dbname = "bank_system"; // Change to your DB name

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user = $_POST['username'];
    $pass = $_POST['password'];

    $sql = "SELECT * FROM employees WHERE username='$user' AND password='$pass'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $_SESSION['user_id'] = $row['employee_id'];
        $_SESSION['role_id'] = $row['role_id'];
        header("Location: dashboard.php");
    } else {
        echo "Invalid username or password";
    }
}

$conn->close();
?>
