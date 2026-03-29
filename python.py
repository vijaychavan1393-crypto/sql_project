import mysql.connector
from mysql.connector import Error

try:
    conn = mysql.connector.connect(
       host="localhost",
       user="root",
         password="543212601",
         database="Student_Performance_Management_System")
    
    if conn.is_connected():
        print("Connected to MySQL")

        cursor = conn.cursor()
        cursor.execute("SHOW DATABASES")
        for db in cursor.fetchall():
            print(db)

            cursor.execute("select student_name,age,course from students")
            row=cursor.fetchall()
            for row in row:
                print(row)
except Error as e:
    print("Error:", e)
