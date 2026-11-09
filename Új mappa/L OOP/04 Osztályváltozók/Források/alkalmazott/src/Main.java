public class Main {
    public static void main(String[] args) {
        Alkalmazott a = new Alkalmazott("János", 300000);
        System.out.println(a.adatok());
        a.novel(10000);
        System.out.println(a.adatok());
    }
}

