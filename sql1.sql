SELECT address as "name1" FROM vamsi.student;
-- select name,id from student;
select name,marks from student where address='guru' order by name;
select * from student;
select *from student where id=45;
select 1 from student where id=45;
select 'hai' from student where id = 45;
select id,marks from student;
select marks,id from student;
select 
	name,
    id,
    marks
    from student;
select marks as "CGPA" from student;
select (marks-2) as "CGPA" from student;
select * from student where marks = "changed";
select * from student where marks >22;
select * from student where marks >22 and marks < 90;
select * from student where not (marks >22 and marks < 90);
select * from student where marks <=22 or marks >=90;
select * from student where (marks <=22 or marks >=90) and id>32;


/* uses of in operator */
select * from student where id=1 or id=3 or id=34;
select * from student where id in(1,3,34);
select * from student where id in(1,3,34) order by name;
select * from student where id not in(1,3,34);
select * from student where name in("rao","shoyeb","ravi");


/* uses of between operator */
select * from student where id>31 and id<46;
select * from student where id between 31 and 46; 
select * from student where name between 'ravi' and 'shoyeb' order by name;


/* uses of like operator */
select * from student where product like "%sales%";
select * from student where product like "%sales";
select * from student where product like "sale%";
select * from student where NAME like "R%";

select * from student where name like "__o";
select * from student where name like "_a_";
select * from student where name like "sh____";




-- REGEXP OPERATOR.
select * from student where product regexp "sale";


-- ^ beginning of string.
select * from student where product regexp "^sales";


-- $ ending of string.
select * from student where product regexp "sales$"; 


-- | logical OR
-- name begins with r or s.
select * from student where name regexp "^r|^s";


-- [abcde] operator.
select * from student where address regexp "^[bag]";
select * from student where address regexp "^[bg]";


-- [a-z]
select * from student where address regexp "^[b-g]";
select * from student where address regexp "^[a-b]|hi$";


-- IS NULL OPERATOR.
select * from student where marks is null;
select * from student where marks is not null;


-- order by operator
select * from student order by marks desc;
select * from student order by address desc;       
select * from student order by name desc;
select * from student order by name;
-- limit clause
select * from student;
select * from student limit 4;
select * from student order by id desc limit 5;
select * from student limit 0,1;
select * from student limit 0,2;
select * from student limit 0,5;
select * from student limit 1,1;
select * from student limit 1,3;
select * from student limit 2,3;
select * from student;


-- INNER JOIN
-- Querying two tables.
select * from student_1 join student on student_1.name= student.name;
select * from student s join student_1 s1 where s.id=s1.id;
select * from student_1 inner join student on student_1.id= student.id; 
select product,product1,address from student_1 join student on student_1.name= student.name;
select product,product1,address,student_1.name from student_1 join student on student_1.name= student.name;
select product,product1,address,student.name from student_1 join student on student_1.name= student.name;   -- this is 04th line command code    


-- INNER JOIN (ALIAS TO TABLE NAMES)
select product,product1,address,s.name from student_1 s1 join student s on s1.name= s.name;    -- this is the example of 04th line command code


-- Querying multiple tables.
select * from student s join student_1 s1 
	on s.marks=s1.marks 
		join student_2 s2 on s.id=s2.id;
 
 
 select 
	s.name,
    s1.id,
    s.address,
    s1.marks,
    s2.year as "DOB",
    s2.area,
    s2.product 
		from student s join student_1 s1 
		on s.marks=s1.marks 
		join student_2 s2 on s.id=s2.id;


-- self join
-- join the table with itself.
select * from student s join student t on s.id=t.marks; 

select s.name,t.id,t.marks from student s join student t on s.id=t.marks;


-- Explicit join syntax.
-- this is the command commonly i used in every time to join the two tables.
-- we can use "WHERE" and "ON keywords in Explicit join syntax.
select 
	s.name,s.id,addresss,s1.marks,product1 
		from student s join student_1 s1 
		where s.id=s1.id;
        
            -- (OR)
            
select 
	s.name,s.id,addresss,s1.marks,product1 
		from student s inner join student_1 s1 
		on s.id=s1.id;            
        
        
-- implicit join syntax.
-- we cannot use "ON" keyword in implicit join syntax.
-- we can use "WHERE" keyword in implicit join syntax.
select 
	s.name,s.id,addresss,s1.marks,product1
		from student s,student_1 s1
		where s.id=s1.id;
	
-- it will gives the cross joint of two tables(i.e, nxn) in Implicit join syntax .	
select 
	s.name,s.id,addresss,s1.marks,product1
		from student s,student_1 s1;
        
select * from student cross join student;


        
-- subquery syntax and useage.
select id from student s where s.id not in(select s1.id from student_1 s1 );
select id from student_1 s1 where s1.id not in(select s.id from student s);


-- Outer join syntax
-- In outer join their is two types 1)left join , and , 2)right join. 
select * from student s left join student_1 s1 on s.id=s1.id;  
select * from student s right join student_1 s1 on s.id=s1.id;


-- self outer join syntax
select s.name,t.id,t.marks from student s left join student t on s.id=t.marks;
select s.name,t.id,t.marks from student s right join student t on s.id=t.marks; 


-- 'using' clause operator.
-- 'using' clause is used when the two tables have same columns only.
select 
	s.name,s.id,addresss,s1.marks,product1 
		from student s join student_1 s1 
		on s.id=s1.id;  

				-- (OR)	

select 
	s.name,s.id,addresss,s1.marks,product1 
		from student s join student_1 s1 using(id);
        
        

-- Natural join
select * from student natural join student_1;
select name,id,marks from student natural join student_1;



-- Aggregate functions
-- 1)min()
-- 2)max()
-- 3)avg()
-- 4)sum()
-- 5)count()        

-- 1)min(),2)max(),3)avg(),4)sum().
select min(marks) as marks from student;
select min(name) from student;
select max(marks) as "marks" from student;
select max(name) from student;
select avg(marks) from student;
select sum(marks) from student;

select 
	min(marks) as marks,
    max(marks) as "marks",
    avg(marks),
    sum(marks) as Total
		from student;

-- 5)count().
select count(marks) as Total_count from student;
select count(*) as total from student;
select count(*) as count from student where product='manager';
select count(*) as count from student where name regexp "^[r]"; 




-- Group by function.
select name,count(*) as count from student where name regexp "^[r]" group by name; 
select name,count(*) as 'total' from student group by name;
select rollno,count(rollno) as 'total' from student group by rollno;

-- this is 1st query
select s.name,s1.id,s1.addresss,count(*) as 'total' 
from student s join student_1 s1 using(id) group by s.name,s1.id,s1.addresss;

-- 1st and 2nd queries are same.

-- this is 2nd query
select s.name,s1.id,s1.addresss,count(*) as 'total' 
from student s join student_1 s1 on s.id=s1.id group by s.name,s1.id,s1.addresss;




-- having clause.
-- here 'having' clause is used only when after group by clause is declared.
-- and here 'where' clause is also used only when before group by clause is declared. 
select s.name,s1.id,s1.addresss,count(*) as 'total' 
from student s join student_1 s1 using(id) group by s.name,s1.id,s1.addresss having id > 1;


select name,count(*) as count from student where name regexp "^[r]" group by name having name='rao';


-- ANY KEYWORD
SELECT * 
FROM student 
WHERE marks > ANY (SELECT marks FROM student WHERE rollno = 3);


-- ALL KEYWORD
SELECT name 
FROM student 
WHERE marks > ALL (SELECT marks FROM student WHERE rollno = 2);


-- BEST EXAMPLE FOR 'ALL' Keyword 
SELECT name, marks 
FROM student 
WHERE marks < ALL (SELECT marks FROM student WHERE address = 'Hyderabad');


SELECT name, marks 
FROM student 
WHERE marks < ALL (SELECT marks FROM student WHERE address = 'delhi');



SELECT name, marks 
FROM student 
WHERE marks < ALL (SELECT marks FROM student WHERE address = 'agra');


SELECT name, marks 
FROM student 
WHERE marks > ALL (SELECT marks FROM student WHERE rollno = 1);

SELECT name, marks 
FROM student 
WHERE marks > ALL (SELECT marks FROM student WHERE rollno = 3);

-- BEST EXAMPLE FOR ANY KEYWORD
SELECT name, marks 
FROM student 
WHERE marks > ANY (SELECT marks FROM student WHERE product = 'sales manager');

SELECT name, marks 
FROM student 
WHERE marks > ANY (SELECT marks FROM student WHERE product = 'product sales manager');



-- EXISTS
SELECT *
FROM student 
WHERE EXISTS (SELECT 1 FROM student WHERE marks > 85);



SELECT name 
FROM student s1
WHERE EXISTS (SELECT 1 FROM student s2 WHERE s1.rollno = s2.rollno AND s1.id > s2.id);
                            
SELECT * FROM student s1 join student s2 WHERE s1.id > s2.id;