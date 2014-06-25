package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class WebDev {

    private String user_id;
    private String email;
    private String username;
    private String password;
    private String firstname;
    private String lastname;
    private String address_id;

    private WebDev(String username, String password, String firstname) {
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getAddress_id() {
        return address_id;
    }

    public void setAddress_id(String address_id) {
        this.address_id = address_id;
    }

    public static int addNewAddress(String address, String city, int country_id, String postal_code) throws ClassNotFoundException, SQLException {

        String cmd = "INSERT INTO ADDRESS (address, city, country_id, postal_code) VALUES (?, ?, ?, ?)";

        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setString(1, address);
        ps.setString(2, city);
        ps.setInt(3, country_id);
        ps.setString(4, postal_code);
        return ps.executeUpdate();
    }

    public static int findForWebDev(String address, String city, int country_id, String postal_code) throws SQLException, ClassNotFoundException {

        String cmd = "SELECT * FROM ADDRESS where address = ? and city = ? and postal_code = ? and country_id = ?";
        Connection con = ConnectionAgent.getInstance();
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

        String cmd = "INSERT INTO WEB_DEVELOPER (username, password, email, firstname, lastname, address_id) VALUES (?, ?, ?, ?, ?, ?)";

        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, email);
        ps.setString(4, firstname);
        ps.setString(5, lastname);
        ps.setInt(6, address_id);
        return ps.executeUpdate();
    }

    public static int editAddress(int address_id, String address, String city, int country_id, String postal_code) throws ClassNotFoundException, SQLException {

        //String cmd = "UPDATE ADDRESS SET (address = ?, city = ?, country_id = ?, postal_code = ? where address_id = ?) VALUES (?, ?, ?, ?, ?)";
        //String cmd = "UPDATE ADDRESS SET (address = ?, city = ?, country_id = ?, postal_code = ? where address_id = ?) VALUES ('"+address+"', '"+city+"', "+country_id+", '"+postal_code+"', "+address_id+")";
        String cmd = "UPDATE ADDRESS SET address='" + address + "', city='" + city + "', country_id=" + country_id + ", postal_code='" + postal_code + "' where address_id=" + address_id;
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        /*ps.setString(1, address);
         ps.setString(2, city);
         ps.setInt(3, country_id);
         ps.setString(4, postal_code);
         ps.setInt(5, address_id);*/
        int rs = ps.executeUpdate();
        return rs;
    }

    public static int editWebDev(int user_id, String email, String firstname, String lastname, int address_id) throws ClassNotFoundException, SQLException {
        String cmd = "UPDATE WEB_DEVELOPER SET email='" + email + "', firstname='" + firstname + "', lastname='" + lastname + "', address_id=" + address_id + " where user_id=" + user_id;
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        int rs = ps.executeUpdate();
        return rs;
    }

    /*
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
     }*/
    public static WebDev find(String username, String password) throws ClassNotFoundException, SQLException {
        WebDev a = new WebDev(username, password, null);
        Connection con = ConnectionAgent.getInstance();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * from web_developer where username = ? and password = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                a.setEmail(rs.getString("email"));
                a.setFirstname(rs.getString("firstname"));
                a.setLastname(rs.getString("lastname"));
                a.setUser_id(rs.getString("user_id"));
                a.setAddress_id(rs.getString("address_id"));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return a;
    }
}
