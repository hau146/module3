use case_study;

 -- 11
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, lk.ten_loai_khach as 'duoc_su_dung_boi_khach'
from loai_khach lk
join khach_hang kh on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where (lk.ten_loai_khach = 'Diamond') and kh.dia_chi like '%Vinh' or kh.dia_chi like '%Quảng Ngãi';

-- 12
select hd.ma_hop_dong, nv.ho_ten as 'ho_ten_nhan_vien', kh.ho_ten as 'ho_ten_khach_hang',
kh.so_dien_thoai as 'sdt_khach_hang', dv.ma_dich_vu, dv.ten_dich_vu, 
if(hdct.so_luong is null,0,sum(hdct.so_luong)) as 'so_luong_dich_vu_di_kem', hd.tien_dat_coc
from hop_dong hd
left join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
left join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where dv.ten_dich_vu in (select dv.ten_dich_vu 
from dich_vu dv join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where hd.ngay_lam_hop_dong
between '2020-10-01' and '2020-12-31')
and 
dv.ten_dich_vu not in (select dv.ten_dich_vu 
from dich_vu dv join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where hd.ngay_lam_hop_dong
between '2021-01-01' and '2021-06-30')
group by hd.ma_hop_dong;

-- 13
-- Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các
-- Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử
-- dụng nhiều như nhau).

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as 'so_luong_dich_vu_di_kem'
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong) = (
							 select sum(hdct.so_luong)
							 from hop_dong_chi_tiet hdct join dich_vu_di_kem dvdk 
							 on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
							 group by dvdk.ma_dich_vu_di_kem
							 order by sum(hdct.so_luong) desc limit 1);

-- 14
-- Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một
-- lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong,
-- ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính
-- dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as 'so_lan_su_dung'
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having count(dvdk.ma_dich_vu_di_kem) = 1
order by hd.ma_hop_dong;

-- 15
-- Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten,
-- ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được
-- tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between '2020-01-01' and '2021-31-12'
group by nv.ma_nhan_vien
having count(nv.ma_nhan_vien) <= 3
order by nv.ma_nhan_vien;