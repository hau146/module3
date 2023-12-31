create database quanlysinhvien_ss3;
use quanlysinhvien_ss3;

create table class(
id_class int auto_increment primary key,
class_name varchar(50),
start_date date,
`status` bit
);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

create table student(
id_student int auto_increment primary key,
name_student varchar(50),
address varchar(50),
phone varchar(20),
`status` bit,
id_class int,
foreign key(id_class) references class(id_class)
);

INSERT INTO student (name_student, address, phone, `status`, id_class)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (name_student, address, `status`, id_class)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (name_student, address, phone, `status`, id_class)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

create table `subject`(
id_sub int auto_increment primary key,
name_sub varchar(50),
credit int,
`status` bit
);

INSERT INTO `subject`
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
 create table mark(
 id_mark int auto_increment primary key,
 id_sub int,
 id_student int,
 mark int,
 exam_times int,
 foreign key(id_sub) references `subject`(id_sub),
 foreign key(id_student) references student(id_student)
 );
 
INSERT INTO Mark (id_sub, id_student, mark, exam_times)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);

select * 
from student
where `status` = true;

select * 
from `subject`
where credit < 10;

select s.id_student, s.name_student, c.class_name
from student s 
join class c 
on s.id_class = c.id_class
where c.class_name = 'A1';

select s.id_student, s.name_student, sub.name_sub, m.mark
from student s 
join mark m 
on s.id_student = m.id_student 
join `subject` sub on m.id_sub = sub.id_sub
where sub.name_sub = 'CF';