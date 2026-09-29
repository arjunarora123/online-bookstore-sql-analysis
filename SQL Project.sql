-- Create Database
CREATE DATABASE OnlineBookstore;

-- Create Books Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

-- Create Customers Table
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

-- Create Orders Tables
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


-- Import Data into Books Table
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'E:\Sql\Sql\EXCEL FILES\Project\Books.csv' 
CSV HEADER;

-- Import Data into Customers Table
COPY Customers(Customer_ID, Name, Email, Phone, City, Country) 
FROM '‪E:\Sql\Sql\EXCEL FILES\Project\Customers.csv' 
CSV HEADER;

-- Import Data into Orders Table
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM '‪E:\Sql\Sql\EXCEL FILES\Project\Orders.csv' 
CSV HEADER;

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 1) Retrieve all books in the "Fiction" genre:

SELECT * FROM BOOKS
WHERE GENRE='Fiction';

SELECT * FROM Books;

-- 2) Find books published after the year 1950:

SELECT * FROM BOOKS
WHERE PUBLISHED_YEAR>1950
ORDER BY PUBLISHED_YEAR ASC;

SELECT * FROM Customers;

-- 3) List all customers from the Canada:

SELECT * FROM CUSTOMERS
WHERE COUNTRY='Canada';

SELECT * FROM Orders;

-- 4) Show orders placed in November 2023:

SELECT * FROM ORDERS
WHERE ORDER_DATE BETWEEN '2023-11-01' AND '2023-11-30'
ORDER BY ORDER_DATE ASC;


-- 5) Retrieve the total stock of books available:

SELECT SUM(STOCK) AS TOTAL_STOCK
FROM BOOKS;



SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 6) Find the details of the most expensive book:

SELECT * FROM BOOKS
ORDER BY PRICE DESC
LIMIT 3;


-- 7) Show all customers who ordered more than 1 quantity of a book:

SELECT CUSTOMER_ID, QUANTITY FROM ORDERS 
WHERE QUANTITY>1
ORDER BY QUANTITY ASC;

-- 8) Retrieve all orders where the total amount exceeds $20:

SELECT * FROM ORDERS
WHERE TOTAL_AMOUNT>20
ORDER BY TOTAL_AMOUNT ASC;


-- 9) List all genres available in the Books table:

SELECT DISTINCT GENRE FROM BOOKS;

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 10) Find the book with the lowest stock:

SELECT * FROM BOOKS
ORDER BY STOCK
LIMIT 5;


-- 11) Calculate the total revenue generated from all orders:

SELECT SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE
FROM ORDERS;


-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

SELECT B.GENRE, SUM(O.QUANTITY) AS TOTAL_BOOKS_SOLD
	FROM ORDERS O
	JOIN BOOKS B 
	ON O.BOOK_ID=B.BOOK_ID
	GROUP BY B.GENRE;

-- 2) Find the average price of books in the "Fantasy" genre:

SELECT AVG(PRICE) AS AVERAGE_PRICE
FROM BOOKS
WHERE GENRE = 'Fantasy';



-- 3) List customers who have placed at least 2 orders:

SELECT O.CUSTOMER_ID, C.NAME, COUNT(O.ORDER_ID) AS ORDER_COUNT
FROM ORDERS O
JOIN CUSTOMERS C
ON O.CUSTOMER_ID=C.CUSTOMER_ID
GROUP BY O.CUSTOMER_ID, C.NAME
HAVING COUNT(ORDER_ID)>=2
ORDER BY ORDER_COUNT DESC;




-- 4) Find the most frequently ordered book:

SELECT O.BOOK_ID, B.TITLE, COUNT(O.ORDER_ID) AS ORDER_COUNT
FROM ORDERS O
JOIN BOOKS B 
ON O.BOOK_ID=B.BOOK_ID
GROUP BY O.BOOK_ID, B.TITLE
ORDER BY ORDER_COUNT DESC
LIMIT 1;



SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT * FROM BOOKS
WHERE GENRE='Fantasy'
ORDER BY PRICE DESC;

-- 6) Retrieve the total quantity of books sold by each author:

SELECT B.AUTHOR, SUM(O.QUANTITY) AS TOTAL_BOOKS_SOLD
FROM ORDERS O
JOIN BOOKS B
ON O.BOOK_ID=B.BOOK_ID
GROUP BY B.AUTHOR
ORDER BY TOTAL_BOOKS_SOLD DESC;


-- 7) List the cities where customers who spent over $30 are located:

SELECT DISTINCT C.CITY, O.TOTAL_AMOUNT 
FROM ORDERS O
JOIN CUSTOMERS C
ON O.CUSTOMER_ID=C.CUSTOMER_ID
WHERE TOTAL_AMOUNT>30; 


-- 8) Find the customer who spent the most on orders:

SELECT C.CUSTOMER_ID, C.NAME, SUM(O.TOTAL_AMOUNT) AS TOTAL_SPENT
FROM ORDERS O
JOIN CUSTOMERS C 
ON O.CUSTOMER_ID=C.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.NAME
ORDER BY TOTAL_SPENT DESC
LIMIT 1;




--9) Calculate the stock remaining after fulfilling all orders:

SELECT B.BOOK_ID, B.TITLE, B.STOCK, 
	COALESCE(SUM(O.QUANTITY),0) AS ORDER_QUANTITY,
	B.STOCK-COALESCE(SUM(O.QUANTITY),0) AS REMAINING_QUANTITY
	FROM BOOKS B
	LEFT JOIN ORDERS O 
	ON B.BOOK_ID=O.BOOK_ID
	GROUP BY B.BOOK_ID
	ORDER BY B.BOOK_ID;
	






