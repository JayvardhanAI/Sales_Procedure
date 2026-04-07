CREATE DATABASE SalesProcedure;
USE SalesProcedure;


CREATE TABLE Customer(
CustomerID INT,
CustomerName VARCHAR(50)
);
CREATE TABLE Products(
ProductId int,
ProductName VARCHAR(50)
);
CREATE TABLE Orders(
OrderID INT,
CustomerID INT
);
CREATE TABLE OrderDetails (
    OrderId INT,
    ProductId INT,
    Quantity INT
);
CREATE TABLE Payments (
    OrderId INT,
    Amount DECIMAL(10,2)
);

INSERT INTO Customer VALUES(1,"RAVI"),(2,"SHIVA"),(3,"SASI");
INSERT INTO Products VALUES (221,"MACBOOK"),(224,"IPHONE 17 PRO MAX"),(254,"CHARGER");
INSERT INTO Orders VALUES (1001, 1), (1002, 2);
INSERT INTO OrderDetails VALUES (1001, 101, 1), (1002, 102, 2);
INSERT INTO Payments VALUES (1001, 50000), (1002, 40000);

CREATE TABLE MySalesReport(
CustomerName VARCHAR(50),
ProductName VARCHAR(50),
Quantity INT,
Amount DECIMAL(10,2)
);

DELIMITER $$
CREATE PROCEDURE LoadSalesData()
BEGIN

INSERT INTO MySalesReport(CustomerName,ProductName,Quantity,Amount)

SELECT
c.CustomerName,
p.ProductName,
od.Quantity,
pay.Amount
 
 FROM Customer c
 INNER JOIN Orders o ON c.CustomerId = o.CustomerId
    INNER JOIN OrderDetails od ON o.OrderId = od.OrderId
    INNER JOIN Products p ON od.ProductId = p.ProductId
    INNER JOIN Payments pay ON o.OrderId = pay.OrderId;
    END $$
    
    DELIMITER ;
 
 
 
