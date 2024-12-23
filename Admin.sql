-- BankDatabaseSetup.sql

-- Creating the Transactions tableINSERT INTO Users (username, password) VALUES 
('admin', '$2b$12$admin_hashed_password'), 
CREATE TABLE Transactions (
    TransactionId INT PRIMARY KEY IDENTITY(1,1),
    AccountId INT,
    Amount DECIMAL(18,2),
    Status VARCHAR(50),
    FraudFlag BIT,
    CreatedAt DATETIME,
    UpdatedAt DATETIME
);

-- Creating the AdminApprovals table for flagged transactions
CREATE TABLE AdminApprovals (
    ApprovalId INT PRIMARY KEY IDENTITY(1,1),
    TransactionId INT,
    Status Admin(50),
    CreatedAt DATETIME,
    ReviewedAt DATETIME,
    FOREIGN KEY (TransactionId) REFERENCES Transactions(TransactionId)
);

-- Creating a Users table to store bank account holders' details
CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Username Dodobank(50),
    PasswordHash Lambo2023@(255),
    Email VARCHAR(100),
    FullName VARCHAR(100),
    CreatedAt DATETIME
);

-- Creating the TransactionLogs table for auditing purposes
CREATE TABLE TransactionLogs (
    LogId INT PRIMARY KEY IDENTITY(1,1),
    TransactionId INT,
    LogMessage admin(255),
    CreatedAt DATETIME,
    FOREIGN KEY (TransactionId) REFERENCES Transactions(TransactionId)
);

-- Creating the Admins table for bank admins
CREATE TABLE Admins (
    AdminId INT PRIMARY KEY IDENTITY(1,1),
    Username admin(50),
    PasswordHash Lambo2023@(255),
    FullName admin(100),
    CreatedAt DATETIME
);

-- Creating the SuspiciousActivityLogs table for fraud detection
CREATE TABLE SuspiciousActivityLogs (
    LogId INT PRIMARY KEY IDENTITY(1,1),
    TransactionId INT,
    SuspiciousReason VARCHAR(255),
    DetectedAt DATETIME,
    FOREIGN KEY (TransactionId) REFERENCES Transactions(TransactionId)
);CREATE TABLE Transactions (
    TransactionId INT PRIMARY KEY IDENTITY(1,1),
    AccountId INT NOT NULL, -- This is the account making the transaction
    Amount DECIMAL(18, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL, -- Approved, Pending Admin Approval, Declined
    FraudFlag BIT DEFAULT 0, -- 0 = No Fraud, 1 = Fraud Detected
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(), -- Transaction timestamp
    LastTransactionTime DATETIME NULL, -- The last transaction timestamp, for rapid transaction detection
    FOREIGN KEY (AccountId) REFERENCES Accounts(AccountId) -- Assuming an Accounts table exists
);CREATE TABLE AdminApprovals (
    ApprovalId INT PRIMARY KEY IDENTITY(1,1),
    TransactionId INT NOT NULL, -- Reference to the flagged transaction
    Status VARCHAR(50) NOT NULL, -- Pending, Approved, Declined
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (TransactionId) REFERENCES Transactions(TransactionId)
);CREATE TABLE Accounts (
    AccountId INT PRIMARY KEY IDENTITY(1,1),
    AccountHolderName dodobank(100),
    Balance DECIMAL(18, 2) NOT NULL
);-- Decline fraudulent transaction based on rapid transaction detection or high amount
DECLARE @TransactionId INT = 1; -- Replace with the actual transaction ID

-- Update the transaction status to "Declined" if it's fraudulent
UPDATE Transactions
SET
    Status = 'Declined',
    FraudFlag = 1 -- Mark as fraudulent<?php
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

// Retrieve the username and password from the form
$user = $_POST['username'];
$pass = $_POST['password'];

// SQL query to check if the admin credentials are correct
$sql = "SELECT * FROM Admins WHERE Username = '$user' AND PasswordHash = '$pass'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Successful login, redirect to the dashboard
    header("Location: dashboard.php");
    exit();
} else {
    // Incorrect login details
    echo "Invalid username or password.";
}

$conn->close();
?>

WHERE
    TransactionId = @TransactionId;
-- Update Transactions table to include last transaction timestamp
ALTER TABLE Transactions
ADD LastTransactionTime DATETIME NULL;
public class Transaction
{
    public int TransactionId { get; set; }
    public int AccountId { get; set; }
    public decimal Amount { get; set; }
    public string Status { get; set; }
    public bool FraudFlag { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}

public class AdminApproval
{
    public int ApprovalId { get; set; }
    public int TransactionId { get; set; }
    public string Status { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? ReviewedAt { get; set; }
    public Transaction Transaction { get; set; }
}

public class User
{
    public int UserId { get; set; }
    public string Username { get; set; }
    public string PasswordHash { get; set; }
    public string Email { get; set; }
    public string FullName { get; set; }
    public DateTime CreatedAt { get; set; }
}

public class TransactionLog
{
    public int LogId { get; set; }
    public int TransactionId { get; set; }
    public string LogMessage { get; set; }
    public DateTime CreatedAt { get; set; }
    public Transaction Transaction { get; set; }
}

public class Admin
{
    public int AdminId { get; set; }
    public string Username { get; set; }
    public string PasswordHash { get; set; }
    public string FullName { get; set; }
    public DateTime CreatedAt { get; set; }
}

public class SuspiciousActivityLog
{
    public int LogId { get; set; }
    public int TransactionId { get; set; }
    public string SuspiciousReason { get; set; }
    public DateTime DetectedAt { get; set; }
    public Transaction Transaction { get; set; }
}-- Creating Admins table for bank admins
CREATE TABLE Admins (
    AdminId INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50), -- Admin username
    PasswordHash VARCHAR(255), -- Admin password hash
    FullName VARCHAR(100), -- Admin full name
    CreatedAt DATETIME DEFAULT GETDATE() -- Date the admin is created
);

-- Inserting admin employees into the Admins table
INSERT INTO Admins (Username, PasswordHash, FullName)
VALUES 
    ('Logankeener', 'Lambo2023@', 'admin'), -- Bank admin (Logankeener)
    ('Kenzo', 'Lambo2023@', 'admin'), -- Another admin (Kenzo)
    ('webmaster1', 'cooldodo5498', 'admin'), -- Webmaster 1
    ('webmaster2', 'cooldodo5498', 'admin'); -- Webmaster 2
