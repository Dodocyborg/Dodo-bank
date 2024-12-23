<?php<?php
$host = 'localhost'; // Change this if you're using a remote database
$dbname = 'DodoBank';
$username = 'admin';
$password = 'Lambo2023@'; // Use a strong password

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected to the database successfully!";
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>

$host = 'localhost';
$dbname = 'DodoBank';
$username = 'admin';
$password = 'Lambo2023@'; // Use a strong password

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dodo Bank</title>
</head>
<body>
    <h1>Welcome to Dodo Bank</h1>
    <div id="env-details"></div>

    <script>
        // Fetch environment variables from backend
        fetch('api/config.php')
            .then(response => response.json())
            .then(data => {
                // Display the Plaid environment (non-sensitive)
                document.getElementById('env-details').innerText = `Plaid Environment: ${data.PLAID_ENV}`;
            })
            .catch(error => console.error('Error loading environment variables:', error));
    </script>
</body>
</html>

