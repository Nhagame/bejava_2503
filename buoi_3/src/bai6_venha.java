public class bai6_venha {
    public static void main(String[] args) {
        int count = 0;
        for(int x = 1 ; x <= 200 ; x++){
            for (int y = 2 ; y <= 100 ; y++){
                for (int z = 5 ; z <= 40 ; z++){
                    if(x * 1 + y * 2 + x * 5 == 200 ){
                    System.out.println("tờ 1000: " + x + "-----tờ 2000: " + y + "-----tờ 5000: " + z);
                    count++;
                    }
                }
            }
        }
        System.out.println(" Tổng số cách: " + count);
    }
}
