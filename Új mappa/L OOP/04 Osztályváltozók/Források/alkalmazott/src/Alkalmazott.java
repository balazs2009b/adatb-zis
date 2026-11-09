public class Alkalmazott {
    private String nev;
    private int fizetes;

    public Alkalmazott(String nev, int fizetes) {
        this.nev = nev;
        this.fizetes = fizetes;
    }

    public String getNev() {
        return nev;
    }

    public int getFizetes() {
        return fizetes;
    }

//    public void setNev(String nev) {
//        this.nev = nev;
//    }
//
//    public void setFizetes(int fizetes) {
//        this.fizetes = fizetes;
//    }

    public void novel(int noveles) {
        fizetes += noveles;
    }

    public String adatok() {
        return nev + ": " + fizetes;
    }
}