with dept_avg(dept_name, val) as
	(select dept_name, avg (instructor.salary) as salary
	 from instructor
	 group by dept_name),
dept_total(salary) as
	(select avg(val)
	 from dept_avg
	)
select dept_name, val
from dept_avg, dept_total
where val > dept_total.salary