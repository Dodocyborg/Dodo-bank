-- Create the Roles Table
CREATE TABLE roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

-- Insert roles into the roles table
INSERT INTO roles (role_name) VALUES
    ('President/Senator'),
    ('Vice President'),
    ('Account Opening Officer'),
    ('Financial Officer/CFO'),
    ('Website Designer/Webmaster');

-- Create the Employees Table with Role Assignment
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- Insert example employees with roles
INSERT INTO employees (username, password, role_id) VALUES
    ('Logan Keener', 'Lambo2023@', 1),  -- President
    ('Kenzo', 'Kenzo1234@!', 2),  -- Vice President
    ('Kelly C. Keener', 'AccountKelly2024!', 3),  -- Account Opening Officer
    ('Jackie C. Keener', 'FinanceJackie2024@', 4),  -- Financial Officer
    ('Website Designer', 'cooldodos', 5);  -- Website Designer

-- Create the Approvals Table
CREATE TABLE approvals (
    approval_id INT AUTO_INCREMENT PRIMARY KEY,
    request_type VARCHAR(50) NOT NULL, -- "Loan", "Account Opening", "Law Approval"
    requested_by INT, -- Employee who made the request
    approval_status VARCHAR(20), -- "Pending", "Approved", "Rejected"
    approved_by INT, -- Employee who approved/rejected (null if pending)
    date_requested TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (requested_by) REFERENCES employees(employee_id),
    FOREIGN KEY (approved_by) REFERENCES employees(employee_id)
);
