-- CUSTOMER_TABLE
CREATE TABLE CUSTOMER_TABLE (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    CustomerEmail VARCHAR(100) UNIQUE NOT NULL
);

-- PRODUCT_TABLE
CREATE TABLE PRODUCT_TABLE (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    UnitPrice DECIMAL(10, 2) NOT NULL
);

alter table PRODUCT_TABLE
add column Qty NUMBER(3);


-- ORDER_TABLE
CREATE TABLE ORDER_TABLE (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    Sales_Quantity INT NOT NULL,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER_TABLE(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT_TABLE(ProductID)
);

-- SHIPPING_TABLE
CREATE TABLE SHIPPING_TABLE (
    ShippingID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ShippingAddress VARCHAR(255) NOT NULL,
    ShippingCity VARCHAR(50) NOT NULL,
    ShippingState VARCHAR(50),
    ShippingPostalCode VARCHAR(20),
    ShippingCountry VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES ORDER_TABLE(OrderID)
);

-- Example: Insert order and update quantity in product table
BEGIN;

-- Step 1: Insert into order table
INSERT INTO ORDER_TABLE (OrderID, OrderDate, CustomerID, ProductID, Sales_Quantity, TotalAmount)
VALUES --(1002, '2025-08-02', 2, 102, 2, 300.00);

--(1003, '2025-08-03', 3, 103, 3, 75.00);
(1001, '2025-08-01', 1, 101, 1, 800.00);

-- Step 2: Update product stock
UPDATE PRODUCT_TABLE
SET Qty = Qty - 1
WHERE ProductID = 101;

COMMIT;


select * from ORDER_TABLE;

-- CUSTOMER_TABLE
INSERT INTO CUSTOMER_TABLE (CustomerID, CustomerName, CustomerEmail) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com'),
(2, 'Bob Smith', 'bob.smith@example.com'),
(3, 'Charlie Brown', 'charlie.brown@example.com');

-- PRODUCT_TABLE
INSERT INTO PRODUCT_TABLE (ProductID, ProductName, Category, UnitPrice,Qty) VALUES
(101, 'Laptop', 'Electronics', 800.00,25),
(102, 'Office Chair', 'Furniture', 150.00,30),
(103, 'Wireless Mouse', 'Electronics', 25.00,50);

-- ORDER_TABLE
INSERT INTO ORDER_TABLE (OrderID, OrderDate, CustomerID, ProductID, Quantity, TotalAmount) VALUES
(1001, '2025-08-01', 1, 101, 1, 800.00),
(1002, '2025-08-02', 2, 102, 2, 300.00),
(1003, '2025-08-03', 3, 103, 3, 75.00);

-- SHIPPING_TABLE
INSERT INTO SHIPPING_TABLE (ShippingID, OrderID, ShippingAddress, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry) VALUES
(501, 1001, '123 Main St', 'New York', 'NY', '10001', 'USA'),
(502, 1002, '456 Oak Ave', 'Chicago', 'IL', '60601', 'USA'),
(503, 1003, '789 Pine Rd', 'San Francisco', 'CA', '94101', 'USA');
