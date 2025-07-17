-- Product Table
CREATE TABLE Product (
    P_ID INT AUTO_INCREMENT PRIMARY KEY,
    P_name VARCHAR(100) NOT NULL,
    Dept VARCHAR(50),
    Quantity INT DEFAULT 0
);

-- User Table
CREATE TABLE User (
    U_ID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    permission ENUM('admin', 'staff', 'viewer') NOT NULL
);

-- Invoice Table
CREATE TABLE Invoice (
    I_ID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Status ENUM('paid', 'pending', 'canceled') NOT NULL
);
