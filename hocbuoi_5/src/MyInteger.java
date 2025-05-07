public class MyInteger {
    private int value;
    public MyInteger(int value) {
        this.value = value;
    };
    public int getValue() {
        return value;
    };
    public boolean isEven(){
        return value % 2 == 0;
    }
    public boolean isOdd(){
        if (value <= 1) {
            return false;
        }
        for (int i = 2; i <= Math.sqrt(value); i++) {
            if (value % i == 0) {
                return false;
            }
        }
    return true;};
    public static boolean isPrime(int value){
        return value % 2 == 0 ;
    };

    public static boolean isEven(int value){
        return value % 2 == 0;
    };
    public static boolean isOdd(int value){
        if (value <= 1) {
            return false;
        }
        for (int i = 2; i <= Math.sqrt(value); i++) {
            if (value % i == 0) {
                return false;
            }
        }
        return true;};
    public boolean equal(int value){
        return this.value == value;
    };
    public boolean equal(MyInteger other){
        return this.value == other.value;
    }
    public static int parsInt(char[] chars){
        String str = new String(chars);
        return Integer.parseInt(str);
    };
    public static int parsInt(String str){
        return Integer.parseInt(str);
    };
}
