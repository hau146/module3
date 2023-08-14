use case_study;

-- 2
select *
from nhan_vien
where ho_ten like "H%" 
or ho_ten like "T%" 
or ho_ten like "K%" and length(ho_ten) <= 15;

-- 3
select *
from khach_hang
where (select round(datediff(curdate(),ngay_sinh) / 365, 0))
between 18 and 50
and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');

-- 4
select kh.ma_khach_hang, kh.ho_ten, count(hd.ma_hop_dong) as "so_lan_dat_phong"
from loai_khach lk
join khach_hang kh on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where lk.ten_loai_khach ='Diamond'
group by kh.ma_khach_hang;


-- 5
set sql_mode = 0;
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong,
dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
if (hdct.so_luong is null, dv.chi_phi_thue, sum(dv.chi_phi_thue + hdct.so_luong * dvdk.gia)) as "tong_tien"
from khach_hang kh
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong;
set sql_mode = 1;







