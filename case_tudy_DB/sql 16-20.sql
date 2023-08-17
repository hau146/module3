use case_study;

-- 16
-- Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019
 -- đến năm 2021.
set sql_safe_updates = 0;
 
 alter table nhan_vien add xoa_nhan_vien bit(1) default 0;
 update nhan_vien
 set xoa_nhan_vien = 1
 where ma_nhan_vien not in (select ma_nhan_vien from hop_dong 
							where year (ngay_lam_hop_dong) 
							between '2019' and '2021' );
select ma_nhan_vien, ho_ten
from nhan_vien
where xoa_nhan_vien = 1;
set sql_safe_updates = 1;


-- 17
-- Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum
-- lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

set sql_safe_updates = 0;
create view view_loai_khach as
select kh.ma_khach_hang, kh.ho_ten, lk.ma_loai_khach
from khach_hang kh
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Platinium'
group by hd.ma_hop_dong, kh.ma_khach_hang
having sum(dv.chi_phi_thue+(hdct.so_luong*dvdk.gia)) > 10000000;

update khach_hang kh
set kh.ma_loai_khach = 1
where kh.ma_khach_hang in (select view_loai_khach.ma_khach_hang from view_loai_khach);

-- 18
-- Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc
-- giữa các bảng).


alter table khach_hang add xoa_khach_hang int default 0;
set sql_safe_updates = 0;
update khach_hang kh
set kh.xoa_khach_hang = 1
where kh.ma_khach_hang not in (select ma_khach_hang from hop_dong hd where year (hd.ngay_lam_hop_dong) < 2021);

select ma_khach_hang, ho_ten
from khach_hang 
where xoa_khach_hang = 0;
set sql_safe_updates = 1;

-- 19
-- Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong
-- năm 2020 lên gấp đôi.
set sql_safe_updates = 0;
update dich_vu_di_kem dvdk
set gia = gia * 2
where dvdk.ma_dich_vu_di_kem in (select hdct.ma_dich_vu_di_kem from hop_dong_chi_tiet hdct
                                 join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
								where year (hd.ngay_lam_hop_dong) = 2020 and hdct.so_luong > 10);
                                
-- 20
select ma_nhan_vien as 'ma', ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi 
from nhan_vien
union all
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;
                    
				

