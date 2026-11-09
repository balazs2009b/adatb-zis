package pfi.epuletek;

public class Epulet {
    private final String nev;
    private final String varos;
    private final String orszag;
    private final double magassag;
    private final int emeletek;
    private final int ev;

    public Epulet(String sor) {
        String[] s = sor.split(";");
        nev = s[0];
        varos = s[1];
        orszag = s[2];
        magassag = Double.parseDouble(s[3]);
        emeletek = Integer.parseInt(s[4]);
        ev = Integer.parseInt(s[5]);
    }

    public String getNev() {
        return nev;
    }

    public String getVaros() {
        return varos;
    }

    public String getOrszag() {
        return orszag;
    }

    public double getMagassag() {
        return magassag;
    }

    public int getEmeletek() {
        return emeletek;
    }

    public int getEv() {
        return ev;
    }


    @Override
    public String toString() {
        return "Név: " + nev + "\nVáros: " + varos + "\nOrszág: " + orszag
                + "\nMagasság (m): " + magassag + "\nEmeletek száma: " + emeletek
                + "\nÉpítés éve: " + ev;
    }
}
