import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    static ArrayList<Varos> varosok = new ArrayList<>();

    public static void main(String[] args) {
        System.out.println("Városok távolsága Budapesttől");
        // Beolvasás
        try (Scanner fbe = new Scanner(new File("tavolsag.txt"))) {
            while (fbe.hasNextLine())
                varosok.add(new Varos(fbe.nextLine()));
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        System.out.println(varosok.size() + " város beolvasva.");
        // Keresés
        Scanner bill = new Scanner(System.in);
        System.out.print("Város: ");
        String varos = bill.nextLine().toLowerCase();
        for (Varos v : varosok) {
            if (v.getNev().toLowerCase().contains(varos))
                System.out.println(v);
        }
        // Hozzáadás
        System.out.print("Új város és táv: ");
        Varos v = new Varos(bill.nextLine());
        varosok.add(v);
        try (PrintWriter fki = new PrintWriter(new FileWriter("tavolsag.txt", true))) {
            fki.println(v);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        System.out.println("Új város hozzáadva.");
    }
}