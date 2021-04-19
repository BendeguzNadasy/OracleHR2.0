package lekerdez;

public class LekerdezFelhasznaloAdat {
    private String email;
    private String knev;
    private String vnev;
    private String tel;
    private String datum;
    private String fizu;
    private String munkakor;
    private String reszleg;

    public LekerdezFelhasznaloAdat(String email, String knev, String vnev, String tel, String datum, String fizu, String munkakor, String reszleg) {
        this.email = email;
        this.knev = knev;
        this.vnev = vnev;
        this.tel = tel;
        this.datum = datum;
        this.fizu = fizu;
        this.munkakor = munkakor;
        this.reszleg = reszleg;
    }

    public String getEmail() {
        return email;
    }

    public String getMunkakor() {
        return munkakor;
    }

    public String getKnev() {
        return knev;
    }

    public String getVnev() {
        return vnev;
    }
    
    public String getReszleg() {
        return reszleg;
    }

    public String getTel() {
        return tel;
    }

    public String getDatum() {
        return datum;
    }

    public String getFizu() {
        return fizu;
    }

    
   
}
