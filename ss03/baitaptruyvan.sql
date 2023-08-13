use quanlysinhvien_ss3;

-- 1
select *
from student
where name_student like 'h%';

-- 2
SELECT * 
FROM class 
WHERE MONTH(start_date) = 12;

-- 3
select * 
from `subject`
where credit = 3 or credit = 5;

-- 4
update student
set id_class = 2
where name_student = 'Hung';

-- 5 
select name_student, name_sub, mark
from student, `subject`, mark
order by mark desc, name_student asc;