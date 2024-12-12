<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bank_system"; // Change to your DB name

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $approval_id = $_POST['approval_id'];
    $approval_status = $_POST['approval_status'];

    $sql = "UPDATE approvals SET approval_status='$approval_status', approved_by=" . $_SESSION['user_id'] . " WHERE approval_id=$approval_id";
    if ($conn->query($sql) === TRUE) {
        echo "Request $approval_status successfully.";
    } else {
        echo "Error updating record: " . $conn->error;
    }
}

$sql = "SELECT * FROM approvals WHERE approval_status='Pending'";
$result = $conn->query($sql);

echo "<h1>Pending Requests</h1>";
echo "<form method='POST'>";
while ($row = $result->fetch_assoc()) {
    echo "<p>Request Type: " . $row['request_type'] . " | Requested by: " . $row['requested_by'] . "</p>";
    echo "<input type='hidden' name='approval_id' value='" . $row['approval_id'] . "'>";
    echo "<select name='approval_status'>
            <option value='Approved'>Approve</option>
            <option value='Rejected'>Reject</option>
          </select>";
    echo "<button type='submit'>Submit</button>";
}
echo "</form>";

$conn->close();
?>
