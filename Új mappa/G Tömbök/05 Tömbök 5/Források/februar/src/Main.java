import java.util.Scanner;

public class Main {
    static Scanner bill = new Scanner(System.in);
    static int[] feb = {2,1,5,-3,3,2,8,-5,1,2,2,-5,0,5,
                       -3,5,-3,3,-21,1,-9,-2,1,1,-9,-12,0,-5};

    static double atlag() {
        int osszeg = 0;
        for (int elem : feb)
            osszeg += elem;
        return (double)osszeg/feb.length;
    }

    static int minimum() {
        int min = feb[0];
        for (int elem : feb)
            if (elem < min)
                min = elem;
        return min;
    }

    static int maximum() {
        int max = feb[0];
        for (int elem : feb)
            if (elem > max)
                max = elem;
        return max;
    }

    public static void main(String[] args) {
        char v;
        boolean kilep = false;
        do {
            System.out.println("1-Átlag 2-Min 3-Max 4-Fagy "
                             + "5-Javít 6-Diagram 0-Kilép");
            System.out.print("Választás: ");
            v = bill.nextLine().charAt(0);
            switch (v) {
                case '1' -> System.out.println("Átlag: " + atlag());
                case '2' -> System.out.println("Minimum: " + minimum());
                case '3' -> System.out.println("Maximum: " + maximum());
                case '4' -> System.out.println("Fagyos napok: ");
                case '5' -> System.out.println("Javítás: ");
                case '6' -> System.out.println("Diagram: ");
                default -> kilep = true;
            }
        } while (!kilep);
    }
}
