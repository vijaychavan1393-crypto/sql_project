import pandas as pd
import matplotlib.pyplot as plt
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

            cursor.execute("select*from students") 
            row=cursor.fetchall()
            for row in row:
                print(row)

            cursor.execute("select student_name from students where city='pune'")
            row=cursor.fetchall()
            for row in row:
                print(row);


            cursor.execute("select*from students order by age desc")
            row=cursor.fetchall()
            for row in row:
                print(row);


            cursor.execute("select course_id,AVG(marks) as avg_marks from marks group by course_id")
            row=cursor.fetchall()
            for row in row:
                print(row);


            cursor.execute("select course_id,AVG(MARKS) AS avg_marks from marks group by course_id having AVG(marks) <70")
            row=cursor.fetchall()
            for row in row:
                print(row);


            cursor.execute("select*from marks as s INNER JOIN students as m ON s.student_id = m.student_id")
            row=cursor.fetchall()
            for row in row:
                print(row);


            cursor.execute("select*from students as s LEFT JOIN marks as m ON s.student_id = m.student_id")
            row=cursor.fetchall()
            for row in row:
                print(row);


            cursor.execute("select count(*) total_student from students")
            row=cursor.fetchall()
            for row in row:
                print(row);


            cursor.execute("select sum(marks) as total_marks from marks")
            row=cursor.fetchall()
            for row in row:
                print(row);


            cursor.execute("select avg(marks) as average_marks from marks")
            row=cursor.fetchall()
            for row in row:
                print(row);


            cursor.execute("select*from student_city")
            row=cursor.fetchall()
            for row in row:
                print(row);
                
            query1=""" SELECT*from students s join marks m on s.student_id=m.student_id order by m.marks DESC LIMIT 5;"""

            df = pd.read_sql(query1, conn)

            plt.bar(df['student_name'],df['marks'])
            plt.show()


except Error as e:
    print("Error:", e)
                
    