package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionAgent {

    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://192.168.0.1:3306/secuotp";
    private static final byte[] USERNAME = {114, 111, 111, 116};
    private static final byte[] PASSWORD = {115, 101, 99, 117, 111, 116, 112};

    private static Connection instance = null;

    public static synchronized Connection getInstance() throws ClassNotFoundException, SQLException {
        if (instance == null) {
            Class.forName(DRIVER);
            instance = DriverManager.getConnection(URL, new String(USERNAME), new String(PASSWORD));
        }
        return instance;
    }
}
