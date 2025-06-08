-- bài tập về nhà buổi 12
USE bookshopdb;

-- tính doanh thu theo từng năm
SELECT FORMAT(SUM(price), 0, 'vi_VN') AS DoanhThu, YEAR(createdAT) AS nam
FROM order_item
GROUP BY nam;

-- Tính tổng doanh thu của cửa hàng theo từng tháng trong năm 2021
SELECT FORMAT(SUM(price), 0, 'vi_VN') AS TongDoanhThu, MONTH(createdAt) AS thang
FROM order_item
WHERE YEAR(createdAT) = '2021'
GROUP BY thang
ORDER BY thang ASC;

-- Tìm 5 cuốn sách có doanh thu cao nhất
SELECT name AS TenCuonSach, ((price * (1 - discount / 100) * totalBuy)) AS DoanhThuBanSach
FROM product
ORDER BY DoanhThuBanSach DESC
LIMIT 5;

-- Tìm 5 cuốn sách có số lượng sách bán ra cao nhất
SELECT name AS TenCuonSach, totalBuy
FROM product
ORDER BY totalBuy desc
LIMIT 5;

-- Tìm 5 tác giả có doanh thu bán sách cao nhất
SELECT bookshopdb.product.author AS TenTacGia, ((price * (1 - discount / 100) * totalBuy)) AS DoanhThuBanSach
FROM product
ORDER BY DoanhThuBanSach
LIMIT 5;

-- Thống kê doanh thu bán sách theo thể loại sách
SELECT c.name AS TheLoaiSach, ROUND(SUM(p.price * (1 - p.discount / 100) * p.totalBuy), 0) AS DoanhThuBanSach
FROM category c 
JOIN product_category pc ON c.id = pc.categoryId
JOIN product p ON pc.productId = p.id
GROUP BY c.name;

-- Thống kê các đầu sách có số lượng review cao nhất, sắp xép từ cao xuống thấp
SELECT p.name AS TenDauSach, AVG(pr.ratingScore) AS DanhGia, COUNT(DISTINCT pr.ratingScore) AS SoBaiDanhGia
FROM product p
JOIN product_review pr ON p.id = pr.productId
GROUP BY TenDauSach
ORDER BY DanhGia DESC;

-- Tìm nhà xuất bản có doanh thu cao nhất   
SELECT p.publisher AS NhaXuatBan, ROUND(SUM(p.price * (1 - p.discount / 100) * p.totalBuy), 0) AS DoanhThuBanSach
FROM product p
GROUP BY NhaXuatBan
ORDER BY DoanhThuBanSach
LIMIT 1;
