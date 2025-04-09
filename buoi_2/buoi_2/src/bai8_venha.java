import java.util.Scanner;
public class bai8_venha {

        public static void main(String[] args) {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Nhập điểm chuyên cần (0-10): ");
            double diemChuyenCan = scanner.nextDouble();
            System.out.print("Nhập điểm giữa kỳ (0-10): ");
            double diemGiuaKy = scanner.nextDouble();
            System.out.print("Nhập điểm cuối kỳ (0-10): ");
            double diemCuoiKy = scanner.nextDouble();

            if (!kiemTraDiemHopLe(diemChuyenCan) || !kiemTraDiemHopLe(diemGiuaKy) || !kiemTraDiemHopLe(diemCuoiKy)) {
                System.out.println("Điểm không hợp lệ! Điểm phải nằm trong khoảng từ 0 đến 10.");
            } else {
                double diemTrungBinh = tinhDiemTrungBinh(diemChuyenCan, diemGiuaKy, diemCuoiKy);
                System.out.printf("Điểm trung bình: %.2f\n", diemTrungBinh);
                String xepLoai = xepLoaiDiem(diemTrungBinh);
                System.out.println("Xếp loại: " + xepLoai);
            }
        }
        public static boolean kiemTraDiemHopLe(double diem) {
            return diem >= 0 && diem <= 10;
        }
        public static double tinhDiemTrungBinh(double diemChuyenCan, double diemGiuaKy, double diemCuoiKy) {
            return (diemChuyenCan + diemGiuaKy + diemCuoiKy) / 3;
        }
        public static String xepLoaiDiem(double diemTrungBinh) {
            if (diemTrungBinh >= 9) {
                return "A";
            } else if (diemTrungBinh >= 7 && diemTrungBinh < 9) {
                return "B";
            } else if (diemTrungBinh >= 5 && diemTrungBinh < 7) {
                return "C";
            } else {
                return "D";
            }
        }
    }

