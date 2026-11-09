public class Varos {
    private String nev;
    private int tav;

    public Varos(String sor) {
        String[] s = sor.split(" ");
        nev = s[0];
        tav = Integer.parseInt(s[1]);
    }

    public String getNev() {
        return nev;
    }

    public int getTav() {
        return tav;
    }

    @Override
    public String toString() {
        return nev + ' ' + tav;
    }
}

