<?php
// Database connection
$conn = new mysqli("localhost", "root", "", "dodo_bank");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}<?php
// Running the Python script from PHP
$output = shell_exec('python3 Websiteintegration.py');<?php
// Database connection
$servername = "localhost";
$username = "admin";
$password = "Lambo2023@",
$dbname = "dodo_bank";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>

echo $output; // Display output from Python script
?>


// Fetch data from the database
$sql = "SELECT * FROM transactions";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output each row
    while ($row = $result->fetch_assoc()) {
        echo "Transaction ID: " . $row["transaction_id"] . "<br>";
        echo "Amount: " . $row["amount"] . "<br>";
    }
} else {
    echo "No transactions found.";
}

$conn->close();
?>
