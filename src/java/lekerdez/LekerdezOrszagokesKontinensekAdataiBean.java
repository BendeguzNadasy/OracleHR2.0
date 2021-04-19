package lekerdez;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static lekerdez.AdatbazisKapcsolat.DRIVER;
import static lekerdez.AdatbazisKapcsolat.PASSWORD;
import static lekerdez.AdatbazisKapcsolat.SQL_KOTINENSEK_VAROSAI;
import static lekerdez.AdatbazisKapcsolat.URL;
import static lekerdez.AdatbazisKapcsolat.USER;

public class LekerdezOrszagokesKontinensekAdataiBean implements AdatbazisKapcsolat {

    private ArrayList<Orszag> osszorszag = new ArrayList<>();
    private ArrayList<Kontinens> kontinensek = new ArrayList<>();

    public LekerdezOrszagokesKontinensekAdataiBean() {
        letrehoz();
    }

    public void letrehoz() {
        orszagokListaFeltolt();
    }

    public void orszagokListaFeltolt() {
        kontinensListaFeltolt();
        try {
            Class.forName(DRIVER);
            Connection kapcsolat
                    = DriverManager.getConnection(URL, USER, PASSWORD);
            ResultSet eredmeny
                    = kapcsolat.createStatement().executeQuery(SQL_KOTINENSEK_VAROSAI);
            while (eredmeny.next()) {
                String varos = eredmeny.getString("COUNTRY_NAME");
                int darab = eredmeny.getInt("DB");
                int rID = eredmeny.getInt("REGION_ID");
                Orszag orsz = new Orszag(varos, darab, kontinenstKeres(rID));
                osszorszag.add(orsz);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public Kontinens kontinenstKeres(int kontId) {
        int i = 0;
        while (i < kontinensek.size() && kontinensek.get(i).getId() != kontId) {
            i++;
        }
        return i < kontinensek.size() ? kontinensek.get(i) : null;
    }

    public void kontinensListaFeltolt() {
        try {
            Class.forName(DRIVER);
            Connection kapcsolat = DriverManager.getConnection(URL, USER, PASSWORD);
            ResultSet eredmeny = kapcsolat.createStatement().executeQuery(SQL_KONTINENSEK_LEKERDEZ);
            while (eredmeny.next()) {
                String nev = eredmeny.getString("REGION_NAME");
                int id = eredmeny.getInt("REGION_ID");
                kontinensek.add(new Kontinens(nev, id));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public String vilagTerkep() {
        String adat = "";
        int orszagokszama = osszorszag.size();
        for (int i = 0; i < orszagokszama; i++) {

            Orszag orszag = osszorszag.get(i);

            adat += "['" + orszag.getNev() + "', " + orszag.getVarosokSzama() + "],";
            if (i == orszagokszama - 1) {
                adat += "['" + orszag.getNev() + "', " + orszag.getVarosokSzama() + "]";
            }
        }
        return adat;
    }
}
