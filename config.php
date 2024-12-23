<?php
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
?>
