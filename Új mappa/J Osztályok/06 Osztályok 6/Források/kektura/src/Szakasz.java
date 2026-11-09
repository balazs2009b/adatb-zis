public class Szakasz {
    private String eleje, vege;
    private double tav;
    private int emelkedes, lejtes;
    private boolean pecsethely;

    public Szakasz(String sor) {
        String[] s = sor.split(";");
        eleje = s[0];
        vege = s[1];
        tav = Double.parseDouble(s[2].replace(",","."));
        emelkedes = Integer.parseInt(s[3]);
        lejtes = Integer.parseInt(s[4]);
        pecsethely = s[5].equals("i");
    }

    @Override
    public String toString() {
        return String.format("%s;%s;%.3f;%d;%d;%s",
                eleje,vege,tav,emelkedes,lejtes,pecsethely?"i":"n");
    }

    public static void main(String[] args) {
        Szakasz sz1 = new Szakasz("Sumeg, vasutallomas;Sumeg, buszpalyaudvar;1,208;16;6;n");
        System.out.println(sz1);
    }
}
