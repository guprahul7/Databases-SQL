# Joins 
-- select * from person, address (this returns cartesian product, each entry in person table is combined with all entries in address table)
#STEP by STEP
-- select * from person p, address a (renamed tables for easy use)
-- select p.id, p.name, p.address_id, a.id, a.street from person p, address a (returning columns from respective tables)
-- select p.id as personID, p.name, p.address_id as PersonAddress, a.id as AddressID, a.street as Street from person p, address a (returning renamed columns from respective tables, using 'as')

#instead of using join, trying the same using 'where' to see if it works
-- select p.id as personID, p.name, p.address_id as PersonAddress, a.id as AddressID, a.street as Street from person p, address a where p.address_id = a.id


-- JOIN (same as inner-join)
select p.id as personID, p.name, p.address_id as PersonAddress, a.id as AddressID, a.street as Street from person p join address a on a.id = p.address_id;
select p.name, a.street from person p join address a on p.address_id = a.id;
-- OUTER join (

-- Left join
#Returns all rows from the left table, and corresponding matches from the right table

-- Right Join
#Returns all rows from the right table, and corresponding matches from the left table

-- Multiple Joins 
select su.id, country, age, sm.question, e.question from SURVEY su join SMOKE sm on su.smoke = sm.id join EXERCISE e on e.id = su.exercise;


-- self join, and arithmetic,
select s1.id as 'S1 ID' from seats s1 join seats s2 on s1.id+1 = s2.id where s1.free=true and s2.free=true