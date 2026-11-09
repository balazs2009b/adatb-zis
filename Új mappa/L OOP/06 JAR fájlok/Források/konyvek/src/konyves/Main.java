package konyves;

import konyves.alap.*;

public class Main {
    public static void main(String[] args) {
        Konyv k1 = new Konyv("Ken Follett", "A katedrális", 798, 3600);
        Konyv k2 = new Konyv("Arthur Hailey", "Autóváros", 539, 930);
        System.out.println(k1);
        System.out.println(k2);
        System.out.println("k1 k2 összehasonlítása: " + Konyv.hosszabb(k1, k2));
        System.out.println("k2 k1 összehasonlítása: " + Konyv.hosszabb(k2, k1));
    }
}
