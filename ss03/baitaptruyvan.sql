use quanlysinhvien_ss3;

-- 1
select *
from student
where name_student like 'h%';

-- cách 2
select *
from student
where substring_index(name_student, " ", -1) like 'h%';

-- 2
SELECT * 
FROM class 
WHERE MONTH(start_date) = 12;

-- 3
select * 
from `subject`
where credit = 3 or credit = 5;

-- 4
set sql_safe_updates = 0;
update student
set id_class = 2
where name_student = 'Hung';
set sql_safe_updates = 1;

-- 5
select s.name_student, sub.name_sub, m.mark
from mark m
join student s on m.id_student = s.id_student
join `subject` sub on m.id_sub = sub.id_sub
order by mark desc, name_student asc;