import java.util.Scanner;

public class Main {

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
        if(n == 1 || n ==2){
            return 1;
        }
        else{
            return fibo(n-1) + fibo(n-2);
        }
    }
}