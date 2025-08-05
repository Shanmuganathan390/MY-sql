create database sun;
show databases;
use sun;
create table Employee (EMPLOYEE_ID int,FIRSTNAME varchar(40),LAST_NAME varchar(30),SALARY int,JOINING_DATE varchar(30),DEPARTMENT varchar(50),primary key(EMPLOYEE_ID));
select *from Employee;
insert into Employee(EMPLOYEE_ID,FIRSTNAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)values(1,"Venkatesh","S",100000,'08/28/2015',"BANKING"),(2,"Ragavi","P",75000,'08/28/2015',"BUSINESS"),(3,"Gopinath","C",50000,'03/02/2016',"PHARMA"),(4,"Dinesh","G",50000,'03/02/2016',"INSURANCE"),(5,"Saibabu","E",40000,'07/08/2017',"SOFTWARE"),(6,"Hasan","S",29000,'07/08/2017',"MANUFACTURING"),(7,"Divya","P",33000,'07/08/2017',"HEALTHCARE"),(8,"Aravindan","R",40000,'07/08/2017',"HEALTHCARE"),(9,"Sathish","MD",45000,'03/02/2016',"AUTOMOBILE"),(10,"Prasanth","PKP",34000,'03/02/2016',"INSURANCE"),(11,"Vijay","R",25684,'03/02/2016',"BUSINESS"),(12,"Sivakumar","K",54789,'03/02/2016',"SOFTWARE");
create table Incentives(EMPLOYEE_REFERENCE_ID  int,INCENTIVE_DATE varchar(90),INCENTIVE_AMOUNT int,foreign key(EMPLOYEE_REFERENCE_ID) references Employee(EMPLOYEE_ID));
select *from Incentives;
insert into Incentives(EMPLOYEE_REFERENCE_ID,INCENTIVE_DATE,INCENTIVE_AMOUNT)values(1,'01-FEB-16',5000),(2,'01-FEB-16',3000),(3,'01-FEB-17',4000),(1,'01-Jan-17',4500),(2,'01-Jan-17',3500);

-- 01.GET ALL EMPLOYEE DETAILS FROM THE EMPLOYEE TABLE
select * from Employee;

-- 02.GET FIRSTNAME,LAST_NAME FROM THE EMPLOYEE TABLE
select FIRSTNAME,LAST_NAME from Employee;

-- 03 get FIRST_NAME from employee table using alis name"EMPLOYEE NAME"
select FIRSTNAME EMPLOYEENAME from Employee;

-- 04 get FIRST_NAME from employee table in uppercase
select upper(FIRSTNAME) from Employee;

-- 05 get FIRST_NAME from employee table in lowercase
select lower(FIRSTNAME) from Employee;

-- 06 get unique DEPARTMENT  from employee table
select distinct DEPARTMENT from Employee;

-- 07 select first 3 characters from employee
select left(FIRSTNAME,3) AS FIRSTNAME from Employee;

-- 08 get position of 'a' in name'ragavi'from employee table
select  position("a" in FIRSTNAME)position_of_an_in_Ragavi from Employee where EMPLOYEE_ID=2; 

-- 09 get FIRSTNAME from employee table after removing white spaces from rightside
select rtrim(FIRSTNAME) from employee;


-- 10 get FIRSTNAME from employee table after removing white spaces from leftside
select ltrim(FIRSTNAME) from employee;

-- 11 get length of FIRSTNAME from employee table
select length(FIRSTNAME) from Employee;

-- 12 get FIRSTNAME from employee table after replacing 'a' with '$'
select replace(FIRSTNAME, 'a', '$') from Employee;

-- 13 get FIRSTNAME and LAST_NAME as single column from the employee table seprated by a'_'
select concat(FIRSTNAME,"_",LAST_NAME) from Employee;

-- 14 get FIRSTNAME Joining date,Joining month and joining year from employee table
select FIRSTNAME,
substring_index(JOINING_DATE,"/",-1)as JOINING_YEAR,
substring_index(substring_index(JOINING_DATE ,"/",2),"/",-1)AS JOINING_DATE,
substring_index(JOINING_DATE,"/",1)as JOINING_MONTH  from Employee;

-- 15 get all employee details from employee table order by FIRSTNAME ascending
select * from Employee order by FIRSTNAME asc;

-- 16 get all employee details from employee table order by FIRSTNAME ascending
select * from Employee order by FIRSTNAME desc;

-- 17 get employee details froom employee table order by first_name ascending and salary descending
select * from Employee order by FIRSTNAME asc,SALARY desc;

-- 18 get employee details  from employee table whose name is "dinesh"
select * from Employee where FIRSTNAME='Dinesh';

-- 19 get employee details from employee table whose name is'dinesh'and 'roy'
 select * from Employee where FIRSTNAME='Dinesh' or FIRSTNAME='Roy';
 
 -- 20 get employee details from employee table whose name is not'dinesh'and 'roy'
 select * from Employee where FIRSTNAME!='Dinesh' or FIRSTNAME!='Roy';
 
 -- 21 get employee details from employee table whose first name start with's' 
 select * from Employee where FIRSTNAME like 'S%' ;

-- 22 get employee details from employee table whose first name contain with'v' 
 select * from Employee where FIRSTNAME like '%v%';

-- 23 get employee from the employee table whose firstname ends with 'n'
select * from Employee where FIRSTNAME like '%n';

-- 24 get employee from the employee table whose firstname ends with 'n' and contains 4 letters
select * from Employee where FIRSTNAME like '%n____';

-- 25 get employee from the employee table whose first name starts with 'j'and contains 4 letters
select * from Employee where FIRSTNAME like 'J____%';

-- 26 get  employee details from the employee who's salary greater than 60000
select * from Employee where SALARY>60000;

-- 27 get  employee details from the employee who's salary less than 60000
select * from Employee where SALARY<80000;

-- 28 get  employee details from the employee who's salary between 50000 and 80000
select * from Employee where SALARY>50000 and SALARY<80000;

-- 29 get employee details from employee whose name is ragavi and venkatesh
select * from Employee where FIRSTNAME='Venkatesh'or FIRSTNAME='Ragavi';

-- 30 get  name of employee from employee table who has % in lastname TIP.Escape special characters in a query
   select * from Employee where LAST_NAME='%';
   
-- 31 get last name employee table after replacing '@' character with white space
   select replace(LAST_NAME, '@', ' ') as Modified_Last_Name from Employee;
   
-- 32 get Department,total salary with respect to a department from employee table
select DEPARTMENT,sum(SALARY) as total_SALARY from Employee group by DEPARTMENT;

-- 33 GET DEPARTMENT AND TOTAL SALARY WITH RESPECT TO DEPARTMENT IN EMPLOYEE TABLE IN DESENDING ORDER OF TOTAL SALARY 
select DEPARTMENT , sum(SALARY) AS TOTAL_SALARY from Employee group by DEPARTMENT order by sum(SALARY) desc; 

-- 34 GET DEPARTMENT AND NUMBER EMPLOYEE IN DEPARTMENT AND TOTAL SALARY WITH RESPECT TO DEPARTMENT IN EMPLOYEE TABLE IN DESENDING ORDER OF TOTAL SALARY 
select DEPARTMENT,count(EMPLOYEE_ID),sum(SALARY) as TOTAL_SALARY from Employee group by DEPARTMENT order by sum(SALARY) desc;

-- 35 get department wise average salary from employee table order by salary descending
select DEPARTMENT,avg(salary) as average_SALARY from Employee group by DEPARTMENT order by average_SALARY desc;

-- 36 get department wise average salary from employee table order by salary ascending
select DEPARTMENT,avg(SALARY) as Averagesalary from Employee group by DEPARTMENT order by AverageSalary asc;

-- 37 get departmaent wise maximum salary from employee table order by salary ascending
select DEPARTMENT,MAX(SALARY) as MaxSalary from Employee group by DEPARTMENT order by MaxSalary asc;

-- 38 get departmaent wise minimum salary from employee table order by salary ascending
select DEPARTMENT,MIN(SALARY) as MinSalary from Employee group by DEPARTMENT order by MinSalary asc;

-- 39 select no of employees joined with respect to year and month from employee table
select SUBSTRING_INDEX(JOINING_DATE, '/', -1) AS JOINING_YEAR,
	   SUBSTRING_INDEX(JOINING_DATE, '/', 1) AS JOINING_MONTH,
       COUNT(*) AS EMPLOYEE_COUNT from Employee
group by JOINING_YEAR, JOINING_MONTH order by JOINING_YEAR, JOINING_MONTH;

-- 40 select department,total salary with respect to a department from employee table where totla salary greater than 800000 total_salary descending
select DEPARTMENT , sum(SALARY) TOTAL_SALARY from Employee group by DEPARTMENT having sum(SALARY)>800000 order by sum(SALARY) desc;

-- 41 SELECT FIRST NAME , INCENTIVE AMOUNT FROM EMPLOYEE AND INCENTIVE TABLE 
select t1.FIRSTNAME , t2.Incentive_Amount from Employee t1 join Incentives t2 on t1.EMPLOYEE_ID=t2.EMPLOYEE_REFERENCE_ID;

-- 42 SELECT FIRST NAME , INCENTIVE AMOUNT FROM EMPLOYEE AND INCENTIVE TABLE WHO HAVE INCENTIVE MORE THAN 3000
select t1.FIRSTNAME , t2.Incentive_Amount from Employee t1 join Incentives t2 on t1.EMPLOYEE_ID=t2.EMPLOYEE_REFERENCE_ID where Incentive_Amount > 3000;

-- 43 SELECT FIRST NAME AND INCENTIVE AMOUNT FROM EMPLOYEEE AND INCENTIVE TABLE EVEN THEY NOT HAVE INCENTIVE
select t1.FIRSTNAME , t2.Incentive_Amount from Employee t1  left join Incentives t2 on t1.EMPLOYEE_ID=t2.EMPLOYEE_REFERENCE_ID;

-- 44 SELECT FIRST NAME AND INCENTIVE AMOUNT FROM EMPLOYEEE AND INCENTIVE TABLE EVEN THEY NOT HAVE INCENTIVE THAN PUT 0
select t1.FIRSTNAME , ifnull(t2.Incentive_Amount,0) from Employee t1 left join Incentives t2 on t1.EMPLOYEE_ID=t2.EMPLOYEE_REFERENCE_ID ;

-- 45 SELECT FIRST NAME , INCENTIVE AMOUNT FROM EMPLOYEE AND INCENTIVE TABLE  WHO GOT INCENTIVE USING LEFT JOIN
select t1.FIRSTNAME , t2.Incentive_Amount from Employee t1  left join Incentives t2 on t1.EMPLOYEE_ID=t2.EMPLOYEE_REFERENCE_ID 
where t2.Incentive_Amount is not null ;

-- 46 select max incentive with respect to employee from employee table and incentive table using sub query
select FIRSTNAME,(select MAX(Incentive_Amount) from Incentives where EMPLOYEE_REFERENCE_ID = Employee.EMPLOYEE_ID) AS Max_Incentive from Employee;

-- 47 SELECT TOP 2 SALARY FROM THE TABLE
select SALARY TOP_2_SALARY from Employee order by SALARY desc limit 2;

-- 48 SELECT TOP N SALARY FROM THE TABLE
select SALARY TOP_10_SALARY from Employee order by SALARY desc limit 10 ;

-- 49 SELECT 2ND HIGHEST SALARY FROM THE TABLE
select SALARY 2ND_HIGHEST_SALARY from Employee limit 1 offset 1 ;
drop database sun;