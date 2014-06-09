package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WebDev extends People {
    
    public static int user_id;
    public static int people_id;
    public static int user_type_id;
    public static String password;
    public static int address_id;

    public WebDev(int people_id, String username, String email, String firstname, String lastname, String password) {
        super(people_id, username, email, firstname, lastname);
    }

    public static int getUser_id() {
        return user_id;
    }

    public static void setUser_id(int user_id) {
        WebDev.user_id = user_id;
    }

    public static int getUser_type_id() {
        return user_type_id;
    }

    public static void setUser_type_id(int user_type_id) {
        WebDev.user_type_id = user_type_id;
    }

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String password) {
        WebDev.password = password;
    }

    public static int getAddress_id() {
        return address_id;
    }

    public static void setAddress_id(int address_id) {
        WebDev.address_id = address_id;
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
    
    public static People find(String username, String password) throws ClassNotFoundException, SQLException {
        Connection con = ConnectionAgent.getInstance();
        WebDev a = new WebDev(people_id, username, email, firstname, lastname, password);
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * from web_developer_login where username = ? and password = ?;");
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
