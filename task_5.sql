import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="12345",
    database="alx_book_store"
)

mycursor = mydb.cursor()

sql = """
INSERT INTO customer (customer_id, customer_name, email, address)
VALUES (%s, %s, %s, %s)
"""

val = (1, "Cole Baidoo", "cbaidoo@sandtech.com", "123 Happiness Ave.")
mycursor.execute(sql, val)

mydb.commit()
