import java.util.Scanner;

public class bai6_venha {
    public static int ngaytrongthang(int nam, int thang){
        switch(thang){
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                return 31;
            case 4:
            case 6:
            case 9:
            case 11:
                return 30;
            case 2:
                if((nam % 4 == 0 && nam % 100 != 0) || (nam % 400 == 0)){
                    return 29;
                }
                return 28;
                default:
                    return -1;
        }
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Nhập a ( năm ) :");
        int a = sc.nextInt();
        System.out.println("Nhập b ( tháng ) :");
        int b = sc.nextInt();
        if (b < 1 || b > 12) {
            System.out.println("Tháng không hợp lệ! Vui lòng nhập từ 1 đến 12.");
        } else {
            int soNgay = ngaytrongthang(a, b);
            System.out.println("Số ngày trong tháng " + b + " năm " + a + " là: " + soNgay);
        }
    }
}
