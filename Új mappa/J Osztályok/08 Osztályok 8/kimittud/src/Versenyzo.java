public class Versenyzo {
    private String nev;                  // versenyző neve
    private int db = 6;                  // zsűritagok száma
    private int[] pontok = new int[db];  // versenyző pontszámai

    public Versenyzo(String sor) {
        String[] s = sor.split(";");
        nev = s[0];
        String[] p = s[1].split(" ");
        for (int i = 0; i < db; i++) {
            pontok[i] = Integer.parseInt(p[i]);
        }
    }

    public String getNev() {
        return nev;
    }

    public int getPont(int zsuri) {
        return pontok[zsuri-1];
    }

    public int getOsszPont() {
        int min = 10;
        int max = 0;
        int osszeg = 0;
        for (int i = 0; i < db; i++) {
            if (pontok[i] < min)
                min = pontok[i];
            else if (pontok[i] > max)
                max = pontok[i];
            osszeg += pontok[i];
        }
        return osszeg - min - max;
    }
}
