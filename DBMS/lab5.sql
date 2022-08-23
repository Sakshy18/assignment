create database employee_track;
Query OK, 1 row affected (0.00 sec)

mysql> use employee_track;
Database changed
mysql> create table employees;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> 
mysql> create table employees(emp_id int primary key,emp_name varchar(15),emp_age int,city varchar(15),salary long);
Query OK, 0 rows affected (0.06 sec)

mysql> insert into employees values(1,"sakshi",23,"NewYork",200000);
Query OK, 1 row affected (0.00 sec)

mysql> insert into employees values(2,"Dave",29,"Florida",30000);
Query OK, 1 row affected (0.03 sec)

mysql> insert into employees values(3,"Shreya",23,"Arizona",280000);
Query OK, 1 row affected (0.04 sec)

mysql> insert into employees values(4,"Akshat",24,"Alaska",400000);
Query OK, 1 row affected (0.00 sec)

mysql> insert into employees values(5,"Arya",24,"Alaska",210000);
Query OK, 1 row affected (0.01 sec)

mysql> select * from employees
    -> where emp_id IN (select emp_id from employees);
+--------+----------+---------+---------+--------+
| emp_id | emp_name | emp_age | city    | salary |
+--------+----------+---------+---------+--------+
|      1 | sakshi   |      23 | NewYork | 200000 |
|      2 | Dave     |      29 | Florida | 30000  |
|      3 | Shreya   |      23 | Arizona | 280000 |
|      4 | Akshat   |      24 | Alaska  | 400000 |
|      5 | Arya     |      24 | Alaska  | 210000 |
+--------+----------+---------+---------+--------+
mysql> select emp_name,city from employees where  emp_id in(select emp_id from employees where salary >200000);
+----------+---------+
| emp_name | city    |
+----------+---------+
| Shreya   | Arizona |
| Akshat   | Alaska  |
| Arya     | Alaska  |
+----------+---------+
3 rows in set (0.00 sec)
mysql> select emp_name,salary from employees
    -> where city not in
    -> (select city from employees where city="Alaska");
+----------+--------+
| emp_name | salary |
+----------+--------+
| sakshi   | 200000 |
| Dave     | 30000  |
| Shreya   | 280000 |
+----------+--------+
3 rows in set (0.00 sec)

mysql>  select emp_name from employees
    -> where
    -> emp_age in
    -> (Select emp_age from employees where emp_id=3);
+----------+
| emp_name |
+----------+
| sakshi   |
| Shreya   |
+----------+
mysql> select count(emp_id),city
    -> from employees
    -> group by country;
ERROR 1054 (42S22): Unknown column 'country' in 'group statement'
mysql> select count(emp_id),city
    -> from employees
    -> group by city;
+---------------+---------+
| count(emp_id) | city    |
+---------------+---------+
|             1 | NewYork |
|             1 | Florida |
|             1 | Arizona |
|             2 | Alaska  |
+---------------+---------+
4 rows in set (0.00 sec)

mysql> select max(salary),emp_name
    -> from employees
    -> group by emp_name;
+-------------+----------+
| max(salary) | emp_name |
+-------------+----------+
| 200000      | sakshi   |
| 30000       | Dave     |
| 280000      | Shreya   |
| 400000      | Akshat   |
| 210000      | Arya     |
+-------------+----------+
5 rows in set (0.05 sec)
