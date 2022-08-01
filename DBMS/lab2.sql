create database assignment2;
Query OK, 1 row affected (0.01 sec)

mysql> create table T1;
ERROR 1046 (3D000): No database selected
mysql> use assignment2;
Database changed
mysql> create table T1;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table T1(comp_id not null int, system_name varchar(10),Lab_name varchar(10) default "SL1");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'not null int, system_name varchar(10),Lab_name varchar(10) default "SL1")' at line 1
mysql> create table T1(comp_id int NOT NULL, system_name varchar(10),Lab_name varchar(10) de
fault "SL1");
Query OK, 0 rows affected (0.05 sec)

mysql> insert into T1 values(NULL,"windows11");
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into T1 values(NULL,"windows11","sl2");
ERROR 1048 (23000): Column 'comp_id' cannot be null
mysql> insert into T1 values(101,"windows11","sl2");
Query OK, 1 row affected (0.04 sec)

mysql> insert into T1 values(102,"windows21","sl1");
Query OK, 1 row affected (0.04 sec)

mysql> insert into T1 values(103,"windows10");
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into T1 values(103,"windows10","");
Query OK, 1 row affected (0.04 sec)

mysql> select * from T1;
+---------+-------------+----------+
| comp_id | system_name | Lab_name |
+---------+-------------+----------+
|     101 | windows11   | sl2      |
|     102 | windows21   | sl1      |
|     103 | windows10   |          |
+---------+-------------+----------+
3 rows in set (0.00 sec)

mysql> insert into T1 values(102,"windows21","sl1");
Query OK, 1 row affected (0.04 sec)

mysql> insert into T1 values(104,"windows21");
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into T1(comp_id,system_name) values(105,"linux");
Query OK, 1 row affected (0.00 sec)

mysql> select * from T1;
+---------+-------------+----------+
| comp_id | system_name | Lab_name |
+---------+-------------+----------+
|     101 | windows11   | sl2      |
|     102 | windows21   | sl1      |
|     103 | windows10   |          |
|     102 | windows21   | sl1      |
|     105 | linux       | SL1      |
+---------+-------------+----------+
5 rows in set (0.00 sec)

mysql> create table t2;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table t2(id int not null AUTO_INCREMENT, teacher_name varchar(10), primary key(id));
Query OK, 0 rows affected (0.08 sec)

mysql> insert into t2(teacher_name) values("Mrs.Vrushali"),("Mrs.Vishakha"),("Mrs.shanthi guru");
ERROR 1406 (22001): Data too long for column 'teacher_name' at row 1
mysql> insert into t2(teacher_name) values("Mrs.Vrushali"),("Mrs.Vishakha"),("Mrs.shanthi");
ERROR 1406 (22001): Data too long for column 'teacher_name' at row 1
mysql> insert into t2(teacher_name) values("Vrushali"),("Vishakha"),("shanthi");
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from t2;
+----+--------------+
| id | teacher_name |
+----+--------------+
|  1 | Vrushali     |
|  2 | Vishakha     |
|  3 | shanthi      |
+----+--------------+
3 rows in set (0.00 sec)

mysql> create table t3;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table t3(id int unique,sub_name varchar(15),credits int check(credits>10));
Query OK, 0 rows affected (0.07 sec)

mysql> insert into t3 values(1,"DSA",9);
ERROR 3819 (HY000): Check constraint 't3_chk_1' is violated.
mysql> insert into t3 values(1,"DSA",12);
Query OK, 1 row affected (0.01 sec)

mysql> insert into t3 values(2,"DBMS",12);
Query OK, 1 row affected (0.04 sec)

mysql> insert into t3 values(3,"SPOS",22);
Query OK, 1 row affected (0.04 sec)

mysql> insert into t3 values(3,"SPM",22);
ERROR 1062 (23000): Duplicate entry '3' for key 't3.id'
mysql> SELECT * FROM t3;
+------+----------+---------+
| id   | sub_name | credits |
+------+----------+---------+
|    1 | DSA      |      12 |
|    2 | DBMS     |      12 |
|    3 | SPOS     |      22 |
+------+----------+---------+
3 rows in set (0.00 sec)

mysql> 

