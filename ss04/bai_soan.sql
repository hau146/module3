use ss2;


-- 1
select name_class, count(`account`) as 'số lượng hs'
from student, class
group by name_class;

-- 2
select s.name_student, c.name_class, max(`point`)
from student s
join class c on s.id_class = c.id_class
group by c.name_class;

-- 3
select c.name_class, avg(`point`)
from student s
join class c on s.id_class = c.id_class
group by c.name_class;

-- 4
select name_instructor as 'name', birthday_instructor 'birthday'
from instructor
union
select name_student, birthday_student
from student;

-- 5
SELECT name_student, `point`
FROM student
ORDER BY `point` DESC;

