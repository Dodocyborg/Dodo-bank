CREATE TABLE Admins (
    AdminId INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50),
    PasswordHash VARCHAR(255),<nav>
    <ul>
        <li><a href="Index.html">Home</a></li>
        <li><a href="Login.html">Login</a></li>
        <li><a href="AdminDashboard.html">Admin Dashboard</a></li>
        <li><a href="account-opening.html">Open Account</a></li>
        <li><a href="loan-services.html">Loan Services</a></li>
        <li><a href="dashboard.php">User Dashboard</a></li>
    </ul>
</nav>

    FullName VARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Insert sample admin credentials (remember to hash passwords in a production environment)
INSERT INTO Admins (Username, PasswordHash, FullName)
VALUES ('Logankeener', 'Lambo2023@', 'admin'), 
       ('Kenzo', 'Lambo2023@', 'admin');CREATE DATABASE DodoBank;

USE DodoBank;
<nav>
    <ul>
        <li><a href="Index.html">Home</a></li>
        <li><a href="Login.html">Login</a></li>
        <li><a href="AdminDashboard.html">Admin Dashboard</a></li>
        <li><a href="account-opening.html">Open Account</a></li>
        <li><a href="loan-services.html">Loan Services</a></li>
        <li><a href="dashboard.php">User Dashboard</a></li>
    </ul>
</nav>

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    fax_number VARCHAR(20)
);

CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_type ENUM('deposit', 'withdrawal') NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

