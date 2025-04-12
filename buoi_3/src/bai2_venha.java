import java.util.Scanner;

public class bai2_venha {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int n;

        do {
            System.out.print("nhập n: ");
            n = scan.nextInt();
            if (n <= 0) {
                System.out.println("n phải dương, nhập lại");
            }
        }while (n<=0);
        System.out.println(fibo(n));
        System.out.println("kết thúc chương trình");
    }
    public static long fibo(int n) {
        int a = 1;
        return a = n*n*n + a ;
    }
}
