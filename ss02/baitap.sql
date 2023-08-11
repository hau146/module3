create database bai_tap_ss2_chuyen_doi_ERD;
use bai_tap_ss2_chuyen_doi_ERD;
	
create table phieu_xuat(
so_px int auto_increment primary key,
ngay_xuat date,
don_gia_xuat int
);

create table phieu_nhap(
so_pn int auto_increment primary key,
ngay_nhap date,
don_gia_nhap int
);

create table vat_tu(
ma_vat_tu int auto_increment primary key,
ten_vat_tu varchar(50)
);

create table phieu_xuat_vat_tu(
so_px int,
ma_vat_tu int,
don_gia_xuat int not null,
so_luong_xuat int not null,
primary key(so_px,ma_vat_tu),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_nhap_vat_tu(
so_pn int,
ma_vat_tu int,
don_gia_nhap int not null,
so_luong_nhap int not null,
primary key(so_pn,ma_vat_tu),
foreign key(so_pn) references phieu_nhap(so_pn),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table don_dat_hang(
so_don_hang int auto_increment primary key,
ngay_dat_hang date
);

create table don_dat_hang_vat_tu(
so_don_hang int,
ma_vat_tu int,
primary key(so_don_hang,ma_vat_tu),
foreign key(so_don_hang) references don_dat_hang(so_don_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table nha_cung_cap(
ma_nha_cung_cap int auto_increment primary key,
ten_nha_cung_cap varchar(50) not null,
dia_chi varchar(100),
so_don_hang int,
foreign key(so_don_hang) references don_dat_hang (so_don_hang)
);

create table so_dien_thoai(
ma_so_dien_thoai int auto_increment primary key,
so_dien_thoai int not null,
ma_nha_cung_cap int,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);
 
