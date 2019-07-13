

--1
select e.emp_no,last_name,first_name,gender,salary from employees e
join salaries s on e.emp_no=s.emp_no;

--2
select * from employees
where extract(year from hire_date)='1986';

--3
select dt.dept_no,dt.dept_name,dm.emp_no,first_name,last_name,to_date,from_date from employees e
join dept_manager dm on e.emp_no=dm.emp_no
join departments dt on dm.dept_no=dt.dept_no;

--4
select e.emp_no,last_name,first_name,dept_name from employees e
join dept_emp de on e.emp_no=de.emp_no
join departments dt on de.dept_no=dt.dept_no;

--5

select * from employees
where first_name='Hercules'
and last_name like 'B%';


--6

select e.emp_no,last_name,first_name,dept_name from employees e
join dept_emp de on e.emp_no=de.emp_no
join departments dt on de.dept_no=dt.dept_no
where dt.dept_name like '%Sales%';

--7

select e.emp_no,last_name,first_name,dept_name from employees e
join dept_emp de on e.emp_no=de.emp_no
join departments dt on de.dept_no=dt.dept_no
where dt.dept_name like '%Sales%'
or dt.dept_name like '%Development%';

--8

select last_name,count(last_name) as Frequency
from employees
group by last_name
order by frequency desc;

