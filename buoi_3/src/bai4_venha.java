import java.util.Scanner;

public class bai4_venha {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Nhập số: ");
        int a = sc.nextInt();
        int reversed;

        if (a >= 0) {
            reversed = reverseNumber(a);
        } else {
            reversed = -reverseNumber(Math.abs(a));
        }

        System.out.println("Số đảo ngược là: " + reversed);
    }

    public static int reverseNumber(int num) {
        int reversed = 0;
        while (num != 0) {
            int digit = num % 10;
            reversed = reversed * 10 + digit;
            num /= 10;
        }
        return reversed;
    }
}
