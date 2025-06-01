USE `quanlybanhang`;
SELECT MASP, TENSP FROM sanpham where DVT IN ('cay','quyen');
-- In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP FROM sanpham where MASP LIKE ('B%01');
 -- In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000 
SELECT MASP, TENSP FROM sanpham where (GIA >= 30000 AND GIA <=40000);
  -- In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000. 
SELECT MASP, TENSP FROM sanpham where NUOCSX IN ('Trung Quoc', 'Thai Lan') AND (GIA >= 30000 AND GIA <=40000);
-- In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA FROM HOADON WHERE NGHD IN ('2007-01-01', '2007-01-02');
-- In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần
SELECT SOHD, TRIGIA FROM HOADON WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007 ORDER BY NGHD ASC, TRIGIA DESC  ;
-- In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT h.SOHD, h.TRIGIA
FROM HOADON h
JOIN CTHD c ON h.SOHD = c.SOHD
JOIN SANPHAM s ON c.MASP = s.MASP
JOIN (
    SELECT GIA
    FROM SANPHAM
    WHERE NUOCSX = 'Trung Quoc'
    ORDER BY GIA DESC
    LIMIT 3
) top3 ON s.GIA = top3.GIA
WHERE s.NUOCSX = 'Trung Quoc';

SELECT COUNT(c.SL) AS TONGSOHANG
FROM SANPHAM s
JOIN CTHD c ON s.MASP = c.MASP
where s.NUOCSX = 'Trung Quoc';

SELECT 
SUM(CASE WHEN NUOCSX = 'Trung Quoc' THEN SL ELSE 0 END) AS 'Trung Quoc',
SUM(CASE WHEN NUOCSX = 'Singapore' THEN SL ELSE 0 END) AS 'Singapore',
SUM(CASE WHEN NUOCSX = 'Viet Nam' THEN SL ELSE 0 END) AS 'Viet Nam',
SUM(CASE WHEN NUOCSX = 'Thai Lan' THEN SL ELSE 0 END) AS 'Thai Lan'
FROM SANPHAM s
JOIN CTHD c ON s.MASP = c.MASP;

SELECT 
	NUOCSX,
	max(GIA) AS MAX,
    min(GIA) AS MIN,
    avg(GIA) AS AVG
FROM SANPHAM s
GROUP BY NUOCSX;

SELECT COUNT(c.SL) AS TongSoLuong
FROM CTHD c
JOIN HOADON h ON c.SOHD = h.SOHD
WHERE month(NGHD) = '10' AND year(NGHD) = '2006';

-- Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT
	MONTH(h.NGHD) AS THANG,
    SUM(c.SL * h.TRIGIA)
    FROM HOADON h
    JOIN CTHD c ON h.SOHD = c.SOHD
    WHERE YEAR(h.NGHD)
    GROUP BY MONTH(h.NGHD)
    ORDER BY THANG;
    
    -- Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau
    SELECT h.SOHD
    FROM HOADON h
    JOIN CTHD c ON h.SOHD = c.SOHD
    group by h.SOHD
    HAVING COUNT(distinct c.MASP) >=4;
    -- Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau)
	SELECT h.SOHD
    FROM CTHD h
    JOIN SANPHAM s ON h.MASP = s.MASP
    where s.nuocsx = 'Viet Nam'
    group by h.SOHD
    HAVING COUNT(distinct s.MASP) =3;
    
    SELECT
	MONTH(h.NGHD) AS THANG,
    SUM(c.SL * h.TRIGIA) AS DoanhThu
    FROM HOADON h
    JOIN CTHD c ON h.SOHD = c.SOHD
    WHERE YEAR(h.NGHD)
    GROUP BY MONTH(h.NGHD)
    ORDER BY DoanhThu
    limit 1;
    
SELECT MASP, TENSP, NUOCSX, GIA
FROM SANPHAM
WHERE (NUOCSX, GIA) IN (
    SELECT NUOCSX, MAX(GIA)
    FROM SANPHAM
    GROUP BY NUOCSX
);
-- Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nha 
SELECT SOHD
FROM cthd
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) >= 4;

-- Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT c.SOHD
FROM cthd c
JOIN sanpham s ON c.MASP = s.MASP
WHERE s.NUOCSX = 'Viet Nam'
GROUP BY c.SOHD
HAVING COUNT(DISTINCT c.MASP) >= 3;

-- Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất

SELECT k.MAKH, k.HOTEN, COUNT(h.SOHD) AS solanmua
FROM KHACHHANG k
JOIN HOADON h ON k.MAKH = h.MAKH
GROUP BY MAKH
ORDER BY solanmua desc
limit 1;

-- Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT MONTH(NGHD) AS Thang, SUM(TRIGIA) AS DoanhSo
FROM hoadon
WHERE YEAR(NGHD) = 2006
GROUP BY Thang
ORDER BY DoanhSo DESC
LIMIT 1;
-- Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT s.MASP, s.TENSP, SUM(c.SL) AS soluongbanra
FROM sanpham s
JOIN CTHD c ON s.MASP = c.MASP
JOIN HOADON h ON c.SOHD = h.SOHD
WHERE year(h.NGHD) = 2006
GROUP BY s.MASP, s.TENSP
ORDER BY soluongbanra ASC
limit 1;

-- Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT s.nuocsx, s.MASP, s.TENSP, s.GIA
FROM SANPHAM s
JOIN(
	SELECT NUOCSX, MAX(GIA) AS MaxGia
    FROM sanpham
    GROUP BY NUOCSX) s1
    ON s.NUOCSX = s1.NUOCSX AND s.GIA = S1.MaxGia
order by s.NUOCSX desc;
-- Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT NUOCSX
FROM SANPHAM  
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3;
-- Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.

SELECT k.MAKH, k.HOTEN, COUNT(h.SOHD) AS solanmua
FROM (SELECT MAKH, HOTEN
    FROM khachhang
    ORDER BY DOANHSO DESC
    LIMIT 10) k
JOIN hoadon h ON k.MAKH = h.MAKH
GROUP BY k.MAKH, k.HOTEN
ORDER BY solanmua DESC
limit 1;