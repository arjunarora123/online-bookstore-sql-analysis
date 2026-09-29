# 📚 Online Bookstore SQL Analysis

## Project Overview

This project is a **PostgreSQL SQL analysis of an Online Bookstore dataset**. The project demonstrates how relational data can be structured, queried, and analyzed to generate insights into books, customers, orders, sales, and inventory.

The analysis was performed using **PostgreSQL and SQL**, with data provided in CSV format.

---

## 🛠️ Tools & Technologies

* **PostgreSQL**
* **SQL**
* **pgAdmin**
* **CSV Data**
* Relational Database Concepts

---

## 📂 Data Used

The project uses three datasets:

### 1. Books

Contains information about the bookstore's book catalog.

**Fields include:**

* Book ID
* Title
* Author
* Genre
* Published Year
* Price
* Stock

### 2. Customers

Contains customer information.

**Fields include:**

* Customer ID
* Name
* Email
* Phone
* City
* Country

### 3. Orders

Contains bookstore transaction data.

**Fields include:**

* Order ID
* Customer ID
* Book ID
* Order Date
* Quantity
* Total Amount

The SQL database connects these datasets using **primary and foreign keys**.

---

## 🔄 How the Data Was Used

The CSV data was imported into PostgreSQL using the `COPY` command.

The analysis followed this workflow:

```text
CSV Data
   ↓
PostgreSQL Database
   ↓
Table Relationships
   ↓
Data Exploration
   ↓
SQL Queries
   ↓
Aggregations & Joins
   ↓
Business Insights
```

---

## 🔍 SQL Analysis

SQL was used to analyze:

### 📚 Books & Products

* Book genres
* Book prices
* Publication years
* Stock levels
* Most and least expensive books
* Low-stock books

### 👥 Customers

* Customer locations
* Customers from specific countries
* Repeat customers
* Customer order frequency
* Customer spending

### 🛒 Orders & Sales

* Order dates
* Order quantities
* Orders above specific values
* Total revenue
* Books sold by genre
* Books sold by author
* Most frequently ordered books

### 📦 Inventory

* Total recorded stock
* Low-stock products
* Zero-stock products
* Comparison of recorded stock with order quantities

The SQL script uses techniques including `WHERE`, `JOIN`, `GROUP BY`, `HAVING`, `SUM`, `AVG`, `COUNT`, `ORDER BY`, `LIMIT`, and `COALESCE`.

---

## 📊 Key Insights

Based on the supplied datasets:

* **500 books** are included in the book catalog.
* **500 customers** are included in the customer dataset.
* **500 orders** are included in the transaction dataset.
* **2,697 books** were recorded as ordered.
* Total recorded order value is approximately **$75,628.66**.
* **Mystery** has the highest recorded sales volume with **504 books ordered**.
* **Science Fiction** has the largest number of books in the catalog with **84 titles**.
* **139 customers** placed at least two orders.
* Five books have a recorded stock level of zero.
* The highest recorded customer spending is **$1,398.90**.

These results demonstrate the difference between **catalog size, customer demand, order frequency, revenue, and inventory levels**.

---

## 💡 Business Insights

The analysis shows that SQL can be used to connect different areas of bookstore operations.

### Product Performance

Sales volume can be compared with genre and book information to identify differences between **catalog availability and customer demand**.

### Customer Behavior

Order history can be aggregated to identify **repeat customers and high-value customers**.

### Sales Performance

Order data can be used to calculate **revenue, quantity sold, and average order value**.

### Inventory

Stock information can be analyzed alongside order activity to identify products requiring further inventory review.

---

## 📈 Potential Extensions

This project can be extended into a more comprehensive business intelligence solution using **Power BI**.

Potential dashboard metrics include:

* Total Revenue
* Total Orders
* Books Sold
* Average Order Value
* Revenue by Genre
* Sales by Author
* Top Books
* Customer Spending
* Repeat Customers
* Inventory Levels
* Monthly Sales Trends

---

## ⚠️ Data Note

The `Stock` field represents the stock value available in the Books dataset. The available data does not include beginning inventory, replenishment, returns, or inventory adjustments.

Therefore, inventory calculations based on historical orders should be interpreted as an analytical comparison rather than a complete inventory movement model.

---


## 👨‍💻 Author

**Arjun Arora**

**SQL | PostgreSQL | Data Analysis | Power BI | Power Query**
