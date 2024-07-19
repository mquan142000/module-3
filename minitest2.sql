create database minitest2;
use minitest2;

create table Destination
(
    id              int primary key auto_increment,
    destinationName varchar(255),
    describes       varchar(255),
    cost            int,
    city_id         int,
    foreign key (city_id) references City (id)
);
drop table Destination;
select *
from Destination;
insert into Destination (destinationName, describes, cost, city_id)
values ('Vịnh Hạ Long', 'Di sản thiên nhiên thế giới', 1000000, 1);
insert into Destination (destinationName, describes, cost, city_id)
values ('Chợ Bến Thành', 'Khu chợ nổi tiếng ở Hồ Chí Minh', 500000, 2);
insert into Destination (destinationName, describes, cost, city_id)
values ('Bà Nà Hills', 'Khu du lịch nổi tiếng ở Đà Nẵng', 1500000, 3);
insert into Destination (destinationName, describes, cost, city_id)
values ('Vinpearl Land', 'Khu vui chơi giải trí tại Nha Trang', 2000000, 4);
insert into Destination (destinationName, describes, cost, city_id)
values ('Đại Nội Huế', 'Di sản văn hóa thế giới', 300000, 5);

alter table Destination
    auto_increment = 1;
delete
from Destination
where id between 1 and 5;



create table Clients
(
    id          int primary key auto_increment,
    nameClients varchar(255),
    idNumber    varchar(255),
    dateBirth   date,
    city_id     int,
    foreign key (city_id) references City (id)
);

drop table Clients;
select *
from Clients;
insert into Clients (nameClients, idNumber, dateBirth, city_id)
values ('Nguyễn Văn A', '123456789', '1980-12-04', 1);
insert into Clients (nameClients, idNumber, dateBirth, city_id)
values ('Trần Thị B', '234567890', '1985-04-02', 2);
insert into Clients (nameClients, idNumber, dateBirth, city_id)
values ('Lê Văn C', '345678901', '1990-06-03', 3);
insert into Clients (nameClients, idNumber, dateBirth, city_id)
values ('Phạm Thị D', '456789012', '1975-12-02', 4);
insert into Clients (nameClients, idNumber, dateBirth, city_id)
values ('Vũ Văn E', '567890123', '1988-11-23', 5);
insert into Clients (nameClients, idNumber, dateBirth, city_id)
values ('Ngô Thị F', '678901234', '1992-3-13', 1);
insert into Clients (nameClients, idNumber, dateBirth, city_id)
values ('Đỗ Văn G', '789012345', '1983-10-15', 2);
insert into Clients (nameClients, idNumber, dateBirth, city_id)
values ('Phan Thị H', '890123456', '1987-09-03', 3);
insert into Clients (nameClients, idNumber, dateBirth, city_id)
values ('Hoàng Văn I', '901234567', '1991-03-02', 4);
insert into Clients (nameClients, idNumber, dateBirth, city_id)
values ('Bùi Thị K', '012345678', '1984-08-04', 5);

alter table Clients
    auto_increment = 1;



create table City
(
    id       int primary key auto_increment,
    nameCity varchar(255)
);
drop table City;
select *
from City;
insert into City (nameCity)
values ('Hà Nội');
insert into City (nameCity)
values ('Hồ Chí Minh');
insert into City (nameCity)
values ('Đà Nẵng');
insert into City (nameCity)
values ('Nha Trang');
insert into City (nameCity)
values ('Huế');
alter table City
    auto_increment = 1;



create table Tour
(
    id             int primary key auto_increment,
    tourCode       varchar(255),
    category_id    int,
    destination_id int,
    dateStart      date,
    dateEnd        date,
    foreign key (category_id) references CategoryTour (id)
);
drop table Tour;
select *
from Tour;
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T001', 1, 1000000, '2020-03-01', '2020-03-10');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T002', 1, 1500000, '2020-03-15', '2020-04-05');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T003', 2, 2000000, '2020-04-01', '2020-04-10');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T004', 2, 3000000, '2020-03-25', '2020-04-15');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T005', 1, 1200000, '2020-03-05', '2020-03-20');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T006', 1, 800000, '2020-03-10', '2020-04-01');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T007', 2, 2200000, '2020-02-20', '2020-03-05');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T008', 1, 1600000, '2020-04-10', '2020-04-20');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T009', 2, 2500000, '2020-03-30', '2020-04-10');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T010', 1, 1800000, '2020-03-01', '2020-03-15');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T011', 1, 900000, '2020-03-20', '2020-03-25');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T012', 2, 1900000, '2020-04-05', '2020-04-15');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T013', 1, 1100000, '2020-02-28', '2020-03-08');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T014', 2, 2300000, '2020-03-12', '2020-03-22');
insert into Tour (tourCode, category_id, destination_id, dateStart, dateEnd)
values ('T015', 1, 1300000, '2020-04-01', '2020-04-12');



create table OderTour
(
    id        int primary key auto_increment,
    tour_id   int,
    client_id int,
    status    varchar(255),
    foreign key (tour_id) references Tour (id),
    foreign key (client_id) references Clients (id)
);
drop table OderTour;
select *
from OderTour;
insert into OderTour (tour_id, client_id, status)
values (1, 1, 'Confirmed');
insert into OderTour (tour_id, client_id, status)
values (2, 2, 'Pending');
insert into OderTour (tour_id, client_id, status)
values (3, 3, 'Cancelled');
insert into OderTour (tour_id, client_id, status)
values (4, 4, 'Confirmed');
insert into OderTour (tour_id, client_id, status)
values (5, 5, 'Pending');
insert into OderTour (tour_id, client_id, status)
values (6, 6, 'Confirmed');
insert into OderTour (tour_id, client_id, status)
values (7, 7, 'Cancelled');
insert into OderTour (tour_id, client_id, status)
values (8, 8, 'Pending');
insert into OderTour (tour_id, client_id, status)
values (9, 9, 'Confirmed');
insert into OderTour (tour_id, client_id, status)
values (10, 10, 'Pending');



create table CategoryTour
(
    id           int primary key auto_increment,
    categoryName varchar(255),
    categoryCode varchar(255)
);
insert into CategoryTour (categoryName, categoryCode)
values ('LT001', 'Tour trong nước');
insert into CategoryTour (categoryName, categoryCode)
values ('LT002', 'Tour nước ngoài');

select * from CategoryTour;

/* Thống kê số lượng tour của các thành phố */
select City.nameCity, count(Destination.destinationName) as number
from Destination
         join City on Destination.city_id = City.id group by City.nameCity;

/* Tính số tour có ngày bắt đầu trong tháng 3 năm 2020 ( dùng count) */
SELECT COUNT(*)
FROM Tour
WHERE MONTH(dateStart) = 3 AND YEAR(dateStart) = 2020;

/* Tính số tour có ngày kết thúc trong tháng 4 năm 2020 */
SELECT COUNT(*)
FROM Tour
WHERE MONTH(dateEnd) = 4 AND YEAR(dateEnd) = 2020;