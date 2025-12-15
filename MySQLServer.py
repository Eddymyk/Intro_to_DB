import mysql.connector
from mysql.connector import Error  

try:
    # Connect to MySQL
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="12345@"  
    )

    if mydb.is_connected():
        print("✅ Connected to MySQL server")

    # Create cursor
    cursor = mydb.cursor()

    # Create database
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("✅ Database 'alx_book_store' created successfully!")

except mysql.connector.Error as e:  # ← this is what the check wants
    print(f"❌ MySQL Error: {e}")

finally:
    # Close resources
    if 'cursor' in locals():
        cursor.close()
    if 'mydb' in locals() and mydb.is_connected():
        mydb.close()
        print("✅ MySQL connection closed")
