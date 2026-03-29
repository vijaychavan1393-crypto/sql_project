create database Student_Performance_Management_System;
use Student_Performance_Management_System;
create table students(
student_id INT AUTO_INCREMENT PRIMARY KEY,
student_name varchar(50),
age INT,
course varchar(50),
city varchar(20));
create table courses(
course_id INT PRIMARY KEY,
course_name varchar(50),
duration varchar(20));
create table marks(
student_id INT,
course_id INT,
marks INT,
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (course_id) REFERENCES courses(course_id));
create table attendance(
student_id INT,
attendance_percentage DECIMAL(5.2),
FOREIGN KEY (student_id) REFERENCES students(student_id));
insert into students values(1,'vijay',20,'electrical','pune'),(2,'rahul',20,'entc','sangli'),
(3,'ajay',20,'entc','pune'),(4,'sujit',20,'art','miraj'),(5,'mangesh',20,'mechanical','amravati'),
(6,'raju',20,'electrical','nashik'),(7,'rohit',20,'electrical','karad'),(8,'ajit',66,'entc','nashik'),
(9,'prakash',20,'art','kolhapur'),(10,'amer',20,'entc','patan'),(11,'sudhir',20,'electrical','delhi'),
(12,'anil',20,'mechanical','pune'),(13,'sonali',20,'mechanical','pune'),(14,'nagesh',20,'mechanical','mumbai'),
(15,'hari',20,'bsc','karad'),(16,'nishad',20,'bsc','phaltan'),(17,'arvind',20,'bsc','kolhapur'),
(18,'mangesh',20,'electrical','sangli'),(19,'shivani',20,'entc','mumbai'),(20,'rupesh',20,'art','satara');
insert into courses values(101,'electrical',4),(201,'entc',4),(301,'mechanical',4),
(401,'art',2),(501,'bsc',3);
insert into marks values(1,101,70),(2,201,60),(3,201,80),(4,401,80),(5,301,70),(6,101,80),
(7,101,60),(8,201,70),(9,401,90),(10,201,70),(11,101,70),(12,301,80),(13,301,50),
(14,301,50),(15,501,60),(16,501,70),(17,501,60),(18,101,50),(19,201,90),(20,501,50);
insert into attendance value(1,70.1),(2,55.5),(3,84.0),(4,36.6),(5,84.0),(6,50.5),(7,68.0),(8,68.0),(9,50.0),(10,68.5),
(11,55.5),(12,50.0),(13,68.0),(14,78.0),(15,84.0),(16,70.1),(17,55.5),(18,78.0),(19,50.0),(20,68.0);
#select
select*from attendance;
#where
select*from students where city='pune';
#order by
select*from students order by age desc;
#group by
select course_id,AVG(marks) as avg_marks from marks group by course_id;
#having
select course_id,AVG(MARKS) AS avg_marks from marks group by course_id having AVG(marks) >50;
#inner join
select*from marks as s INNER JOIN students as m ON s.student_id = m.student_id;
#left join
select*from students as s LEFT JOIN marks as m ON s.student_id = m.student_id;
#count
select count(*) total_student from students;
#sum
select sum(marks) as total_marks from marks;
#avg
select avg(marks) as average_marks from marks;

