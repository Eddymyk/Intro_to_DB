import mysql.connector


mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="12345"  
    database="alx_book_store"  
)

cursor = mydb.cursor()

cursor.execute("SHOW TABLES")
tables = cursor.fetchall()
print("Tables in the database:")
for table in tables:
    print(table[0])

cursor.close()
mydb.close()
