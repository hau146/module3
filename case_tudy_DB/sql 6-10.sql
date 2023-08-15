use case_study;


-- 6
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue,
ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where dv.ten_dich_vu 
not in (select dv.ten_dich_vu 
from dich_vu dv join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where hd.ngay_lam_hop_dong 
between '2021-01-01' and '2021-03-31')
group by dv.ma_dich_vu
order by dv.chi_phi_thue desc;

-- 7
-- Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich,
-- so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại
-- dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng
-- chưa từng được khách hàng đặt phòng trong năm 2021.

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,
dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where dv.ten_dich_vu not in (select dv.ten_dich_vu 
from dich_vu dv join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where hd.ngay_lam_hop_dong 
between '2021-01-01' and '2021-12-31')
group by dv.ma_dich_vu;

-- 8
-- cách 1
select ho_ten
from khach_hang
group by ho_ten;
-- Cách 2
select ho_ten
from khach_hang
union
select ho_ten
from khach_hang;
-- cách 3
select distinct ho_ten
from khach_hang;

-- 9
select month(hd.ngay_lam_hop_dong) as 'tháng', count(kh.ma_khach_hang) as 'số lần đặt phòng'
from khach_hang kh
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) = 2021
group by month(hd.ngay_lam_hop_dong)
order by month(hd.ngay_lam_hop_dong);

-- 10
-- Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu
-- dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong,
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở
-- dich_vu_di_kem).

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc ,  
if(hdct.so_luong is null,0,sum(hdct.so_luong)) as'so_luong_dich_vu_di_kem'
from hop_dong hd
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong;
