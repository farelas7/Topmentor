drop table  if exists employees;
drop table if exists department;
drop table  if exists salary_grade;

create table department ( 
  dep_id     Int,  
  dep_name    varchar(14),  
  dep_location        varchar(15),  
  constraint pk_department_dep_id  primary key (dep_id)  
);

create table employees(  
  emp_id    Integer,  
  emp_name   varchar(15),  
  job_name   varchar(10),  
  manager_id Integer ,  
  hire_date date,  
  salary      decimal (10,2),  
  commission     decimal (7,2),  
  dep_id   Int,  
  constraint pk_employees_emp_id  primary key (emp_id),  
  constraint fk_employees_dep_id foreign key (dep_id ) references department (dep_id)  
); 


create table salary_grade(  
  grade    Integer  ,  
  min_salary  integer,  
  max_salary  integer
);



delete from employees ;
delete from department;
delete from salary_grade;


insert into department values (1001,'FINANCE', 'SYDNEY');
insert into department values (2001,'AUDIT', 'MELBOURNE');
insert into department values (3001,'MARKETING', 'PERTH');
insert into department values (4001,'PRODUCTION', 'BRISBANE');


insert into employees values (68319, 'KAYLING', 'PRESIDENT',NULL,'1991-11-18', 6000,NULL,1001);
insert into employees values (66928, 'BLAZE', 'MANAGER',68319,'1991-05-01', 2750,NULL,3001);
insert into employees values (67832, 'CLARE', 'MANAGER',68319,'1991-06-09', 2550,NULL,1001);
insert into employees values (65646, 'JONAS', 'MANAGER',68319,'1991-04-02', 2957,NULL,2001);
insert into employees values (64989, 'ADELYN', 'SALESMAN',66928,'1991-02-20', 1700,400,3001);
insert into employees values (65271, 'WADE', 'SALESMAN',66928,'1991-02-22', 1350,600,3001);
insert into employees values (66564, 'MADDEN', 'SALESMAN',66928,'1991-09-28', 1350,1500,3001);
insert into employees values (68454, 'TUCKER', 'SALESMAN',66928,'1991-09-08', 1600,0,3001);
insert into employees values (68736, 'ADNRES', 'CLERK',67858,'1997-05-23', 1200,NULL,2001);
insert into employees values (69000, 'JULIUS', 'CLERK',66928,'1991-12-03', 1050,NULL,3001);
insert into employees values (69324, 'MARKER', 'CLERK',67832,'1992-01-23', 1400,NULL,1001);
insert into employees values (67858, 'SCARLET', 'ANALYST',65646,'1997-04-19', 3100,NULL,2001);
insert into employees values (69062, 'FRANK', 'ANALYST',65646,'1991-12-03', 3100,NULL,2001);
insert into employees values (63679, 'SANDRINE', 'CLERK',69062,'1990-12-18', 900,NULL,2001);

insert into salary_grade values (1,800,1300);
insert into salary_grade values (2,1301,1500);
insert into salary_grade values (3,1501,2100);
insert into salary_grade values (4,2101,3100);
insert into salary_grade values (5,3101,9999);
SELECT * FROM employees;
SELECT salary FROM employees;
SELECT DISTINCT job_name FROM employees;
SELECT emp_name,format (1.15*salary,'C') AS " Revised Salary" FROM employees;
SELECT concat (emp_name,'   ' ,job_name) AS "Employee & Job" FROM employees;
SELECT concat (emp_name,' (', lower(job_name),') ') AS "Employee" FROM employees;
select convert(char,hire_date ,107) FROM employees;
SELECT emp_name , length(trim(emp_name))FROM employees;
select emp_id, salary , commission from employees
SELECT DISTINCT dep_id,job_name FROM employees;
SELECT * FROM employees WHERE dep_id NOT IN (2001);
SELECT *
FROM employees
WHERE hire_date<('1991-1-1');
SELECT avg(salary)
FROM employees
WHERE job_name = 'ANALYST';
SELECT *
FROM employees
WHERE emp_name = 'BLAZE';
SELECT *
FROM employees
WHERE commission>salary;
SELECT *
FROM employees
WHERE (1.25*salary) > 3000;
SELECT emp_name
FROM employees
WHERE length(emp_name)=6;
SELECT *
FROM employees
WHERE month(hire_date)=01;
SELECT e.emp_name + '  works for  ' + m.emp_name
FROM employees e,
     employees m
WHERE e.manager_id = m.emp_id;
SELECT *
FROM employees
WHERE job_name = 'CLERK';
SELECT *
FROM employees
WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) > 27;
SELECT *
FROM employees
WHERE salary <3500;
SELECT *
FROM employees
WHERE salary <3500;
SELECT *
FROM employees
WHERE year(hire_date) = '1991';
SELECT e.emp_id,
       e.emp_name,
       e.hire_date,
       e.salary
FROM employees e
WHERE hire_date <'1991-04-01';
SELECT e.emp_name,
       e.job_name
FROM employees e
WHERE manager_id IS NULL;
SELECT *
FROM employees
WHERE hire_date = '1991-05-01';
SELECT emp_id,
       emp_name,
       salary,
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS Experience
FROM employees
WHERE manager_id = 68319;
SELECT emp_id,
       emp_name,
       salary,
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS Experience
FROM employees
WHERE (salary / 30) > 100;
SELECT emp_name, hire_date
FROM employees
WHERE Dateadd (month, 96, hire_date) > '1999-12-31';
SELECT *
FROM employees
WHERE salary % 2 = 1;
SELECT *
FROM employees
WHERE length(format (salary, '#####')) = 3;
SELECT *
FROM employees
WHERE month (hire_date) =04;
SELECT *
FROM employees
WHERE day(hire_date) < '19';
SELECT *
FROM employees
WHERE job_name = 'SALESMAN'
  AND timestampdiff(month, hire_date, curdate())  > 10;
SELECT *
FROM employees
WHERE year(hire_date) = '1991'
  AND (dep_id =3001
       OR dep_id =1001);
       
SELECT *
FROM employees
WHERE dep_id=1001
  OR dep_id=2001;
SELECT *
FROM employees
WHERE job_name ='CLERK'
  AND dep_id = 2001;
  SELECT emp_id,
       emp_name,
       salary,
       job_name
FROM employees
WHERE 12*(salary+commission) < 34000
  AND commission IS NOT NULL
  AND commission < salary
  AND job_name = 'SALESMAN'
  AND dep_id = 3001;
  SELECT *
FROM employees
WHERE job_name IN ('CLERK','MANAGER');
SELECT *
FROM employees
WHERE job_name IN ('CLERK','MANAGER');
SELECT *
FROM employees
WHERE FORMAT (hire_date,'MMM') NOT IN ('FEB');
SELECT *
FROM employees
WHERE FORMAT (hire_date,'MMM') NOT LIKE 'FEB%';
SELECT *
FROM employees
WHERE hire_date BETWEEN '1991-01-01' AND '1991-12-31';
SELECT *
FROM employees
WHERE hire_date BETWEEN '1991-06-01' AND '1991-06-30';
SELECT *
FROM employees
WHERE 12*salary BETWEEN 24000 AND 50000;
SELECT *
FROM employees
WHERE format  (hire_date,'dd-MMM-yy') IN ('01-MAY-91',
                                         '20-FEB-91',
                                         '03-DEC-91');
                                         
SELECT *
FROM employees
WHERE manager_id IN (63679,
                     68319,
                     66564,
                     69000);
                     SELECT *
FROM employees
WHERE hire_date BETWEEN '1992-07-01' AND '1992-12-31';

SELECT *
FROM employees
WHERE year(hire_date) BETWEEN '1990' AND '1999';
SELECT *
FROM employees
WHERE job_name = 'MANAGER'
  AND (dep_id = 1001
       OR dep_id =2001);
       SELECT *
FROM employees
WHERE format (hire_date,'MMM') = 'FEB'
  AND salary BETWEEN 1000 AND 2000;
SELECT *
FROM employees
WHERE year(hire_date) NOT IN ('1991');
SELECT e.emp_id,
       e.emp_name,
       e.job_name,
       e.manager_id,
       e.hire_date,
       e.salary,
       e.commission,
       e.dep_id,
       d.dep_name
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id;
SELECT e.emp_name,
       e.job_name,
       (12*e.salary)"Annual Salary",
       e.dep_id,
       d.dep_name,
       s.grade
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND (((12*e.salary)>= 60000)
       OR (e.job_name != 'ANALYST'))
       
      SELECT w.emp_name,
       w.job_name,
       w.manager_id,
       w.salary,
       m.emp_name AS Manager,
       m.emp_id,
       m.salary AS Manager_Salary
FROM employees w
JOIN employees m
  ON w.manager_id = m.emp_id
WHERE w.salary > m.salary;
SELECT e.emp_name,
       e.dep_id,
       e.salary,
       e.commission
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND d.dep_location = 'PERTH'
  AND e.salary BETWEEN 2000 AND 5000;
  SELECT s.grade,
       e.emp_name
FROM employees e,
     salary_grade s
WHERE e.dep_id IN (1001,
                   3001)
  AND hire_date < ('1992-12-31')
  AND (e.salary BETWEEN s.min_salary AND s.max_salary
       AND s.grade NOT IN (4));
       SELECT w.emp_id,
       w.emp_name,
       w.job_name,
       w.manager_id,
       w.hire_date,
       w.salary,
       w.dep_id,
       m.emp_name
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND m.emp_name = 'JONAS';
  SELECT e.emp_name,
       e.salary
FROM employees e,
     salary_grade s
WHERE e.emp_name = 'FRANK'
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND e.salary = s.max_salary ;
  SELECT *
FROM employees
WHERE job_name IN ('MANAGER',
                   'ANALYST')
  AND salary BETWEEN 2000 AND 5000
  AND commission IS NULL;
  
SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       e.salary,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND d.dep_location IN ('PERTH',
                         'MELBOURNE')
  AND TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) > 10;
  SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       e.salary,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND d.dep_location IN ('SYDNEY',
                         'MELBOURNE')
  AND year(e.hire_date) = '1991'
  AND e.salary BETWEEN 2000 AND 5000;
  SELECT e.dep_id,
       e.emp_id,
       e.emp_name,
       e.salary,
       d.dep_name,
       d.dep_location,
       s.grade
FROM employees e,
     salary_grade s,
     department d
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND s.grade IN (3,4,
                  5)
  AND TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) > 5
  AND (d.dep_name = 'MARKETING'
       AND D.dep_location IN ('MELBOURNE',
                              'PERTH'));
                              
                              SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.hire_date < m.hire_date;
  SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
  AND s.grade = 4;
SELECT e.emp_name
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND d.dep_name IN ('PRODUCTION',
                     'AUDIT')
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND e.emp_name NOT IN ('MARKER',
                         'ADELYN')
  AND YEAR(hire_date) >'1991';
  SELECT * 
FROM employees 
ORDER BY salary ASC;
SELECT *
FROM employees
ORDER BY dep_id ASC,
         job_name DESC;
         SELECT DISTINCT job_name
FROM employees
ORDER BY job_name DESC;
SELECT emp_id,
       emp_name,
       salary Monthly_Salary,
       salary/30 Daily_Salary,
       12*salary Anual_Salary
FROM employees
ORDER BY Anual_Salary ASC;
SELECT *
FROM employees
WHERE job_name='CLERK'
  OR job_name='ANALYST'
ORDER BY job_name DESC;
SELECT dep_location
FROM department d,
     employees e
WHERE e.emp_name = 'CLARE'
  AND e.dep_id = d.dep_id ;
SELECT *
FROM employees
WHERE hire_date IN ('1991-5-01',
                    '1991-12-03',
                    '1990-01-19')
ORDER BY hire_date ASC;
SELECT *
FROM employees
WHERE salary < 1000
ORDER BY salary;
SELECT *
FROM employees
ORDER BY salary ASC;
SELECT *
FROM employees e
ORDER BY e.job_name ASC,
         e.emp_id DESC ;
SELECT DISTINCT job_name
FROM employees
WHERE dep_id IN (2001,
                 3001)
ORDER BY job_name DESC;
SELECT *
FROM employees
WHERE job_name NOT IN ('PRESIDENT',
                       'MANAGER')
ORDER BY salary ASC;
SELECT *
FROM employees
WHERE (12*salary) < 25000
ORDER BY salary ASC;
SELECT e.emp_id,
       e.emp_name,
       12*salary "Annual Salary",
       (12*salary)/365 "Daily Salary"
FROM employees e
WHERE e.job_name = 'SALESMAN'
ORDER BY "Annual Salary" ASC;
SELECT emp_id,
       emp_name,
       hire_date,
       CURRENT_DATE,
       age(CURRENT_DATE, hire_date) EXP
FROM employees
ORDER BY EXP ASC;
SELECT *
FROM employees
WHERE hire_date>('1991-6-30')
  AND year(hire_date)=1991
ORDER BY job_name ASC;
SELECT *
FROM employees e,
     department d
WHERE (dep_name = 'FINANCE'
       OR dep_name ='AUDIT')
  AND e.dep_id = d.dep_id
ORDER BY e.dep_id ASC;
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
ORDER BY grade ASC;
SELECT e.emp_name,
       e.job_name,
       (12*e.salary)"Annual Salary",
       e.dep_id,
       d.dep_name,
       s.grade
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND (((12*e.salary)>= 60000)
       OR (e.job_name != 'ANALYST'))
       SELECT e.emp_name,
       e.job_name,
       e.salary,
       s.grade,
       d.dep_name
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND e.job_name NOT IN('CLERK')
ORDER BY e.salary DESC;
SELECT e.emp_id,
       e.emp_name,
       e.salary,
       s.grade,
       d.dep_name,
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS "Experience",
       12 * e.salary "Annual Salary"
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id IN (1001,
                   2001)
  AND e.dep_id = d.dep_id
  AND e.salary BETWEEN s.min_salary AND s.max_salary ;
  
SELECT *
FROM employees e,
     department d
WHERE e.dep_id= d.dep_id;
SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.hire_date < m.hire_date;
  SELECT e.emp_id,
       e.emp_name,
       e.salary,
       e.dep_id
FROM employees E
WHERE e.dep_id = 1001
ORDER BY e.salary ASC;
SELECT max(salary)
FROM employees;
SELECT job_name,
       avg(salary),
       avg(salary+commission)
FROM employees
GROUP BY job_name;
SELECT job_name,
       sum(12*salary)
FROM employees
WHERE year(hire_date) = '1991'
GROUP BY job_name;
SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id ;
SELECT e.emp_id,
       e.emp_name,
       e.dep_id,
       d.dep_location,
       d.dep_name
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND e.dep_id IN (1001,
                   2001);
SELECT e.emp_id,
       e.emp_name,
       e.salary,
       s.grade
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary ;
SELECT w.manager_id,
       count(*)
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
GROUP BY w.manager_id
ORDER BY w.manager_id ASC;
SELECT dep_id,
       job_name,
       count(*)
FROM employees
GROUP BY dep_id,
         job_name;
SELECT dep_id,
       count(*)
FROM employees
GROUP BY dep_id
HAVING count(*) >= 2;
SELECT s.grade,
       count(*),
       max(salary)
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
GROUP BY s.grade;
SELECT d.dep_name,
       s.grade,
       count(*)
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND e.job_name = 'SALESMAN'
  AND e.salary BETWEEN s.min_salary AND s.max_salary
GROUP BY d.dep_name,
         s.grade
HAVING count(*) >= 2;
SELECT dep_id,
       count(*)
FROM employees
GROUP BY dep_id
HAVING count(*)<4;
SELECT d.dep_name,
       count(*)
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_name
HAVING count(*) >= 2;
SELECT d.dep_name,
       count(*)
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_name
HAVING count(*) >= 2;
SELECT emp_id,
       count(*)
FROM employees
GROUP BY emp_id;
SELECT count(*),
       avg(salary),
       dep_id,
       job_name
FROM employees
GROUP BY dep_id,
         job_name;
         SELECT emp_name
FROM employees
WHERE emp_name LIKE 'A%'
  AND len(trim(emp_name))=6;
  SELECT *
FROM employees
WHERE len(trim(emp_name))=6
  AND emp_name LIKE '__R%';
  SELECT *
FROM employees
WHERE len(trim(emp_name))=6
  AND emp_name LIKE 'A%N';
  SELECT *
FROM employees
WHERE FORMAT (hire_date,'MMM') LIKE '_a%';
SELECT *
FROM employees
WHERE emp_name LIKE '%AR%';
SELECT *
FROM employees
WHERE format(hire_date, 'yy') LIKE '9%';
SELECT *
FROM employees
WHERE emp_id  NOT LIKE '68%';
SELECT *
FROM employees
WHERE emp_name LIKE '%A%';
SELECT *
FROM employees
WHERE emp_name LIKE '%S'
  AND LEN (trim(emp_name)) = 6;
  SELECT *
FROM employees
WHERE format (hire_date,'MMM') LIKE '%A%';
SELECT *
FROM employees
WHERE FORMAT (hire_date,'MMM') LIKE '_A%';
SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees);
SELECT e.emp_id,
       e.emp_name,
       e.salary,
       d.dep_name
FROM employees e,
     department d
WHERE d.dep_location IN ('SYDNEY',
                         'PERTH')
  AND e.dep_id = d.dep_id
  AND e.emp_id IN
    (SELECT e.emp_id
     FROM employees e
     WHERE e.job_name IN ('MANAGER',
                          'ANALYST')
       AND TIMESTAMPDIFF(YEAR, hire_date, CURDATE())> 5)
       AND e.commission IS NULL
ORDER BY d.dep_location ASC;
SELECT 
    E.emp_id,
    E.emp_name,
    E.salary,
    D.dep_name,
    D.dep_location,
    E.dep_id,
    E.job_name
FROM employees E
JOIN department D 
    ON E.dep_id = D.dep_id
WHERE (
        D.dep_location = 'SYDNEY'
        OR D.dep_name = 'FINANCE'
      )
  AND E.emp_id IN (
        SELECT emp_id
        FROM employees E
        WHERE (12 * E.salary) > 28000
          AND E.salary NOT IN (3000, 2800)
          AND E.job_name <> 'MANAGER'
          AND (
                CAST(emp_id AS CHAR) LIKE '__3%'
                OR CAST(emp_id AS CHAR) LIKE '__7%'
              )
    )
ORDER BY E.dep_id ASC,
         E.job_name DESC;
         
SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
  AND s.grade IN (2, 3);

SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
  AND s.grade IN (4,
                  5)
  AND e.emp_id IN
    (SELECT e.emp_id
     FROM employees e
     WHERE e.job_name IN ('MANAGER',
                          'ANALYST'));
SELECT *
FROM employees
WHERE salary >
    (SELECT salary
     FROM employees
     WHERE emp_name = 'JONAS');
SELECT *
FROM employees
WHERE job_name =
    (SELECT job_name
     FROM employees
     WHERE emp_name = 'FRANK');
SELECT *
FROM employees
WHERE hire_date <
    (SELECT hire_date
     FROM employees
     WHERE emp_name = 'ADELYN');
SELECT *
FROM employees e,
     department d
WHERE d.dep_id = 2001
  AND e.dep_id = d.dep_id
  AND e.job_name IN
    (SELECT e.job_name
     FROM employees e,
          department d
     WHERE e.dep_id = d.dep_id
       AND d.dep_id =1001);

SELECT *
FROM employees
WHERE salary IN
    (SELECT salary
     FROM employees e
     WHERE e.emp_name IN ('FRANK',
                          'BLAZE')
       AND employees.emp_id <> e.emp_id);
SELECT *
FROM employees
WHERE job_name =
    (SELECT job_name
     FROM employees
     WHERE emp_name = 'MARKER' )
  OR salary>
    (SELECT salary
     FROM employees
     WHERE emp_name = 'ADELYN');
SELECT *
FROM employees
WHERE salary >
    (SELECT max(salary+commission)
     FROM employees
     WHERE job_name = 'SALESMAN');
SELECT *
FROM employees e,
     department d
WHERE d.dep_location IN ('PERTH',
                         'BRISBANE')
  AND e.dep_id = d.dep_id
  AND e.hire_date <
    (SELECT e.hire_date
     FROM employees e
     WHERE e.emp_name = 'BLAZE') ;
     SELECT *
FROM employees e
WHERE e.dep_id IN (
        SELECT d.dep_id
        FROM department d
        WHERE d.dep_name IN ('FINANCE', 'AUDIT')
    )
  AND e.salary > (
        SELECT salary
        FROM employees
        WHERE emp_name = 'ADELYN'
    )
  AND e.hire_date < (
        SELECT hire_date
        FROM employees
        WHERE emp_name = 'FRANK'
    )
  AND e.emp_id IN (
        SELECT e.emp_id
        FROM employees e,
             salary_grade s
        WHERE e.salary BETWEEN s.min_salary AND s.max_salary
          AND s.grade IN (3, 4)
    )
ORDER BY e.hire_date ASC;
SELECT *
FROM employees
WHERE job_name IN
    (SELECT job_name
     FROM employees
     WHERE emp_name = 'SANDRINE'
       OR emp_name = 'ADELYN');
SELECT e.job_name
FROM employees e
WHERE e.dep_id = 1001
  AND e.job_name NOT IN
    (SELECT job_name
     FROM employees
     WHERE dep_id =2001);
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees);
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees
     WHERE dep_id IN
         (SELECT d.dep_id
          FROM department d
          WHERE d.dep_name = 'MARKETING'));

SELECT e.emp_id, e.emp_name, e.job_name, e.hire_date,e.salary
FROM employees e
WHERE e.dep_id IN
    (SELECT d.dep_id
     FROM department d
     WHERE d.dep_location = 'PERTH')
  AND e.hire_date IN
    (SELECT max(hire_date)
     FROM employees
     WHERE emp_id IN
         (SELECT emp_id
          FROM employees e,
               salary_grade s
          WHERE e.salary BETWEEN s.min_salary AND s.max_salary
            AND s.grade = 3)) ;
            SELECT *
FROM employees
WHERE hire_date <
    (SELECT max(hire_date)
     FROM employees
     WHERE manager_id IN
         (SELECT emp_id
          FROM employees
          WHERE emp_name = 'KAYLING'));

SELECT *
FROM employees
WHERE dep_id IN
    (SELECT dep_id
     FROM department
     WHERE department.dep_location ='SYDNEY')
  AND emp_id IN
    (SELECT emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_salary AND s.max_salary
       AND s.grade IN (3,
                       4,
                       5) )
  AND job_name != 'PRESIDENT'
  AND salary >
    (SELECT max(salary)
     FROM employees
     WHERE dep_id IN
         (SELECT dep_id
          FROM department
          WHERE department.dep_location = 'PERTH')
       AND job_name IN ('MANAGER',
                        'SALESMAN')
       AND manager_id NOT IN
         (SELECT emp_id
          FROM employees
          WHERE emp_name = 'KAYLING'));
          
SELECT *
FROM employees
WHERE hire_date IN (
    SELECT MIN(hire_date)
    FROM employees
    WHERE YEAR(hire_date) = 1991
);

SELECT *
FROM employees
WHERE job_name IN
    (SELECT job_name
     FROM employees
     WHERE hire_date IN
         (SELECT min(hire_date)
          FROM employees
          WHERE YEAR(hire_date) ='1991'));
          
SELECT *
FROM employees
WHERE hire_date IN
    (SELECT min(hire_date)
     FROM employees
     WHERE emp_id IN
         (SELECT emp_id
          FROM employees e,
               salary_grade s
          WHERE e.salary BETWEEN s.min_salary AND s.max_salary
            AND s.grade IN (4,
                            5)))
  AND manager_id IN
    (SELECT emp_id
     FROM employees
     WHERE emp_name = 'KAYLING');
     
SELECT sum(salary)
FROM employees
WHERE job_name = 'MANAGER';

SELECT sum(salary)
FROM employees
WHERE emp_id IN
    (SELECT emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_salary AND s.max_salary
       AND s.grade = 3);
       
       SELECT *
FROM employees
WHERE dep_id =1001
  AND salary >
    (SELECT AVG (salary)
     FROM employees
     WHERE dep_id = 2001);
SELECT d.dep_id,
       d.dep_name,
       d.dep_location,
       count(*)
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_id
HAVING count(*) =
  (SELECT max(mycount)
   FROM
     (SELECT COUNT(*) mycount
      FROM employees
      GROUP BY dep_id) a);
      
      SELECT *
FROM employees
WHERE manager_id IN
    (SELECT emp_id
     FROM employees
     WHERE emp_name = 'JONAS');
SELECT *
FROM employees
WHERE dep_id NOT IN
    (SELECT dep_id
     FROM department
     WHERE dep_name = 'MARKETING');

SELECT e.emp_name,
       e.job_name,
       d.dep_name,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND e.emp_id IN
    (SELECT manager_id
     FROM employees) ;

SELECT e.emp_name,
       e.dep_id
FROM employees e
WHERE e.salary IN
    (SELECT max(salary)
     FROM employees
     GROUP BY dep_id) ;
SELECT *
FROM employees
WHERE salary >=
    (SELECT (max(salary)+min(salary))/2
     FROM employees);
SELECT *
FROM employees m
WHERE m.emp_id IN
    (SELECT manager_id
     FROM employees)
  AND m.salary >
    (SELECT avg(e.salary)
     FROM employees e
     WHERE e.manager_id = m.emp_id );

SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary < m.salary
  AND w.salary > ANY
    (SELECT salary
     FROM employees
     WHERE emp_id IN
         (SELECT manager_id
          FROM employees));
SELECT e.emp_name,
       d.maxsal,
       e.dep_id AS "Current Salary"
FROM employees e,

  (SELECT avg(salary) maxsal,
          dep_id
   FROM employees
   GROUP BY dep_id) d
WHERE e.dep_id=d.dep_id;
SELECT *
FROM employees e
WHERE 5>
    (SELECT count(*)
     FROM employees
     WHERE e.salary >salary);
SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees)
  AND manager_id NOT IN
    (SELECT emp_id
     FROM employees
     WHERE job_name = 'PRESIDENT');

SELECT e.emp_name,
       e.salary,
       e.commission,

  (SELECT sum(salary+commission)
   FROM employees) NETPAY
FROM employees e
WHERE
    (SELECT sum(salary+commission)
     FROM employees) > ANY
    (SELECT salary
     FROM employees
     WHERE emp_id =e.emp_id) ;

SELECT *
FROM department d
WHERE length(dep_name) IN
    (SELECT count(*)
     FROM employees e
     WHERE e.dep_id = d.dep_id );
SELECT *
FROM department d
WHERE length(dep_name) IN
    (SELECT count(*)
     FROM employees e
     WHERE e.dep_id = d.dep_id );
SELECT dep_name
FROM department
WHERE dep_id IN
    (SELECT dep_id
     FROM employees
     GROUP BY dep_id
     HAVING count(*) IN
       (SELECT max(mycount)
        FROM
          (SELECT COUNT(*) mycount
           FROM employees
           GROUP BY dep_id) a));
SELECT *
FROM employees e
WHERE hire_date IN
    (SELECT hire_date
     FROM employees
     WHERE e.emp_id <> emp_id);
SELECT d.dep_name
FROM department d,
     employees e
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_name
HAVING count(*) >
  (SELECT AVG (mycount)
   FROM
     (SELECT COUNT(*) mycount
      FROM employees
      GROUP BY dep_id) a);
SELECT m.emp_name,
       count(*)
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
GROUP BY m.emp_name
HAVING count(*) =
  (SELECT max(mycount)
   FROM
     (SELECT COUNT(*) mycount
      FROM employees
      GROUP BY manager_id) a);
      
      
SELECT *
FROM employees w
WHERE salary < ANY
    (SELECT salary
     FROM employees
     WHERE w.emp_id=manager_id);

SELECT *
FROM employees
WHERE manager_id IN
    (SELECT emp_id
     FROM employees
     WHERE emp_name = 'BLAZE');

SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees);

SELECT w.emp_name,
       m.emp_name,

  (SELECT emp_name
   FROM employees
   WHERE m.manager_id = emp_id) "his MANAGER"
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND m.emp_name = 'JONAS';
SELECT *
FROM employees
WHERE salary IN
    (SELECT min(salary)
     FROM employees
     GROUP BY job_name)
ORDER BY salary ASC;
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees
     GROUP BY job_name)
ORDER BY salary DESC;
SELECT *
FROM employees e
WHERE hire_date IN
    (SELECT max(hire_date)
     FROM employees
     WHERE e.dep_id = dep_id )
ORDER BY hire_date DESC;
SELECT e.emp_name,
       e.salary,
       e.dep_id
FROM employees e
WHERE salary >
    (SELECT avg(salary)
     FROM employees
     WHERE e.dep_id = dep_id )
ORDER BY dep_id;

SELECT *
FROM employees
WHERE salary =
    (SELECT max(salary)
     FROM employees
     WHERE commission IS NOT NULL);

SELECT emp_name,
       job_name,
       salary
FROM employees
WHERE dep_id != 1001
  AND job_name IN
    (SELECT job_name
     FROM employees
     WHERE dep_id = 3001)
  AND salary IN
    (SELECT salary
     FROM employees
     WHERE dep_id = 3001);
SELECT dep_id,
       emp_name,
       job_name,
       salary,
       salary+commission "Net Salary"
FROM employees
WHERE job_name = 'SALESMAN'
  AND salary+commission IN
    (SELECT max(salary+commission)
     FROM employees
     WHERE commission IS NOT NULL);

SELECT dep_id,
       emp_name,
       salary,
       job_name,
       salary+commission "Net Salary"
FROM employees e
WHERE 2-1 = (
  SELECT count(DISTINCT emp.salary+emp.commission)
  FROM employees emp WHERE emp.salary+emp.commission>e.salary+e.commission);

SELECT dep_id,
       avg(salary)
FROM employees
GROUP BY dep_id
HAVING avg(salary) <
  (SELECT avg(salary)
   FROM employees);
SELECT *
FROM department
WHERE dep_id IN
    (SELECT DISTINCT dep_id
     FROM employees);

SELECT *
FROM employees
WHERE dep_id IN
    (SELECT dep_id
     FROM department
     WHERE department.dep_location = 'PERTH');

SELECT *
FROM employees
WHERE emp_id IN
    (SELECT emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_salary AND s.max_salary
       AND s.grade IN (2,
                       3))
  AND dep_id IN
    (SELECT dep_id
     FROM department
     WHERE dep_LOCATION='PERTH');
     
     SELECT *
FROM employees
WHERE job_name =
    (SELECT job_name
     FROM employees
     WHERE emp_name = 'ADELYN')
  OR salary >
    (SELECT salary
     FROM employees
     WHERE emp_name = 'WADE');
SELECT *
FROM employees
WHERE dep_id = 1001
  AND salary >
    (SELECT salary
     FROM employees
     WHERE emp_name = 'ADELYN');

SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees
     WHERE hire_date<
         (SELECT hire_date
          FROM employees
          WHERE emp_name = 'KAYLING' )
       AND hire_date >
         (SELECT hire_date
          FROM employees
          WHERE emp_name = 'SANDRINE'))
  AND manager_id IS NOT NULL;

SELECT e.emp_id,
       e.emp_name,
       d.dep_location,
       e.salary,
       d.dep_name
FROM employees e,
     department d
WHERE e.dep_id=d.dep_id
  AND e.dep_id IN
    (SELECT dep_id
     FROM employees
     WHERE emp_name = 'KAYLING'
       AND employees.emp_id <> e.emp_id);

SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_salary AND s.max_salary
  AND s.grade >
    (SELECT s.grade
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_salary AND s.max_salary
       AND e.emp_name = 'MARKER') ;
       
SELECT *
FROM employees e,
     department d,
     salary_grade s
WHERE e.dep_id = d.dep_id
  AND d.dep_location IN ('SYDNEY', 'PERTH')
  AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND (
        s.grade IN (
            SELECT s.grade
            FROM employees e,
                 salary_grade s
            WHERE e.salary BETWEEN s.min_salary AND s.max_salary
              AND e.emp_name = 'TUCKER'
        )
        OR DATEDIFF(CURRENT_DATE, hire_date) >
           (
             SELECT DATEDIFF(CURRENT_DATE, hire_date)
             FROM employees
             WHERE emp_name = 'SANDRINE'
           )
      );
      
      SELECT *
FROM employees
WHERE salary IN
    (SELECT salary
     FROM employees e
     WHERE employees.emp_id <> e.emp_id);
SELECT *
FROM employees e
WHERE salary+commission IN
    (SELECT salary+commission
     FROM employees e,
          department d
     WHERE e.dep_id=d.dep_id
       AND d.dep_name = 'MARKETING'
       AND e.job_name = 'SALESMAN');
SELECT *
FROM employees
WHERE hire_date IN
    (SELECT max(hire_date)
     FROM employees
     WHERE dep_id = 3001) AND dep_id=3001;


SELECT *
FROM employees
WHERE salary =
    (SELECT max(salary)
     FROM employees e,
          department d
     WHERE e.dep_id = d.dep_id
       AND d.dep_location = 'PERTH'
       AND hire_date <
         (SELECT max(hire_date)
          FROM employees e,
               salary_grade s
          WHERE e.salary BETWEEN s.min_salary AND s.max_salary
            AND s.grade = 2));
            
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees
     WHERE manager_id IN
         (SELECT emp_id
          FROM employees
          WHERE emp_name = 'KAYLING'));
SELECT e.emp_name,
       e.salary,
       e.commission
FROM employees e
WHERE
    (SELECT max(salary+commission)
     FROM employees) >= ANY
    (SELECT salary
     FROM employees);

SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary> m.salary;

SELECT max(myavg)
FROM
  (SELECT avg(salary) myavg
   FROM employees
   WHERE job_name != 'PRESIDENT'
   GROUP BY job_name) a;

SELECT count(*)
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees);

SELECT b.dep_id,
       count(a.dep_id)
FROM department b
LEFT OUTER JOIN employees a ON a.dep_id=b.dep_id
GROUP BY b.dep_id
HAVING count(a.dep_id) = 0;




























































































































