mysql> use pizza_mania;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select* from dominos;
+-------+-----------------+--------------+-------------+--------+---------+
| sr_no | pizza_name      | extra_cheese | total_price | size   | reviews |
+-------+-----------------+--------------+-------------+--------+---------+
|     1 | peri-peri-pizza | yes          |         240 | medium | ****    |
|     3 | just mozerella  | yes          |         350 | medium | ***     |
|     4 | margherita      | yes          |         180 | large  | *****   |
|     5 | veggie-delight  | yes          |         420 | medium | ****    |
+-------+-----------------+--------------+-------------+--------+---------+
4 rows in set (0.02 sec)

mysql> create view pizza;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> create view pizza
    -> as
    -> select pizza_name,size from dominos where total price>250
    -> select * from pizza;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'price>250
select * from pizza' at line 3
mysql> create view pizza as select pizza_name,size from dominos where total price>250) select * from pizza;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'price>250) select * from pizza' at line 1
mysql> create view pizza as select pizza_name,extra_cheese from dominos; 
Query OK, 0 rows affected (0.00 sec)

mysql> select * from pizza;
+-----------------+--------------+
| pizza_name      | extra_cheese |
+-----------------+--------------+
| peri-peri-pizza | yes          |
| just mozerella  | yes          |
| margherita      | yes          |
| veggie-delight  | yes          |
+-----------------+--------------+
4 rows in set (0.00 sec)

mysql> alter table dominos rename column extra_cheese to cheese;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> 
