package konyves.alap;

public class Konyv {
    private String iro, cim;
    private int oldalszam, ar;

    public Konyv(String iro, String cim, int oldalszam, int ar) {
        this.iro = iro;
        this.cim = cim;
        this.oldalszam = oldalszam;
        this.ar = ar;
    }

    @Override
    public String toString() {
        return iro + ", " + cim + ", " + oldalszam + ", " + ar;
    }

    public static int hosszabb(Konyv a, Konyv b) {
        return a.oldalszam - b.oldalszam;
    }
}


