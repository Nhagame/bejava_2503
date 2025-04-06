import java.util.Scanner;
 class bai1_venha {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập nhiệt độ (°C): ");
        double celsius = scanner.nextDouble();
        double fahrenheit = (celsius * 9 / 5) + 32;
        System.out.printf("Nhiệt độ tương ứng (°F): %.2f\n", fahrenheit);
        scanner.close();
    }
}
