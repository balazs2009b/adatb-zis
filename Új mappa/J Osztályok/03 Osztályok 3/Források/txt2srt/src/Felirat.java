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

    public static void main(String[] args) {
        Felirat f1 = new Felirat("01:14 - 01:16", "And we are going to grab");
        System.out.println(f1.eleje);
        System.out.println(f1.vege);
        System.out.println(f1.szoveg);
    }
}
 