create database minitest3;
use minitest3;

create table VatTu
(
    id          int auto_increment unique,
    ma_Vat_Tu   varchar(255) primary key,
    ten_Vat_Tu  varchar(255),
    don_Vi_Tinh varchar(255),
    gia_Tien    double
);
drop table VatTu;

create table TonKho
(
    id           int auto_increment primary key,
    ma_Vat_Tu    varchar(255),
    so_Luong_Dau int,
    tong_So_Nhap int,
    tong_So_Xuat int,
    foreign key (ma_Vat_Tu) references VatTu (ma_Vat_Tu) on delete cascade
);

create table NhaCungCap
(
    id               int auto_increment unique,
    ma_Nha_Cung_Cap  varchar(255) primary key,
    ten_Nha_Cung_Cap varchar(255),
    dia_Chi          varchar(255),
    so_Dien_Thoai    varchar(255)
);

create table DonHang
(
    id              int auto_increment unique,
    ma_Don_Hang     varchar(255) primary key,
    ma_Nha_Cung_Cap varchar(255),
    ngay_Dat        date,
    foreign key (ma_Nha_Cung_Cap) references NhaCungCap (ma_Nha_Cung_Cap) on delete cascade
);

create table ChiTietDonHang
(
    id           int auto_increment primary key,
    ma_Don_Hang  varchar(255),
    ma_Vat_Tu    varchar(255),
    so_Luong_Dat int,
    foreign key (ma_Don_Hang) references DonHang (ma_Don_Hang),
    foreign key (ma_Vat_Tu) references VatTu (ma_Vat_Tu)
);
drop table ChiTietDonHang;

create table PhieuXuat
(
    id             int auto_increment unique,
    so_Phieu_Xuat  varchar(255) primary key,
    ngay_Xuat      date,
    ten_Khach_Hang varchar(255)
);

create table PhieuNhap
(
    id            int auto_increment unique,
    so_Phieu_Nhap varchar(255) primary key,
    ma_Don_Hang   varchar(255),
    ngay_Nhap     date,
    foreign key (ma_Don_Hang) references DonHang (ma_Don_Hang) on delete cascade
);

create table ChiTietPhieuXuat
(
    id            int auto_increment primary key,
    so_Phieu_Xuat varchar(255),
    ma_Vat_Tu     varchar(255),
    so_Luong_Xuat int,
    don_Gia_Xuat  double,
    ghi_Chu       varchar(255),
    foreign key (so_Phieu_Xuat) references PhieuXuat (so_Phieu_Xuat),
    foreign key (ma_Vat_Tu) references VatTu (ma_Vat_Tu)
);

create table ChiTietPhieuNhap
(
    id            int auto_increment primary key,
    so_Phieu_Nhap varchar(255),
    ma_Vat_Tu     varchar(255),
    so_Luong_Nhap int,
    don_Gia_Nhap  double,
    ghi_Chu       varchar(255),
    foreign key (so_Phieu_Nhap) references PhieuNhap (so_Phieu_Nhap),
    foreign key (ma_Vat_Tu) references VatTu (ma_Vat_Tu)
);


insert into VatTu (ma_Vat_Tu, ten_Vat_Tu, don_Vi_Tinh, gia_Tien)
values ('VT001', 'Gạch', 'viên', 3000),
       ('VT002', 'Xi măng', 'bao', 70000),
       ('VT003', 'Cát', 'khối', 50000),
       ('VT004', 'Sắt', 'kg', 12000),
       ('VT005', 'Gỗ', 'm3', 800000);

insert into NhaCungCap (ma_Nha_Cung_Cap, ten_Nha_Cung_Cap, dia_Chi, so_Dien_Thoai)
values ('NCC001', 'Công ty TNHH Vật Liệu Xây Dựng', '123 Đường Lê Lợi, Quận 1, TP.HCM', '0909123456'),
       ('NCC002', 'Công ty Cổ Phần Gạch Ngói', '456 Đường Nguyễn Trãi, Quận 5, TP.HCM', '0918234567'),
       ('NCC003', 'Doanh Nghiệp Tư Nhân Xi Măng', '789 Đường Trần Hưng Đạo, Quận 3, TP.HCM', '0928345678');

insert into DonHang (ma_Don_Hang, ma_Nha_Cung_Cap, ngay_Dat)
values ('DH001', 'NCC001', '2024-07-01'),
       ('DH002', 'NCC002', '2024-07-05'),
       ('DH003', 'NCC003', '2024-07-10'),
       ('DH004', 'NCC001', '2024-07-15'),
       ('DH005', 'NCC002', '2024-07-20');

insert into TonKho (ma_Vat_Tu, so_Luong_Dau, tong_So_Nhap, tong_So_Xuat)
values ('VT001', 100, 50, 30),
       ('VT002', 200, 70, 60),
       ('VT003', 300, 80, 90),
       ('VT004', 400, 60, 50),
       ('VT005', 500, 90, 80);

insert into PhieuXuat (so_Phieu_Xuat, ngay_Xuat, ten_Khach_Hang)
values ('PX001', '2024-07-01', 'Nguyen Van A'),
       ('PX002', '2024-07-10', 'Tran Thi B'),
       ('PX003', '2024-07-20', 'Le Van C');

insert into PhieuNhap (so_Phieu_Nhap, ma_Don_Hang, ngay_Nhap)
values ('PN001', 'DH001', '2024-07-02'),
       ('PN002', 'DH002', '2024-07-06'),
       ('PN003', 'DH003', '2024-07-11');

insert into ChiTietDonHang (ma_Don_Hang, ma_Vat_Tu, so_Luong_Dat)
values ('DH001', 'VT001', 7),
       ('DH002', 'VT002', 5),
       ('DH003', 'VT003', 12),
       ('DH004', 'VT004', 8),
       ('DH005', 'VT005', 15);

insert into ChiTietPhieuNhap (so_Phieu_Nhap, ma_Vat_Tu, so_Luong_Nhap, don_Gia_Nhap, ghi_Chu)
values ('PN001', 'VT001', 50, 3000, 'Gạch nhập kho đợt 1'),
       ('PN002', 'VT002', 70, 70000, 'Xi măng nhập kho đợt 1'),
       ('PN003', 'VT003', 80, 50000, 'Cát nhập kho đợt 1'),
       ('PN001', 'VT004', 60, 12000, 'Sắt nhập kho đợt 1'),
       ('PN002', 'VT005', 90, 800000, 'Gỗ nhập kho đợt 1'),
       ('PN003', 'VT001', 40, 3000, 'Gạch nhập kho đợt 2');

insert into ChiTietPhieuXuat (so_Phieu_Xuat, ma_Vat_Tu, so_Luong_Xuat, don_Gia_Xuat, ghi_Chu)
values ('PX001', 'VT001', 20, 3200, 'Gạch xuất kho cho khách hàng A'),
       ('PX002', 'VT002', 40, 71000, 'Xi măng xuất kho cho khách hàng B'),
       ('PX003', 'VT003', 50, 52000, 'Cát xuất kho cho khách hàng C'),
       ('PX001', 'VT004', 30, 12500, 'Sắt xuất kho cho khách hàng A'),
       ('PX002', 'VT005', 45, 820000, 'Gỗ xuất kho cho khách hàng B'),
       ('PX003', 'VT001', 35, 3200, 'Gạch xuất kho cho khách hàng C');


/* Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. */
   create view vw_CTPNHAP AS
    select
        so_Phieu_Nhap,
        ma_Vat_Tu,
        so_Luong_Nhap,
        don_Gia_Nhap,
        so_Luong_Nhap * don_Gia_Nhap AS tien_nhap
    FROM
        ChiTietPhieuNhap;
select * from vw_ctpnhap;

/* Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. */
   create view vw_CTPNHAP_VT AS
    SELECT
        so_Phieu_Nhap,
        ctpn.ma_Vat_Tu,
        ten_Vat_Tu,
        so_Luong_Nhap,
        don_Gia_Nhap,
        so_Luong_Nhap * don_Gia_Nhap AS tien_nhap
    FROM
        ChiTietPhieuNhap as ctpn,
        VatTu as vt
    WHERE
        ctpn.ma_Vat_Tu = vt.ma_Vat_Tu;
select * from vw_CTPNHAP_VT;

/* Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. */
   create view vw_CTPNHAP_VT_PN AS
    SELECT
        ctpn.so_Phieu_Nhap,
        pn.ngay_Nhap,
        pn.ma_Don_Hang,
        ctpn.ma_Vat_Tu,
        ten_Vat_Tu,
        so_Luong_Nhap,
        don_Gia_Nhap,
        so_Luong_Nhap * don_Gia_Nhap AS tien_nhap
    FROM
        ChiTietPhieuNhap as ctpn,
        VatTu as vt,
        PhieuNhap as pn
    WHERE
        ctpn.ma_Vat_Tu = vt.ma_Vat_Tu AND
        ctpn.so_Phieu_Nhap = pn.so_Phieu_Nhap;
select * from vw_CTPNHAP_VT_PN;

/* Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. */
   create view vw_CTPNHAP_VT_PN_DH AS
    SELECT
        ctpn.so_Phieu_Nhap,
        pn.ngay_Nhap,
        pn.ma_Don_Hang ma_Nha_Cung_Cap,
        ctpn.ma_Vat_Tu,
        ten_Vat_Tu,
        so_Luong_Nhap,
        don_Gia_Nhap,
        so_Luong_Nhap * don_Gia_Nhap AS tien_nhap
    FROM
        ChiTietPhieuNhap as ctpn,
        VatTu as vt,
        PhieuNhap as pn,
        DonHang as dh,
        NhaCungCap as ncc
    WHERE
        ctpn.ma_Vat_Tu = vt.ma_Vat_Tu AND
        ctpn.so_Phieu_Nhap = pn.so_Phieu_Nhap AND
        pn.ma_Don_Hang = dh.ma_Don_Hang AND
        dh.ma_Nha_Cung_Cap = ncc.ma_Nha_Cung_Cap;
select * from vw_CTPNHAP_VT_PN_DH;

/* Câu 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5 */
   create view vw_CTPNHAP_loc AS
    SELECT
        so_Phieu_Nhap,
        ma_Vat_Tu,
        so_Luong_Nhap
    FROM
        ChiTietPhieuNhap
    WHERE
        so_Luong_Nhap > 5;
select * from vw_CTPNHAP_loc;

/* Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ. */
   create view vw_CTPNHAP_VT_loc AS
    SELECT
        so_Phieu_Nhap,
        ctpn.ma_Vat_Tu,
        ten_Vat_Tu,
        so_Luong_Nhap,
        don_Gia_Nhap,
        so_Luong_Nhap * don_Gia_Nhap AS tien_nhap
    FROM
        ChiTietPhieuNhap as ctpn,
        VatTu as vt
    WHERE
        ctpn.ma_Vat_Tu = vt.ma_Vat_Tu
        AND vt.don_Vi_Tinh = 'Bộ';
select * from vw_CTPNHAP_VT_loc;

/* Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất. */
   create view vw_CTPXUAT AS
    SELECT
        so_Phieu_Xuat,
        ma_Vat_Tu,
        so_Luong_Xuat,
        don_Gia_Xuat,
        so_Luong_Xuat * don_Gia_Xuat AS tien_xuat
    FROM
        ChiTietPhieuXuat;
select * from vw_CTPXUAT;

/* Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất. */
   create view vw_CTPXUAT_VT AS
    SELECT
        so_Phieu_Xuat,
        ctpx.ma_Vat_Tu,
        ten_Vat_Tu,
        so_Luong_Xuat,
        don_Gia_Xuat,
        so_Luong_Xuat * don_Gia_Xuat AS tien_xuat
    FROM
        ChiTietPhieuXuat as ctpx,
        VatTu as vt
    WHERE
        ctpx.ma_Vat_Tu = vt.ma_Vat_Tu;
select * from vw_CTPXUAT_VT;

/* Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất. */
CREATE VIEW vw_CTPXUAT_VT_PX AS
SELECT
    px.so_Phieu_Xuat,
    px.ten_Khach_Hang,
    ctpx.ma_Vat_Tu,
    vt.ten_Vat_Tu,
    ctpx.so_Luong_Xuat,
    ctpx.don_Gia_Xuat
FROM
    PhieuXuat px
        JOIN
    ChiTietPhieuXuat ctpx ON px.so_Phieu_Xuat = ctpx.so_Phieu_Xuat
        JOIN
    VatTu vt ON ctpx.ma_Vat_Tu = vt.ma_Vat_Tu;
select * from vw_CTPXUAT_VT_PX;

/* Câu 1. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào. */
DELIMITER $$
CREATE PROCEDURE `sp_TongSoLuongCuoi_VatTu` (IN `ma_Vat_Tu` INT)
BEGIN
    SELECT
        SUM(so_Luong_Xuat) AS tong_so_luong_cuoi
    FROM
        ChiTietPhieuXuat
    WHERE
        ma_Vat_Tu = `ma_Vat_Tu`;
END$$
DELIMITER ;

CALL sp_TongSoLuongCuoi_VatTu(2);

/* Câu 2. Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào. */
DELIMITER $$

CREATE PROCEDURE `sp_TongTienXuat_VatTu` (IN `ma_Vat_Tu` INT)
BEGIN
    SELECT
        SUM(so_Luong_Xuat * don_Gia_Xuat) AS tong_tien_xuat
    FROM
        ChiTietPhieuXuat
    WHERE
        ma_Vat_Tu = `ma_Vat_Tu`;
END$$

DELIMITER ;

CALL sp_TongTienXuat_VatTu(2);


