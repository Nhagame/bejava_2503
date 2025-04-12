import java.util.Scanner;

public class bai5_venha {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;
        String s = "";
        do {
            System.out.println("Nhập số cần tìm nhị phân");
            n = sc.nextInt();
        }while (n<0);
        int nluu = n;
        if(n == 0 ){
            s = "0";
            System.out.println("số nhị phân là :" + s);
        }
        else{
            while(n > 0){
            int a = 0;
            s = (n % 2) + s;
            n = n/2;
            }
        }
        System.out.println("số n của bạn " + nluu +  " Sau khi biến đổi nhị phân: " + s);
    }
}
