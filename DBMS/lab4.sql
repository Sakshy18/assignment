use tracking;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select * from orders;
+-----+---------+------------+
| id  | cust_id | order_date |
+-----+---------+------------+
| 101 |       2 | 2022-08-22 |
| 103 |      32 | 2022-08-20 |
| 108 |      37 | 2022-08-25 |
| 121 |       3 | 2022-08-25 |
+-----+---------+------------+
4 rows in set (0.02 sec)

mysql> select * from customers;
+---------+-------------------+---------+---------+
| cust_id | cust_name         | contact | country |
+---------+-------------------+---------+---------+
|       1 | Sakshi_thombre    | 9172100 | India   |
|       2 | Shreya_kulkarni   | 9823456 | Japan   |
|       3 | Anubhav_prabhakar | 9823346 | China   |
|       5 | Akshat_Thawait    | 9923312 | Italy   |
+---------+-------------------+---------+---------+
4 rows in set (0.02 sec)

mysql> select orders.id,customers.cust_name,customers.cust_id
    -> from orders
    -> inner join customers on orders.cust_id=customers.cust_id;
+-----+-------------------+---------+
| id  | cust_name         | cust_id |
+-----+-------------------+---------+
| 101 | Shreya_kulkarni   |       2 |
| 121 | Anubhav_prabhakar |       3 |
+-----+-------------------+---------+
2 rows in set (0.00 sec)

mysql> select customers.cust_name,orders.id
    -> from customers
    -> left join orders on customers.cust_id=orders.cust_id
    -> order by customers.cust_name;
+-------------------+------+
| cust_name         | id   |
+-------------------+------+
| Akshat_Thawait    | NULL |
| Anubhav_prabhakar |  121 |
| Sakshi_thombre    | NULL |
| Shreya_kulkarni   |  101 |
+-------------------+------+
4 rows in set (0.03 sec)

mysql> select orders.id,customers.cust_name,customers.country
    -> from orders
    -> right join customers on orders.cust_id=customers.cust_id
    -> order by prders.orders.id;
ERROR 1054 (42S22): Unknown column 'prders.orders.id' in 'order clause'
mysql> select orders.id,customers.cust_name,customers.country from orders right join customers on orders.cust_id=customers.cust_id order by orders.orders.id;
ERROR 1054 (42S22): Unknown column 'orders.orders.id' in 'order clause'
mysql> select orders.id,customers.cust_name,customers.country from orders right join customers on orders.cust_id=customers.cust_id order by orders.id;
+------+-------------------+---------+
| id   | cust_name         | country |
+------+-------------------+---------+
| NULL | Sakshi_thombre    | India   |
| NULL | Akshat_Thawait    | Italy   |
|  101 | Shreya_kulkarni   | Japan   |
|  121 | Anubhav_prabhakar | China   |
+------+-------------------+---------+
4 rows in set (0.00 sec)

mysql> select customers.cust_name,orders.id
    -> from customers
    -> cross join orders;
+-------------------+-----+
| cust_name         | id  |
+-------------------+-----+
| Akshat_Thawait    | 101 |
| Anubhav_prabhakar | 101 |
| Shreya_kulkarni   | 101 |
| Sakshi_thombre    | 101 |
| Akshat_Thawait    | 103 |
| Anubhav_prabhakar | 103 |
| Shreya_kulkarni   | 103 |
| Sakshi_thombre    | 103 |
| Akshat_Thawait    | 108 |
| Anubhav_prabhakar | 108 |
| Shreya_kulkarni   | 108 |
| Sakshi_thombre    | 108 |
| Akshat_Thawait    | 121 |
| Anubhav_prabhakar | 121 |
| Shreya_kulkarni   | 121 |
| Sakshi_thombre    | 121 |
+-------------------+-----+
16 rows in set (0.00 sec)

