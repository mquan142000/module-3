create database c04;
use c04;


create table Address
(
    id      int not null primary key,
    address varchar(255)
);
insert into Address (address) values ('HN');
insert into Address (address) values ('HCM');
insert into Address (address) values ('DN');
insert into Address (address) values ('ND');
insert into Address (address) values ('HY');
select * from Address;
delete from Address where id between 11 and 13;
alter table Address auto_increment = 1;
drop table Address;
alter table Address change column id id int auto_increment;


create table Classes
(
    id          int          not null primary key,
    name        varchar(255) not null,
    language    varchar(255),
    description varchar(255)
);
insert into classes(name, language, description) value ('PHP101', 'PHP', 'Ngon ngu PHP');
insert into classes(name, language, description) value ('JV101', 'Java', 'Ngon ngu Java');
insert into classes(name, language, description) value ('JV102', 'Java', 'Ngon ngu Java');
insert into classes(name, language, description) value ('C101', 'C#', 'Ngon ngu C#');
insert into classes(name, language, description) value ('C102', 'C#', 'Ngon ngu C#');
select *from Classes;
alter table Classes auto_increment = 1;
alter table Classes change column id id int auto_increment;


create table Students
(
    id         int          not null primary key,
    fullname   varchar(255) not null,
    age        int,
    address_id int,
    class_id   int,
    phone      varchar(255),
    foreign key (address_id) references Address (id),
    foreign key (class_id) references Classes (id)
);
insert into students(fullname, address_id, phone, class_id) value ('Manh', 1, 0123456789, 2);
insert into students(fullname, address_id, phone, class_id) value ('Quan', 2, 0888888888, 1);
insert into students(fullname, address_id, phone, class_id) value ('Nguyen', 3, 0999999999, 3);
insert into students(fullname, address_id, phone, class_id) value ('Kien', 4, 0777777777, 5);
insert into students(fullname, address_id, phone, class_id) value ('Trang', 5, 0666666666, 4);
insert into students(fullname, address_id, phone, class_id) value ('Khoi', 1, 0555555555, 1);
insert into students(fullname, address_id, phone, class_id) value ('Hien', 4, 0444444444, 2);
insert into students(fullname, address_id, phone, class_id) value ('Hoang', 3, 0333333333, 3);
insert into students(fullname, address_id, phone, class_id) value ('Huy', 2, 0222222222, 4);
insert into students(fullname, address_id, phone, class_id) value ('Thao', 5, 0111111111, 5);

drop table Students;
alter table Students change column id id int auto_increment;
alter table Students drop foreign key Students_ibfk_1;
alter table Students drop foreign key students_ibfk_2;
alter table Students
    add constraint fk_address foreign key (address_id) references Address (id);
alter table Students
    add constraint fk_class foreign key (class_id) references Classes (id);
select * from Students;
select * from Students where fullname = 'Huy';
select * from Students where age > 20;
select * from Students where age between 20 and 22;
select * from Students where id between 3 and 9;
select * from Students where fullname like 'k%';
select * from Students where class_id in (3);

delete from Students;
truncate table Students;
alter table Students auto_increment = 1;
update Students set age = 21 where fullname = 'Manh';
update Students set age = 24 where fullname = 'Quan';
update Students set age = 22 where id = 5;
select address.address as address, count(Students.id) as number_of_student
from Students left join address on address.id = Students.address_id group by address.address;



create table Course
(
    id          int primary key,
    name        varchar(255) not null,
    description varchar(255)
);
insert into course(name, description) value ('JV1', 'Khoa hoc Java 1');
insert into course(name, description) value ('JV2', 'Khoa hoc Java 2');
insert into course(name, description) value ('JV3', 'Khoa hoc Java 3');
insert into course(name, description) value ('JV4', 'Khoa hoc Java 4');
insert into course(name, description) value ('JV5', 'Khoa hoc Java 5');
insert into course(name, description) value ('JV6', 'Khoa hoc Java 6');
insert into course(name, description) value ('JV7', 'Khoa hoc Java 7');
insert into course(name, description) value ('JV8', 'Khoa hoc Java 8');
insert into course(name, description) value ('JV9', 'Khoa hoc Java 9');
insert into course(name, description) value ('PHP1', 'Khoa hoc PHP 1');
insert into course(name, description) value ('PHP2', 'Khoa hoc PHP 2');
insert into course(name, description) value ('PHP3', 'Khoa hoc PHP 3');
insert into course(name, description) value ('PHP4', 'Khoa hoc PHP 4');
insert into course(name, description) value ('PHP5', 'Khoa hoc PHP 5');
insert into course(name, description) value ('PHP6', 'Khoa hoc PHP 6');
insert into course(name, description) value ('C#1', 'Khoa hoc C# 1');
insert into course(name, description) value ('C#2', 'Khoa hoc C# 2');
insert into course(name, description) value ('C#3', 'Khoa hoc C# 3');
insert into course(name, description) value ('C#4', 'Khoa hoc C# 4');
insert into course(name, description) value ('C#5', 'Khoa hoc C# 5');
drop table Course;
alter table Course change column id id int auto_increment;
select * from Course;


create table Point
(
    id         int primary key,
    course_id  int,
    student_id int,
    point      int,
    foreign key (course_id) references Course (id),
    foreign key (student_id) references Students (id)
);
insert into point(course_id, student_id, point) value(1, 1, 10);
insert into point(course_id, student_id, point) value(1, 2, 10);
insert into point(course_id, student_id, point) value(1, 3, 10);
insert into point(course_id, student_id, point) value(1, 4, 10);
insert into point(course_id, student_id, point) value(1, 5, 10);
insert into point(course_id, student_id, point) value(1, 6, 10);
insert into point(course_id, student_id, point) value(1, 7, 10);
insert into point(course_id, student_id, point) value(1, 8, 10);
insert into point(course_id, student_id, point) value(2, 9, 10);
insert into point(course_id, student_id, point) value(2, 1, 10);
insert into point(course_id, student_id, point) value(2, 2, 10);
insert into point(course_id, student_id, point) value(2, 3, 10);
insert into point(course_id, student_id, point) value(3, 4, 10);
insert into point(course_id, student_id, point) value(3, 5, 10);
insert into point(course_id, student_id, point) value(4, 6, 10);
insert into point(course_id, student_id, point) value(11, 6, 10);

drop table Point;
alter table Point change column id id int auto_increment;
alter table Point drop foreign key Point_ibfk_1;
alter table Point drop foreign key Point_ibfk_2;
alter table Point add constraint fk_course foreign key (course_id) references Course (id);
alter table Point add constraint fk_student foreign key (student_id) references Students (id);
select * from Point;

delete from Point where course_id = 4;

/* Thống kê số lượng học viên các lớp (count) */
select Classes.name, count(Students.id) as num_students
from Classes
left join Students  on Classes.id = Students.class_id
group by Classes.name;

/* Thống kê số lượng học viên tại các tỉnh (count) */
select Address.address, count(Students.id) as num_students
from Address
left join Students  on Address.id = Students.address_id
group by Address.address;

/* Tính điểm trung bình của các khóa học (avg) */
select Course.name, avg(Point.point) as avg_point
from Course
left join Point  on Course.id = Point.course_id
group by Course.name;

/* Lấy ra điểm cao nhất, thấp nhất. */
select Course.name, MIN(Point.point) as min_point, MAX(Point.point) as max_point
from Course
left join Point  on Course.id = Point.course_id
group by Course.name;

/* Lấy ra danh sách HS, Chuyển đổi tên HS thành chữ hoa */
select UPPER(Students.fullname) as fullname
from Students;

/* Đưa ra khoá học có điểm trung bình cao nhất */
SELECT Course.name, AVG(Point.point) AS avg_point
FROM Course
         JOIN Point ON Course.id = Point.course_id
GROUP BY Course.name
ORDER BY avg_point DESC
LIMIT 1;