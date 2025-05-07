import java.util.Scanner;

public class Rectangle {

   private int width;
   private int height;

   public Rectangle() {};
   public Rectangle(int width, int height) {
       this.width = width;
       this.height = height;
   }

   public int getWidth() {
       return width;
   };
   public int getHeight() {
       return height;
   };
   public void setWidth() {
       this.width = width;
   };
   public void setHeight() {
       this.height = height;
   };

    public double area() {
        return width * height;
    };
    public double perimeter() {
        return 2 * (width + height);
    };
}
