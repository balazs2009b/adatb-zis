public class Felirat {
    private int eleje, vege;
    private String szoveg;

    public Felirat(String s1, String s2) {
        eleje = Integer.parseInt(s1.substring(0, 2)) * 60 +
                Integer.parseInt(s1.substring(3, 5));
        vege = Integer.parseInt(s1.substring(8, 10)) * 60 +
                Integer.parseInt(s1.substring(11, 13));
        szoveg = s2;
    }

    public String getSzoveg() {
        return szoveg;
    }

    public String getIdo() {
        return atalakit(eleje) + " --> " + atalakit(vege);
    }

    public void eltol(int n) {
        eleje += n;
        vege += n;
    }

    private String atalakit(int mp) {
        return String.format("%02d:%02d:%02d", mp / 3600, (mp % 3600) / 60, (mp % 60));
    }

    public static void main(String[] args) {
        Felirat f1 = new Felirat("01:14 - 01:16", "And we are going to grab");
        f1.eltol(1);
        System.out.println(f1.getIdo());
        System.out.println(f1.getSzoveg());

        Felirat f2 = new Felirat("65:31 - 65:34", "And that's the end of phase 2.");
        f2.eltol(-1);
        System.out.println(f2.getIdo());
        System.out.println(f2.getSzoveg());
    }
}
 