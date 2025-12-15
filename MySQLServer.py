import mysql.connector

# ---------- 1. Connect to MySQL ----------
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="*******"  
)

# ---------- 2. Create a cursor ----------
cursor = mydb.cursor()

# ---------- 3. Create the database if it doesn't exist ----------
cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
print("Database 'alx_book_store' created successfully!")

# ---------- 4. Close cursor and connection ----------
cursor.close()
mydb.close()
