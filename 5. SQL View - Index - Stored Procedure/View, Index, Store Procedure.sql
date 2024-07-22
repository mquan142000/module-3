create database demo;
use demo;

create table Products
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    productCode        VARCHAR(255),
    productName        VARCHAR(255),
    productPrice       double,
    productAmount      int,
    productDescription VARCHAR(255),
    productStatus      varchar(255)
);

insert into Products (productCode, productName, productPrice, productAmount)
values ('P001', 'Product 1', 10.99, 100),
       ('P002', 'Product 2', 15.99, 200),
       ('P003', 'Product 3', 20.99, 150),
       ('P004', 'Product 4', 25.99, 50),
       ('P005', 'Product 5', 30.99, 75);
select *
from Products;

/* Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục) */
CREATE UNIQUE INDEX idx_productCode ON Products (productCode);

/* Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice) */
CREATE INDEX idx_productNamePrice ON Products (productName, productPrice);

/* Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào */
EXPLAIN
SELECT *
FROM Products
WHERE productName = 'Product 2';

/* So sánh câu truy vấn trước và sau khi tạo index */
EXPLAIN
SELECT *
FROM Products
WHERE productName = 'Product 2'
  and productPrice < 15.99;

/* Xóa index tạo ở trên */
DROP INDEX idx_productCode ON Products;

/* Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products. */
CREATE VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;
select *
from productinfo;

/* Tiến hành sửa đổi view */
    ALTER VIEW ProductInfo AS
    SELECT productCode, productName, productPrice, 'Available' AS productStatus
    FROM Products
    WHERE productAmount > 0;
select *
from productinfo;

/* Tiến hành xóa view */
DROP VIEW ProductInfo;

/* Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product */
DELIMITER $$
CREATE PROCEDURE GetProducts()
BEGIN
    SELECT * FROM Products;
END$$
DELIMITER ;
CALL GetProducts();

/* Tạo store procedure thêm một sản phẩm mới */
DELIMITER $$

CREATE PROCEDURE AddProduct(
    IN productCode VARCHAR(255),
    IN productName VARCHAR(255),
    IN productPrice DOUBLE,
    IN productAmount INT,
    IN productDescription VARCHAR(255),
    IN productStatus VARCHAR(255)
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (productCode, productName, productPrice, productAmount, productDescription, productStatus);
END $$

DELIMITER ;

CALL AddProduct('P006', 'Add Product 6', 99.99, 10, 'New description', 'Available');

/* Tạo store procedure sửa thông tin sản phẩm theo id */
DELIMITER $$

CREATE PROCEDURE UpdateProduct(
    IN productId INT,
    IN productCode VARCHAR(255),
    IN productName VARCHAR(255),
    IN productPrice DOUBLE,
    IN productAmount INT,
    IN productDescription VARCHAR(255),
    IN productStatus VARCHAR(255)
)
BEGIN
    UPDATE Products
    SET productCode        = productCode,
        productName        = productName,
        productPrice       = productPrice,
        productAmount      = productAmount,
        productDescription = productDescription,
        productStatus      = productStatus
    WHERE id = productId;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Product not found';
    ELSE
        SELECT * FROM Products WHERE id = productId;
    END IF;
END $$

DELIMITER ;
drop procedure UpdateProduct;

CALL UpdateProduct(1, 'P001', 'Updated Product 1', 99.99, 10, 'New description', 'Available');

/* Tạo store procedure xoá sản phẩm theo id */
DELIMITER $$

CREATE PROCEDURE DeleteProduct(IN productId INT)
BEGIN
    DELETE FROM Products
    WHERE id = productId;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Product not found';
    END IF;
END $$

DELIMITER ;

CALL DeleteProduct(1);
select * from Products;




