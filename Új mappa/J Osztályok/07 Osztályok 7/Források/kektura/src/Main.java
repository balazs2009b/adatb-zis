import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Main {
    static ArrayList<Szakasz> szakaszok = new ArrayList<>();


    public static void main(String[] args) throws IOException {
        // beolvasás
        Scanner be = new Scanner(new File("kektura.csv"));
        int magassag = Integer.parseInt(be.nextLine());
        while (be.hasNextLine()) {
            szakaszok.add(new Szakasz(be.nextLine()));
        }
        be.close();

        // szakaszok száma
        System.out.println("Szakaszok száma: " + szakaszok.size());

        // teljes hossz
        double hossz = 0;
        for (Szakasz sz : szakaszok) {
            hossz += sz.getTav();
        }
        System.out.printf("Túra teljes hossza: %.3f km\n", hossz);

        // leghosszabb szakaszok
        ArrayList<Szakasz> masolat = new ArrayList<>(szakaszok);
        masolat.sort((a, b) -> Double.compare(b.getTav(), a.getTav()));
        System.out.println("Leghosszabb szakaszok:");
        for (int i = 0; i < 3; i++) {
            System.out.println(masolat.get(i).toString());
        }

        // legrövidebb szakasz
        System.out.println("Legrövidebb szakasz:");
        System.out.println(masolat.get(masolat.size()-1).toString());
    }
}

