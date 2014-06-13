package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WebDev {

    private static String username;
    private static String password;
    private static String firstname;
    private static String address_id;

    private WebDev(String username, String password, String firstname) {
    }

    private WebDev(String address_id) {
    }

    public static String getUsername() {
        return username;
    }

    public static void setUsername(String username) {
        WebDev.username = username;
    }

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String password) {
        WebDev.password = password;
    }

    public static String getFirstname() {
        return firstname;
    }

    public static void setFirstname(String firstname) {
        WebDev.firstname = firstname;
    }

    public static String getAddress_id() {
        return address_id;
    }

    public static void setAddress_id(String address_id) {
        WebDev.address_id = address_id;
    }

    public static int addNewAddress(String address, String city, int country_id, String postal_code) throws ClassNotFoundException, SQLException {
        Connection con = ConnectionAgent.getInstance();
        String cmd = "INSERT INTO ADDRESS (address, city, country_id, postal_code) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setString(1, address);
        ps.setString(2, city);
        ps.setInt(3, country_id);
        ps.setString(4, postal_code);
        return ps.executeUpdate();
    }

    public static int findForWebDev(String address, String city, int country_id, String postal_code) throws SQLException, ClassNotFoundException {
        Connection con = ConnectionAgent.getInstance();
        String cmd = "SELECT * FROM ADDRESS where address = ? and city = ? and postal_code = ? and country_id = ?";

        int a = -1;

        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setString(1, address);
        ps.setString(2, city);
        ps.setString(3, postal_code);
        ps.setInt(4, country_id);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
           return rs.getInt("address_id");
        }
        return a;
    }

    public static int addNewWebDev(String username, String password, String email, String firstname, String lastname, int address_id) throws ClassNotFoundException, SQLException {
        Connection con = ConnectionAgent.getInstance();
        String cmd = "INSERT INTO WEB_DEVELOPER (username, password, email, firstname, lastname, address_id) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, email);
        ps.setString(4, firstname);
        ps.setString(5, lastname);
        ps.setInt(6, address_id);
        return ps.executeUpdate();
    }

    /*public static int addNewWebDev(String cName, String cLname, String cGender, String cCID, String cAddress, String cCity, String cCountry, String cZip, String cTel, String cEmail, String eName, String eLname, String eTel, String eEmail) throws ClassNotFoundException {
     try {
     Connection con = ConnectionAgent.getInstance();
     String cmd = "INSERT INTO APP.PEOPLE (people_id, username, email, firstname, lastname) VALUES (?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(cmd);
     ps.setString(1, cName);
     ps.setString(2, cLname);
     ps.setString(3, cGender);
     ps.setString(4, cCID);
     ps.setString(5, cAddress);
     ps.setString(6, cCity);
     ps.setString(7, cCountry);
     ps.setString(8, cZip);
     ps.setString(9, cTel);
     ps.setString(10, cEmail);
     ps.setString(11, eName);
     ps.setString(12, eLname);
     ps.setString(13, eTel);
     ps.setString(14, eEmail);
     return ps.executeUpdate();
     } catch (SQLException ex) {
     Logger.getLogger(People.class.getName()).log(Level.SEVERE, null, ex);
     }
     return -1;
     }

     public static int editWebDev(String email, String firstname, String lastname, String address, String city, int country, String postal_code) {
     try {
     String cmd = "UPDATE APP.PEOPLE SET \"email\" = ?,\"firstname\" = ?, \"lastname\" = ? WHERE \"username\" = ?";
     String cmd2 = "UPDATE APP.PEOPLE SET \"address\" = ?,\"city\" = ?, \"country\" = ?, \"postal_code\" = ? WHERE \"address_id\" = ?";
            
     PreparedStatement ps = ConnectionAgent.getInstance().prepareStatement(cmd);
     ps.setString(1, cName);
     ps.setString(2, cLname);
     ps.setString(3, cGender);
     ps.setString(4, cCID);
     ps.setString(5, cAddress);
     ps.setString(6, cCity);
     ps.setString(7, cCountry);
     ps.setString(8, cZip);
     ps.setString(9, cTel);
     ps.setString(10, cEmail);
     ps.setString(11, eName);
     ps.setString(12, eLname);
     ps.setString(13, eTel);
     ps.setString(14, eEmail);
     ps.setString(15, cID);
     return ps.executeUpdate();
     } catch (SQLException ex) {
     Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
     }
     return -1;
     }

     public static int delCustomer(String cID) {
     try {
     String cmd = "DELETE from APP.CUSTOMER WHERE cID = ?";
     PreparedStatement ps = ConnectDB.getConnection().prepareStatement(cmd);
     ps.setString(1, cID);
     return ps.executeUpdate();
     } catch (SQLException ex) {
     Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
     }
     return -1;
     }

     public static Customer find(String username) {
     Connection con = ConnectDB.getConnection();
     Customer c = null;
     try {
     PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE cEmail= ? ");
     ps.setString(1, username);
     ResultSet rs = ps.executeQuery();
     while (rs.next()) {
     c = new Customer();
     c.setcName(rs.getString(1));
     c.setcLname(rs.getString(2));
     c.setcGender(rs.getString(3));
     c.setcCID(rs.getString(4));
     c.setcAddress(rs.getString(5));
     c.setcCity(rs.getString(6));
     c.setcCounty(rs.getString(7));
     c.setcZip(rs.getString(8));
     c.setcTel(rs.getString(9));
     c.setcEmail(rs.getString(10));
     c.seteName(rs.getString(11));
     c.seteLname(rs.getString(12));
     c.seteTel(rs.getString(13));
     c.seteEmail(rs.getString(14));
     }

     } catch (SQLException ex) {
     System.out.println(ex);

     }
     return c;
     }*/
    public static WebDev find(String username, String password) throws ClassNotFoundException, SQLException {
        Connection con = ConnectionAgent.getInstance();
        WebDev a = new WebDev(username, password, firstname);
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * from web_developer where username = ? and password = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                a.setFirstname(rs.getString("firstname"));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return a;
    }
}
