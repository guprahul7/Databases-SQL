-- show databases;
create database Tutorial1;
use Tutorial1;
create table users (Username text);
-- show tables;
desc users;
insert into users (Username) values ('Bob');
insert into users (Username) values ('Vicky');
select * from users;

-- drop table users; -- to delete table
-- delete from users; -- to delete all entries in the users-table

-- # primary key = unique value, usually int type 
drop table users2;
create table users2 (id int primary key, name text, email text);
select * from users2;
desc users2;
insert into users2 (id, name, email) values (2,'bxj','nxk@mail.com');
select * from users2;

-- auto increment the primary key if not specified
drop table users2;
create table users2 (id int primary key auto_increment, name text, email text);
select * from users2;

-- select narrowing down
select * from users2 where id=2;
select name, id from users2 where name = 'bxj';
-- delete from users where id=2;

-- set sql_safe_update=0 -- to allow deletion of values from database


-- operators and comparison
use Tutorial1;
show tables;
select * from users;
drop table users;
create table users (id int primary key auto_increment, name text, age int);
INSERT INTO users VALUES (1,'Bob',46),(2,'Bob',47),(3,'Vicky',25),(4,'Raj',21),(5,'Pete',60),(6,'John',41),(7,'Mark',30),(8,'Sue',53),(9,'Don',25),(10,'John',20),(11,'Syed',33),(12,'Christina',28),(13,'Mario',19),(14,'Justin',23),(15,'Clare',49),(16,'Sarah',73),(17,'Pete',28),(18,'Steve',32),(19,'Zoe',36),(20,'Cori',17),(21,NULL,99),(22,NULL,20);
insert into users values (23, 'Owen',34);
select * from users;

-- COUNT 
select count(*) from users;
show databases;

-- LIKE 
select * from users where name like "%on"; -- ends in on
select * from users where name like "%o%"; -- contains an o;
select * from users where name not like "%o%"; -- does not contain an o;

-- AND OR 
select * from users where age > 30 and name='Bob';

-- UPDATE
update users set name = 'Jim' where id = 1; -- update tablename set columname = value where 
select * from users;

-- ORDER BY 
select * from users order by name;
select * from users where name is not null order by name asc;
select * from users where name is not null order by id desc;
select * from users order by age asc, name desc; -- asc is default

-- LIMIT - offset
select * from users order by id limit 5;
select * from users order by id limit 2, 5; -- offset of 2, so 5 rows from row2 to row7;

-- Time 
select year(now()), time(now()), date(now());
create table moments (id int primary key auto_increment, theYear year, theDate date, theTime time); 
desc moments;
insert into moments (theYear, theDate, theTime) values ('2005', '2014-05-15','08:10:23');
select * from moments;


-- Timestamp Datetime
create table products (name varchar(60), sold_at timestamp default now(), received datetime);
insert into products (name, sold_at, received) values ('automatic dog groomer', '2001-05-15 15:05:23', '2015-04-07 08:01:15');

select year(sold_at), time(sold_at), date(received) from products;

-- Enumeration
-- for values that are limited (eg. gender - male/female, temperature- hot/cold)

-- Unique values - DISTINCT
select distinct name from users;

-- AGGREGATE functions -- count, min, max, variance, sum, avg,
-- select count(*) from users 
-- select min(age) from users.. 

select gender, avg(weight) from survery group by gender;

-- GROUP BY 
-- select country, max(weight) from survey group by country order by max(weight) desc;
# cannot use where with group by, we have to use having
select country, avg(age) from survey group by country having avg(age)>30;
#cannot do this -> select country, avg(age) from survey group by  country where avg(age)>30

# Multiple Tables 
select id as renameID, weight as renameweight,sugar as renamesugar, health as healthscore from survey s;
#we're returning columns with names specified by 'as' and referencing the suvey-table using 's'

#if you have multiple tables, then something like this would be good:
select s.id as renameID, s.weight as renameweight, s.sugar as renamesugar, s.health as healthscore from survey s;

-- FOREIGN KEY -> referencing values from another table (that's why 'foreign')
create table person (id int primary key auto_increment, name varchar(50), address_id int, foreign key (address_id) references address(id));
# here ADDRESS_ID is a column in person table, and ADDRESS is another table which has a column called id
# we are saying that the values in ADDRESS_ID should refer to values from the id column of this address table
