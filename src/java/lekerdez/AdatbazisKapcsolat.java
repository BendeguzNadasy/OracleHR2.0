package lekerdez;

public interface AdatbazisKapcsolat { //public static final

    String URL = "jdbc:oracle:thin:@localhost:1521:xe",
            USER = "HR",
            PASSWORD = "hr",
            DRIVER = "oracle.jdbc.driver.OracleDriver";

    String SQL_ALAPADAT
            = "SELECT D1.DEPARTMENT_ID, DEPARTMENT_NAME, FIRST_NAME || ' ' || LAST_NAME AS MANAGER_NAME,\n"
            + "  (SELECT COUNT(EMPLOYEE_ID)\n"
            + "   FROM EMPLOYEES E JOIN DEPARTMENTS D2 ON D2.DEPARTMENT_ID=E.DEPARTMENT_ID\n"
            + "   WHERE E.DEPARTMENT_ID=D1.DEPARTMENT_ID) AS EMP_COUNT,\n"
            + "  (SELECT ROUND(AVG(SALARY), 2)\n"
            + "   FROM EMPLOYEES E JOIN DEPARTMENTS D2 ON D2.DEPARTMENT_ID=E.DEPARTMENT_ID\n"
            + "   WHERE E.DEPARTMENT_ID=D1.DEPARTMENT_ID) AS AVG_SALARY\n"
            + "FROM DEPARTMENTS D1, EMPLOYEES E\n"
            + "WHERE D1.MANAGER_ID=E.EMPLOYEE_ID\n"
            + "ORDER BY 2";

    String SQL_RESZLEG_NEVSOR
            = "SELECT DEPARTMENT_ID, FIRST_NAME || ' ' || LAST_NAME AS EMP_NAME\n"
            + "FROM EMPLOYEES\n"
            + "WHERE DEPARTMENT_ID=?\n"
            + "ORDER BY EMP_NAME";

    String SQL_KOTINENSEK_VAROSAI = "select CASE C.COUNTRY_NAME\n"
            + "WHEN 'United States of America' THEN 'United States' ELSE C.COUNTRY_NAME END as COUNTRY_NAME, COUNT(L.location_id) AS DB, R.REGION_NAME,R.region_id\n" +
"            from COUNTRIES C, REGIONS R, LOCATIONS L, DEPARTMENTS D\n" +
"            where L.COUNTRY_ID = C.COUNTRY_ID\n" +
"            AND C.REGION_ID = R.REGION_ID\n" +
"            AND D.LOCATION_ID = L.LOCATION_ID\n" +
"            GROUP BY C.COUNTRY_NAME, R.REGION_NAME,R.region_id";
    
    String SQL_KONTINENSEK_LEKERDEZ="select * from regions";
    
}
