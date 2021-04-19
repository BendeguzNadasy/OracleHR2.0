package lekerdez;

import java.util.ArrayList;
import java.util.List;

public class LekerdezAlapAdat {
  public static final String HTML_START=
    "<div class=\"container\">\n" +
    "  <div class=\"panel-group\" id=\"accordion\">\n";
  private String htmlTartalom=
    "    <div class=\"panel panel-default\">\n" +
    "      <div class=\"panel-heading\">\n" +
    "        <h4 class=\"panel-title\">\n" +
    "          <a data-toggle=\"collapse\" data-parent=\"#accordion\" "+
                 "href=\"#collapse##RESZLEG_AZONOSITO##\">##RESZLEG_NEV## (##RESZLEG_LETSZAM## fő)</a>\n" +
    "        </h4>\n" +
    "      </div>\n" +
    "      <div id=\"collapse##RESZLEG_AZONOSITO##\" class=\"panel-collapse collapse##KINYITOTT##\">\n" +
    "        <div class=\"panel-body\">Vezető: ##RESZLEG_VEZETO##<br>"+
               "##RESZLEG_NEVSOR####ATLAGFIZETES##</div>\n" +
    "      </div>\n" +
    "    </div>\n";
  public static final String HTML_STOP=
    "  </div>\n" +
    "</div>";
  private int reszlegAzonosito;
  private String reszlegNev, reszlegVezeto;
  private int reszlegLetszam;
  private double reszlegAtlagfizetes;
  private List<String> reszlegNevsor=null;
  private boolean kinyitott;

  public LekerdezAlapAdat(int reszlegAzonosito, String reszlegNev, String reszlegVezeto,
      int reszlegLetszam, double reszlegAtlagfizetes) {
    this.reszlegAzonosito = reszlegAzonosito;
    this.reszlegNev = reszlegNev;
    this.reszlegVezeto = reszlegVezeto;
    this.reszlegLetszam = reszlegLetszam;
    this.reszlegAtlagfizetes = reszlegAtlagfizetes;
    reszlegNevsor=new ArrayList<>();
    kinyitott=false;
    htmlTartalomFrissit();
  }

  public void setReszlegNevsor(List<String> reszlegNevsor) {
    this.reszlegNevsor = reszlegNevsor;
  }

  public void setKinyitott(boolean kinyitott) {
    this.kinyitott = kinyitott;
  }

  public int getReszlegAzonosito() {
    return reszlegAzonosito;
  }

  public String getReszlegNev() {
    return reszlegNev;
  }

  public String getReszlegVezeto() {
    return reszlegVezeto;
  }

  public int getReszlegLetszam() {
    return reszlegLetszam;
  }

  public double getReszlegAtlagfizetes() {
    return reszlegAtlagfizetes;
  }

  public String getHtmlTartalom() {
    String alkalmazottCimke="Alkalmazott"+(reszlegLetszam-1>1?"ak":"")+": ";
    List<String> alkalmazottNevsor=new ArrayList<>();
    for (String nev : reszlegNevsor)
      if(!nev.equals(reszlegVezeto))
        alkalmazottNevsor.add(nev);
    String nevsor=String.join(", ", alkalmazottNevsor);
    return htmlTartalom.replace("##KINYITOTT##", (kinyitott?" in":"")).
      replace("##RESZLEG_NEVSOR##", 
        (reszlegLetszam>1?alkalmazottCimke+nevsor:""));
  }
  
  private void htmlTartalomFrissit() {
    String atlagFizetes=
      (reszlegLetszam>1?("<br>Átlagfizetés/hó: "+reszlegAtlagfizetes+" USD"):"");
    htmlTartalom=
      htmlTartalom.replaceAll("##RESZLEG_AZONOSITO##", ""+reszlegAzonosito).
      replace("##RESZLEG_NEV##", reszlegNev).
      replace("##RESZLEG_LETSZAM##", ""+reszlegLetszam).
      replace("##RESZLEG_VEZETO##", reszlegVezeto).
      replace("##ATLAGFIZETES##", atlagFizetes);
  }
  
}
