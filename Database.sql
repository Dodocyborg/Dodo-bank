CREATE TABLE Admins (
    AdminId INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50),
    PasswordHash VARCHAR(255),
    FullName VARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Insert sample admin credentials (remember to hash passwords in a production environment)
INSERT INTO Admins (Username, PasswordHash, FullName)
VALUES ('Logankeener', 'Lambo2023@', 'admin'), 
       ('Kenzo', 'Lambo2023@', 'admin');
