create database QLSV;
use QLSV;

create table Class(
    ClassID int auto_increment primary key,
    ClassName varchar(50) not null,
    StartDate datetime not null,
    Status bit
);

create table Student
(
    StudentID   int auto_increment primary key,
    StudentName varchar(50) not null,
    Address     varchar(50),
    Phone       varchar(20),
    Status      bit,
    ClassID     int         not null,
    foreign key (ClassID) references Class (ClassID)
);
select * from Student;

create table Subject(
    SubID int auto_increment primary key,
    SubName varchar(50) not null,
    Credit tinyint not null default 1 check ( Credit >= 1 ),
    Status bit,
    exam_score decimal(10,2) not null
);
select * from Subject;
drop table Subject;
set foreign_key_checks = 1;



create table Mark
(
    MarkID    int auto_increment primary key,
    SubID     int not null,
    StudentID int not null,
    Mark      float   default 0 check (Mark between 0 and 100),
    ExamTimes tinyint default 1,
    unique (StudentID, SubID),
    foreign key (SubID) references Subject (SubID),
    foreign key (StudentID) references Student (StudentID)
);
drop table Mark;
select * from Mark;

CREATE TABLE student_subject (
    student_id INT,
    subject_id INT,
    score DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(StudentID),
    FOREIGN KEY (subject_id) REFERENCES subject(SubID)
);


/* Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất. */
SELECT *
FROM subject
WHERE credit = (SELECT MAX(credit) FROM subject);

/* Hiển thị các thông tin môn học có điểm thi lớn nhất. */
SELECT *
FROM subject
WHERE exam_score = (SELECT MAX(exam_score) FROM subject);

/* Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần */
SELECT s.StudentID, s.StudentName, AVG(ss.score) AS average_score
FROM student s
         JOIN student_subject ss ON s.StudentID = ss.student_id
GROUP BY s.StudentID, s.StudentName
ORDER BY average_score DESC;
