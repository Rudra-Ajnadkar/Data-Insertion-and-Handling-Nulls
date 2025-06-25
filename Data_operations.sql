USE newschema;



/*  Create Customers table */
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Address TEXT
);

/* Create Product table */
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10,2),
    Stock INT
);

/*  Create Order table */
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

/* Create OrderDetails table (many-to-many between Orders and Products) */
CREATE TABLE OrderDetail (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


/* Create Payments table */
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    Method VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

/*  Insert into Customers */
INSERT INTO Customers (CustomerID, Name, Email, Address)
VALUES 
(1, 'Ravi Shah', 'ravi@example.com', 'Pune'),
(2, 'Sneha Patil', NULL, 'Mumbai'); 


/* Insert into Products */
INSERT INTO Product (ProductID, Name, Description, Price, Stock)
VALUES 
(101, 'Laptop', 'Gaming Laptop', 65000.00, 10),
(102, 'Headphones', NULL, 1500.00, 25);  -- NULL description

/* Insert into Orders */
INSERT INTO Orders (OrderID, OrderDate, CustomerID)
VALUES 
(1, '2025-06-25', 1),
(2, '2025-06-25', 2);

/* Insert into OrderDetail */
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Price)
VALUES 
(1, 101, 1, 65000.00),
(2, 102, 2, 3000.00);

/* Insert into Payments */
INSERT INTO Payments (PaymentID, OrderID, Amount, PaymentDate, Method)
VALUES 
(1, 1, 65000.00, NULL, 'Credit Card'),
(2, 2, 3000.00, '2025-06-25', 'Cash');

/* Update customer address */
UPDATE Customers
SET Address = 'Nagpur'
WHERE CustomerID = 2;

/*  Add missing payment date */
UPDATE Payments
SET PaymentDate = '2025-06-25'
WHERE PaymentDate IS NULL;

/* Reduce product stock */
UPDATE Product
SET Stock = Stock - 1
WHERE ProductID = 101;

/* Delete customer with ID 2 */
DELETE FROM Customers
WHERE CustomerID = 2;

/*  Delete product with zero stock */
DELETE FROM Product
WHERE Stock = 0;

SELECT * FROM Customers;
SELECT * FROM Product;
SELECT * FROM Payments;

