use quanlysinhvien_ss3;

select address, count(id_student) as 'số lượng học viên'
from student
group by id_student;

select s.id_student, s.name_student, avg(mark)
from student s
join mark m on s.id_student = m.id_student
group by s.id_student, s.name_student;

select s.id_student, s.name_student, avg(mark)
from student s
join mark m on s.id_student = m.id_student
group by s.id_student, s.name_student
having avg(mark) >= all (select avg(mark) from mark group by mark.id_student);