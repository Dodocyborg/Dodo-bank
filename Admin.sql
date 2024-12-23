-- Creating the Accounts table (added before Transactions to avoid foreign key issues)
CREATE TABLE Accounts (
    AccountId INT PRIMARY KEY IDENTITY(1,1),
    AccountHolderName VARCHAR(100),
    Balance DECIMAL(18, 2) NOT NULL
);

-- Creating the Transactions table
CREATE TABLE Transactions (
    TransactionId INT PRIMARY KEY IDENTITY(1,1),
    AccountId INT NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    Status VARCHAR(50) NOT NULL, -- Approved, Pending Admin Approval, Declined
    FraudFlag BIT DEFAULT 0, -- 0 = No Fraud, 1 = Fraud Detected
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    LastTransactionTime DATETIME NULL,
    FOREIGN KEY (AccountId) REFERENCES Accounts(AccountId)
);

-- Creating the AdminApprovals table for flagged transactions
CREATE TABLE AdminApprovals (
    ApprovalId INT PRIMARY KEY IDENTITY(1,1),
    TransactionId INT NOT NULL, -- Reference to the flagged transaction
    Status VARCHAR(50) NOT NULL, -- Pending, Approved, Declined
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (TransactionId) REFERENCES Transactions(TransactionId)
);

-- Creating the Users table to store bank account holders' details
CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50),
    PasswordHash VARCHAR(255),
    Email VARCHAR(100),
    FullName VARCHAR(100),
    CreatedAt DATETIME
);

-- Creating the Admins table for bank admins
CREATE TABLE Admins (
    AdminId INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50),
    PasswordHash VARCHAR(255),
    FullName VARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Inserting admin employees into the Admins table with hashed passwords
-- Use appropriate hashing for security, e.g., bcrypt
INSERT INTO Admins (Username, PasswordHash, FullName)
VALUES 
    ('Logankeener', 'hashed_password_here', 'admin'),
    ('Kenzo', 'hashed_password_here', 'admin'),
    ('webmaster1', 'hashed_password_here', 'admin'),
    ('webmaster2', 'hashed_password_here', 'admin');
