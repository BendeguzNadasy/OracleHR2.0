package lekerdez;

public class Orszag {

    private String nev;
    private int varosokSzama;

    private Kontinens kont;

    public Orszag(String nev, int varosokSzama, Kontinens kont) {
        this.nev = nev;
        this.varosokSzama = varosokSzama;

        this.kont = kont;
    }

    public Kontinens getKont() {
        return kont;
    }

    public String getKontinens() {
        return kont.getNev();
    }

    public String getNev() {
        return nev;
    }

    public int getVarosokSzama() {
        return varosokSzama;
    }
}
