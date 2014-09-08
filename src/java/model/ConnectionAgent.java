package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionAgent {

    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final byte[] URL = {106, 100, 98, 99, 58, 109, 121, 115, 113, 108, 58, 47, 47, 115, 101, 99, 117, 111, 116, 112, 46, 115, 105, 116, 46, 107, 109, 117, 116, 116, 46, 97, 99, 46, 116, 104, 58, 51, 51, 48, 54, 47, 115, 101, 99, 117, 111, 116, 112};
    private static final byte[] USERNAME = {114, 111, 111, 116};
    private static final byte[] PASSWORD = {115, 101, 99, 117, 111, 116, 112};

    private static Connection instance = null;

    public static synchronized Connection getInstance() throws ClassNotFoundException, SQLException {
        if (instance == null) {
            Class.forName(DRIVER);
            instance = DriverManager.getConnection(new String(URL), new String(USERNAME), new String(PASSWORD));
        }
        return instance;
    }
}
