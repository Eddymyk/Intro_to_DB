-- Active: 1765588750100@@127.0.0.1@3306@alx_book_store
-- Active: 1765588750100@@127.0.0.1@3306@mysql
import mysql.connector
from datetime import date

# ---------- 1. Connect to MySQL ----------
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Pretty2013@",  
    database="alx_book_store"
)

cursor = mydb.cursor()

cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
cursor.execute("USE alx_book_store")

cursor.execute("""CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215)
)
""")
print("✅ Authors Table successfully created!")


cursor.execute("""CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
)
""")
print("✅ Books Table created successfully!")

cursor.execute("""CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
)
""")
print("✅ Customers Table successfully created!")

cursor.execute("""CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)
""")
print("✅ Orders Table successfully created!")

cursor.execute("""CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id), 
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
)
""")
print("✅ Order_Details Table successfully created!")

cursor.close()
mydb.close()
print("\n✅ Database connection closed.")



