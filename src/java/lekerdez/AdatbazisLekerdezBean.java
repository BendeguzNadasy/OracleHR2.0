package lekerdez;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdatbazisLekerdezBean implements AdatbazisKapcsolat {

    private boolean loginOK;
    private LekerdezFelhasznaloAdat felhasznalo;

    public AdatbazisLekerdezBean() {
        loginOK = false;
    }

    public boolean isLoginOK() {
        return loginOK;
    }

    public void setLoginOK(boolean loginOK) {
        this.loginOK = loginOK;
    }

    public LekerdezFelhasznaloAdat getFelhasznalo() {
        return felhasznalo;
    }
//        String SQL_F = "SELECT E.FIRST_NAME, E.LAST_NAME, E.EMAIL, J.JOB_TITLE, D.DEPARTMENT_NAME\n"
//                + "FROM EMPLOYEES E, JOBS J, DEPARTMENTS D\n"
//                + "WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID\n"
//                + "AND E.JOB_ID = J.JOB_ID\n"
//                + "AND EMAIL = '" +fnev+ "' AND LAST_NAME = '" +jelszo+ "'";

    public boolean bejelentkezesEllenorzes(String fnev, String jelszo) {
        String SQL_F = "SELECT E.FIRST_NAME, E.LAST_NAME, E.EMAIL, E.PHONE_NUMBER, E.HIRE_DATE, E.SALARY, J.JOB_TITLE, D.DEPARTMENT_NAME\n"
                + "FROM EMPLOYEES E, JOBS J, DEPARTMENTS D\n"
                + "WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID\n"
                + "AND E.JOB_ID = J.JOB_ID\n"
                + "AND EMAIL = '" + fnev + "' AND LAST_NAME = '" + jelszo + "'";
        boolean siker = false;
        try {
            Class.forName(DRIVER);
            Connection kapcsolat = DriverManager.getConnection(URL, USER, PASSWORD);
            ResultSet eredmeny = kapcsolat.createStatement().executeQuery(SQL_F);

            while (eredmeny.next()) {
                String email = eredmeny.getString("EMAIL");
                String knev = eredmeny.getString("FIRST_NAME");
                String vnev = eredmeny.getString("LAST_NAME");
                String tel = eredmeny.getString("PHONE_NUMBER").replace('.', '-');
                String[] dat = eredmeny.getString("HIRE_DATE").split(" ");
                String fizu = eredmeny.getString("SALARY");
                String munkakor = eredmeny.getString("JOB_TITLE");
                String reszleg = eredmeny.getString("DEPARTMENT_NAME");
                felhasznalo = new LekerdezFelhasznaloAdat(email, knev, vnev, tel, dat[0], fizu, munkakor, reszleg);
                siker = true;
            }
            kapcsolat.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return siker;
    }

    public String getNyithatoCsukhatoLista() {
        List<LekerdezAlapAdat> lista = new ArrayList<>();
        StringBuilder s = null;
        try {
            Class.forName(DRIVER);
            Connection kapcsolat = DriverManager.getConnection(URL, USER, PASSWORD);
            ResultSet eredmeny = kapcsolat.createStatement().executeQuery(SQL_ALAPADAT);
            while (eredmeny.next()) {
                int reszlegAzonosito = eredmeny.getInt("DEPARTMENT_ID");
                String reszlegNev = eredmeny.getString("DEPARTMENT_NAME");
                String reszlegVezeto = eredmeny.getString("MANAGER_NAME");
                int reszlegLetszam = eredmeny.getInt("EMP_COUNT");
                double reszlegAtlagfizetes = eredmeny.getDouble("AVG_SALARY");
                lista.add(new LekerdezAlapAdat(reszlegAzonosito, reszlegNev,
                        reszlegVezeto, reszlegLetszam, reszlegAtlagfizetes));
            }
            for (LekerdezAlapAdat lekerdezAlapAdat : lista) {
                PreparedStatement utasitas = kapcsolat.prepareStatement(SQL_RESZLEG_NEVSOR);
                utasitas.setInt(1, lekerdezAlapAdat.getReszlegAzonosito());
                eredmeny = utasitas.executeQuery();
                List<String> nevsor = new ArrayList<>();
                while (eredmeny.next()) {
                    String nev = eredmeny.getString("EMP_NAME");
                    nevsor.add(nev);
                }
                lekerdezAlapAdat.setReszlegNevsor(nevsor);
            }
            kapcsolat.close();
            s = new StringBuilder(LekerdezAlapAdat.HTML_START);
            for (int i = 0; i < lista.size(); i++) {
                LekerdezAlapAdat laa = lista.get(i);
                if (i == 0) {
                    laa.setKinyitott(true);
                }
                s.append(laa.getHtmlTartalom());
            }
            s.append(LekerdezAlapAdat.HTML_STOP);
        } catch (ClassNotFoundException | SQLException e) {
            s = new StringBuilder("Adatbázis hiba...");
        }
        return s.toString();
    }

}
