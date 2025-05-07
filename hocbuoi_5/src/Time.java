import java.text.SimpleDateFormat;
import java.util.Date;

public class Time {
    private int hour;
    private int minute;
    private int second;
    public Time() {};
    public Time(int hour, int minute, int second) {
        this.hour = hour;
        this.minute = minute;
        this.second = second;
    };
    public int getHour() {
        return hour;
    };
    public int getMinute() {
        return minute;
    };
    public int getSecond() {
        return second;
    };
    public void setTimeUnix(long time) {
        Date date = new Date(time);
        this.hour = date.getHours();
        this.minute = date.getMinutes();
        this.second = date.getSeconds();
    };
    public void printTime() {
        System.out.printf("%02d:%02d:%02d\n", hour, minute, second);
    }

}
