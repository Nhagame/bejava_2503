import java.util.Scanner;

public class bai1_venha {
    static Scanner sc = new Scanner(System.in);


    public static void giaiphuongtrinhbacnhat() {
        System.out.println("Nhập số a:");
        int nhap = sc.nextInt();
        System.out.println("Nhập số b:");
        int bn = sc.nextInt();
        if (nhap != 0) {
            if (bn != 0) {
                System.out.println("x có nghiệm là: x = " + (-bn / (float) nhap));
            } else {
                System.out.println("x có nghiệm là: x = 0");
            }
        } else {
            System.out.println("Phương trình vô nghiệm");
        }
    }

    public static void giaiphuongtrinhbachai() {
        System.out.println("Nhập số a: ");
        int nhapa = sc.nextInt();
        System.out.println("Nhập số b: ");
        int nhapb = sc.nextInt();
        System.out.println("Nhập số c: ");
        int nhapc = sc.nextInt();
        int Delta = nhapb * nhapb - 4 * nhapa * nhapc;
        if (Delta > 0) {
            System.out.println("Phương trình có 2 nghiệm");
            double x1 = (-nhapb + Math.sqrt(Delta)) / (2 * nhapa);
            double x2 = (-nhapb - Math.sqrt(Delta)) / (2 * nhapa);
            System.out.println("x1: " + x1);
            System.out.println("x2: " + x2);
        } else if (Delta == 0) {
            System.out.println("Phương trình có 1 nghiệm duy nhất");
            double x = (-nhapb) / (2.0 * nhapa);
            System.out.println("x: " + x);
        } else {
            System.out.println("Phương trình vô nghiệm");
        }
    }


    public static void tinhTienDien() {
        System.out.println("Nhập số điện mà bạn sử dụng (kWh):");
        double kWh = sc.nextDouble();
        double totalCost = tiendien(kWh);
        System.out.printf("Tổng tiền điện: %.0f VND\n", totalCost);
    }

    public static double tiendien(double kWh) {
        double cost = 0;
        if (kWh <= 50) {
            cost = kWh * 1678;
        } else if (kWh <= 100) {
            cost = (50 * 1678) + (kWh - 50) * 1734;
        } else if (kWh <= 200) {
            cost = (50 * 1678) + (50 * 1734) + (kWh - 100) * 2014;
        } else if (kWh <= 300) {
            cost = (50 * 1678) + (50 * 1734) + (100 * 2014) + (kWh - 200) * 2536;
        } else if (kWh <= 400) {
            cost = (50 * 1678) + (50 * 1734) + (100 * 2014) + (100 * 2536) + (kWh - 300) * 2834;
        } else {
            cost = (50 * 1678) + (50 * 1734) + (100 * 2014) + (100 * 2536) + (100 * 2834) + (kWh - 400) * 2927;
        }
        return cost;
    }

    public static void main(String[] args) {
        int choice;
        do {
            System.out.println("+-------------------------------+");
            System.out.println("1. Giải phương trình bậc nhất");
            System.out.println("2. Giải phương trình bậc 2");
            System.out.println("3. Tính tiền điện");
            System.out.println("4. Kết thúc");
            System.out.println("+------------------------------+");
            System.out.print("Chọn chức năng: ");
            choice = sc.nextInt();

            switch (choice) {
                case 1:
                    giaiphuongtrinhbacnhat();
                    break;
                case 2:
                    giaiphuongtrinhbachai();
                    break;
                case 3:
                    tinhTienDien();
                    break;
                case 4:
                    System.out.println("Kết thúc chương trình!");
                    break;
                default:
                    System.out.println("Lựa chọn không hợp lệ! Vui lòng chọn từ 1 đến 4.");
            }
        } while (choice != 4);
    }
}