import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.TreeMap;

public class Main {
    static ArrayList<Kolcsonzes> kolcsonzesek = new ArrayList<>();
    static TreeMap<Character, Integer> statisztika = new TreeMap<>();

    public static void main(String[] args) throws IOException {
        // beolvasás
        Scanner be = new Scanner(new File("kolcsonzesek.txt"));
        be.nextLine();
        while (be.hasNextLine()) {
            kolcsonzesek.add(new Kolcsonzes(be.nextLine()));
        }
        be.close();
        // kölcsönzések száma
        System.out.println("5. feladat: Napi kölcsönzések száma: "
                + kolcsonzesek.size());
        // egy kölcsönző kölcsönzései
        Scanner bill = new Scanner(System.in);
        System.out.print("6. feladat: Kérek egy mevet: ");
        String nev = bill.nextLine();
        System.out.println("\t" + nev + " kölcsönzései:");
        int kdb = 0;
        for (Kolcsonzes k : kolcsonzesek) {
            if (k.getNev().equals(nev)) {
                System.out.println("\t" + k.kolcson_ido());
                kdb++;
            }
        }
        if (kdb == 0) {
            System.out.println("\tNem volt ilyen nevű kölcsönző");
        }
        // egy időpontban a vízen lévő járművek
        System.out.print("7. feladat: Adjon meg egy időpontot óra:perc alakban: ");
        String ido = bill.nextLine();
        System.out.println("\tA vízen lévő járművek: ");
        for (Kolcsonzes k : kolcsonzesek) {
            if (k.vizen(ido)) {
                System.out.println("\t" + k.kolcson_ido() + " : " + k.getNev());
            }
        }
        // napi bevétel
        int osszbevetel = 0;
        for (Kolcsonzes k : kolcsonzesek) {
            osszbevetel += k.bevetel();
        }
        System.out.println("8. feladat: A napi bevétel: " + osszbevetel + " Ft");
        // F jármű kölcsönzői
        PrintWriter ki = new PrintWriter(new File("F.txt"));
        for (Kolcsonzes k : kolcsonzesek) {
            if (k.getJazon() == 'F') {
                ki.println(k.kolcson_ido() + " : " + k.getNev());
            }
        }
        ki.close();
        // melyik járművet hányszor kölcsönözték?
        for (Kolcsonzes k : kolcsonzesek) {
            Integer db = statisztika.get(k.getJazon());
            statisztika.put(k.getJazon(), (db == null) ? 1 : db + 1);
        }
        System.out.println("10. feladat: Statisztika");
        for (Character c : statisztika.keySet()) {
            System.out.println("\t" + c + " - " + statisztika.get(c));
        }
    }
}