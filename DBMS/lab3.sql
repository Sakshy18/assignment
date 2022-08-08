~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| Amezon_product     |
| EMPLOYEE           |
| MAYURESH           |
| Menu               |
| Movie_list         |
| PROJECT            |
| TE_B               |
| aadarsh            |
| aakansha           |
| assignment         |
| assignment2        |
| b1                 |
| college            |
| database2          |
| databasename       |
| information_schema |
| library            |
| movie_reviews      |
| mysql              |
| performance_schema |
| personal_info      |
| pizza_mania        |
| rushi              |
| rutik              |
| samiksha           |
| sample             |
| school             |
| shital             |
| store              |
| sys                |
| teachers_info      |
+--------------------+
31 rows in set (0.00 sec)

mysql> use pizza_mania;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select * frpm dominos;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'frpm dominos' at line 1
mysql> select * from dominos;
+-------+-----------------+--------+-------------+--------+---------+
| sr_no | pizza_name      | cheese | total_price | size   | reviews |
+-------+-----------------+--------+-------------+--------+---------+
|     1 | peri-peri-pizza | yes    |         240 | medium | ****    |
|     3 | just mozerella  | yes    |         350 | medium | ***     |
|     4 | margherita      | yes    |         180 | large  | *****   |
|     5 | veggie-delight  | yes    |         420 | medium | ****    |
+-------+-----------------+--------+-------------+--------+---------+
4 rows in set (0.02 sec)

mysql> select * from pizza;
ERROR 1356 (HY000): View 'pizza_mania.pizza' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them
mysql> create view pizza_view
    -> as
    -> select pizza_name, reviews
    -> from dominos
    -> where total_price>250;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from pizza_view;
+----------------+---------+
| pizza_name     | reviews |
+----------------+---------+
| just mozerella | ***     |
| veggie-delight | ****    |
+----------------+---------+
2 rows in set (0.00 sec)

mysql> drop view pizza_view;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from pizza_view;
ERROR 1146 (42S02): Table 'pizza_mania.pizza_view' doesn't exist
mysql> 
