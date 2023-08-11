create table class(
id int primary key auto_increment,
`name` varchar(50)
);

create table teacher(
id int key auto_increment,
`name` varchar(50),
age int,
country varchar(50)
);

insert into class(`name`)
values ("C0523G1");

insert into teacher(`name`,age,country)
values ("Long",25,"DN"), ("Viet",30,"HN"),("Hau",20,"DN");
select * from bai_tap_ss1.class;
select * from bai_tap_ss1.teacher;
