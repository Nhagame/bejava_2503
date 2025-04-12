import java.util.Scanner;

public class bai3_venha {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int a = -1, b = -1;
        for ( ; ; ) {
            System.out.print("Nhập a: ");
            a = scanner.nextInt();
            if (a >= 0) {
                break;
            }
            System.out.println("Nhập lại số a với a dương:");
        }
        for ( ; ; ) {
            System.out.print("Nhập b: ");
            b = scanner.nextInt();
            if (b >= 0) {
                break;
            }
            System.out.println("Nhập lại số b với b dương:");
        }
        int UCLNS = UCLN(a, b);
        int BSNNS = BSNN(a, b);
        System.out.println("UCLN: " + UCLNS);
        System.out.println("BSNNS: " + BSNNS);
    }

    public static int UCLN(int a, int b) {
        int ucln = 1;
        int min = a > b ? a : b;
        for (int i = 1; i <= min; i++) {
            if(a % i == 0 && b % i == 0){
                ucln = i;
            }
        }
        return ucln;
    }
    public static int BSNN(int a, int b) {
        return (a*b)/UCLN(a,b);
    }
}
