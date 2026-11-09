import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws IOException {
        // versenyzők listája
        ArrayList<Versenyzo> lista = new ArrayList<>();
        // beolvasás
        Scanner be = new Scanner(new File("selejtezo.txt"));
        while (be.hasNextLine())
            lista.add(new Versenyzo(be.nextLine()));
        be.close();
        // versenyzők száma
        int db = lista.size();
        System.out.println("3. feladat: A versenyen " + db + " versenyző vett részt.");
        // zsűritag beolvasása
        Scanner bill = new Scanner(System.in);
        System.out.print("4. feladat: Kérem a zsűritag sorszámát: ");
        int tag = bill.nextInt();
        // pontok átlaga
        int osszeg = 0;
        for (Versenyzo v : lista) {
            osszeg += v.getPont(tag);
        }
        System.out.printf("5. feladat: A zsűritag által adott pontszámok átlaga: %.1f\n",
                         (double)osszeg/db);
        // győztes
        int legjobb = 0;
        int max = lista.get(0).getOsszPont();
        for (int i = 1; i < db; i++) {
            int p = lista.get(i).getOsszPont();
            if (p > max) {
                max = p;
                legjobb = i;
            }
        }
        System.out.println("6. feladat: A legmagasabb pontszámot elért versenyző: " +
                lista.get(legjobb).getNev() + ". Pontszáma: " + max);
    }
}
