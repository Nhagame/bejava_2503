import java.util.Scanner;

public class bai7_venha {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập cạnh a: ");
        int a = scanner.nextInt();
        System.out.print("Nhập cạnh b: ");
        int b = scanner.nextInt();
        System.out.print("Nhập cạnh c: ");
        int c = scanner.nextInt();

        if (a <= 0 || b <= 0 || c <= 0) {
            System.out.println("Các cạnh phải là số nguyên dương!");
        } else {
            if (a + b <= c || a + c <= b || b + c <= a) {
            System.out.println("Không phải là tam giác");
            }

            boolean laTamGiacVuong = false;
            if (a * a + b * b == c * c || a * a + c * c == b * b || b * b + c * c == a * a) {
                laTamGiacVuong = true;
            }
            boolean laTamGiacCan = (a == b || a == c || b == c);
            if (a == b && b == c) {
            System.out.println("Tam giác đều");
            }
            if (laTamGiacVuong && laTamGiacCan) {
            System.out.println("Tam giác vuông cân");
            }
            if (laTamGiacVuong) {
            System.out.println("tam giác vuông");
            }
            if (laTamGiacCan) {
            System.out.println("Tam giác cân");
            }
            System.out.println("Tam giác thường");
        }
    }
}
