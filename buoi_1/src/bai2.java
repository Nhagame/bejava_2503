import java.util.Scanner;

public class bai2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Nhập họ tên:");
        String name = scanner.nextLine();
        System.out.println("Nhập ngày tháng năm sinh:");
        String birth = scanner.nextLine();
        System.out.println("Nhập quê quán:");
        String adders = scanner.nextLine();
        System.out.println("Nhập trường Học:");
        String School = scanner.nextLine();
        System.out.println("Xin chào " + name + " đến từ " + adders + ",sinh ngày " + birth + ", học tại trường " + School);
    }
}
