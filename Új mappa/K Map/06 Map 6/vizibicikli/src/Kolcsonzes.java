public class Kolcsonzes {
    private final String nev;
    private final char jazon;
    private final int eora, eperc, vora, vperc;

    public Kolcsonzes(String sor) {
        String[] s = sor.split(";");
        nev = s[0];
        jazon = s[1].charAt(0);
        eora = Integer.parseInt(s[2]);
        eperc = Integer.parseInt(s[3]);
        vora = Integer.parseInt(s[4]);
        vperc = Integer.parseInt(s[5]);
    }

    public String getNev() {
        return nev;
    }

    public String kolcson_ido() {
        return String.format("%02d:%02d-%02d:%02d", eora, eperc, vora, vperc);
    }

    private int percek(int ora, int perc) {
        return 60 * ora + perc;
    }

    public boolean vizen(String s) {
        String[] t = s.split(":");
        int ido = percek(Integer.parseInt(t[0]), Integer.parseInt(t[1]));
        return percek(eora, eperc) <= ido && percek(vora, vperc) >= ido;
    }

    public int bevetel() {
        final int DIJ = 2400;
        int hossz = percek(vora, vperc) - percek(eora, eperc);
        return (int) Math.ceil(hossz / 30.0) * DIJ;
    }

    public char getJazon() {
        return jazon;
    }
}
