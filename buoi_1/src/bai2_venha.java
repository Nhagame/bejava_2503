import java.util.Scanner;

public class bai2_venha {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập bán kính đường tròn: ");
        double radius = scanner.nextDouble();
        double chuVi = 2 * Math.PI * radius;
        System.out.printf("Chu vi đường tròn là: %.2f\n", chuVi);
        scanner.close();
    }
}
