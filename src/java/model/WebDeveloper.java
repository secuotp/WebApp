/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import model.security.EncryptData;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author Zenology
 */
public class WebDeveloper {

    private String userId;
    private String username;
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private String userType;
    private Address address;
    private boolean validate;
    private Date dateCreated;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public boolean isValidate() {
        return validate;
    }

    public void setValidate(boolean validate) {
        this.validate = validate;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    /* Static Method */
    public static WebDeveloper login(String username, String password) throws NoSuchAlgorithmException, ClassNotFoundException, SQLException {
        String encPassword = EncryptData.encryptPassword(password);
        Connection con = ConnectionAgent.getInstance();

        String sql = "SELECT w.*, u.user_type_name FROM web_developer w JOIN user_type u ON u.user_type_id = w.user_type_id WHERE username = ? AND password = ?";
        PreparedStatement ps = con.prepareCall(sql);
        ps.setString(1, username);
        ps.setString(2, encPassword);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            WebDeveloper dev = new WebDeveloper();
            dev.setUserId("" + rs.getInt(1));
            dev.setUsername(rs.getString(2));
            dev.setEmail(rs.getString(4));
            dev.setFirstName(rs.getString(5));
            dev.setLastName(rs.getString(6));
            dev.setUserType(rs.getString(11));
            dev.setValidate(rs.getBoolean(9));
            dev.setDateCreated(new Date(rs.getTimestamp(10).getTime()));
            return dev;
        }
        return null;
    }

    public static WebDeveloper login(int userId) throws NoSuchAlgorithmException, ClassNotFoundException, SQLException {
        Connection con = ConnectionAgent.getInstance();

        String sql = "SELECT w.*, u.user_type_name FROM web_developer w JOIN user_type u ON u.user_type_id = w.user_type_id WHERE user_id = ?";
        PreparedStatement ps = con.prepareCall(sql);
        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            WebDeveloper dev = new WebDeveloper();
            dev.setUserId("" + rs.getInt(1));
            dev.setUsername(rs.getString(2));
            dev.setEmail(rs.getString(4));
            dev.setFirstName(rs.getString(5));
            dev.setLastName(rs.getString(6));
            dev.setUserType(rs.getString(11));
            dev.setValidate(rs.getBoolean(9));
            dev.setDateCreated(new Date(rs.getTimestamp(10).getTime()));
            return dev;
        }
        return null;
    }

    public static boolean signUp(WebDeveloper user) throws ClassNotFoundException, SQLException {
        int addressId = insertAddress(user.getAddress());

        if (addressId >= 0) {
            return insertUser(user, addressId);
        } else {
            return false;
        }
    }

    public static boolean userAvailiblity(String username) throws ClassNotFoundException, SQLException {
        Connection con = ConnectionAgent.getInstance();
        String sql = "SELECT COUNT(*) FROM web_developer WHERE username = ?";
        PreparedStatement ps = con.prepareCall(sql);
        ps.setString(1, username);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) == 0;
        } else {
            return false;
        }

    }

    public static String generateValidator(WebDeveloper user) throws ClassNotFoundException, SQLException, NoSuchAlgorithmException {
        String validator = EncryptData.encryptValidator(user.getUsername());

        Connection con = ConnectionAgent.getInstance();
        String sql = "INSERT INTO web_developer_validate VALUES ((SELECT user_id FROM web_developer WHERE username = ? LIMIT 0, 1),?)";
        PreparedStatement ps = con.prepareCall(sql);
        ps.setString(1, user.getUsername());
        ps.setString(2, validator);

        int row = ps.executeUpdate();
        if (row > 0) {
            return validator;
        }
        return null;
    }

    public static boolean validateUser(String validator) throws ClassNotFoundException, SQLException {
        Connection con = ConnectionAgent.getInstance();
        String sql = "UPDATE web_developer w\n"
                + "JOIN web_developer_validate v ON v.user_id = w.user_id\n"
                + "SET validate = 1\n"
                + "WHERE v.validator = ?";
        PreparedStatement ps = con.prepareCall(sql);
        ps.setString(1, validator);

        int row = ps.executeUpdate();
        if (row > 0) {
            sql = "DELETE FROM web_developer_validate WHERE validator = ?";
            ps = con.prepareCall(sql);
            ps.setString(1, validator);
            
            ps.executeUpdate();
        }
        return row > 0;

    }

    // Private Method
    private static int insertAddress(Address address) throws ClassNotFoundException, SQLException {
        Connection con = ConnectionAgent.getInstance();
        String sql = "INSERT INTO address (address, city, postal_code, country_id) VALUES (?,?,?,?)";
        PreparedStatement ps = con.prepareCall(sql);
        ps.setString(1, address.getAddress());
        ps.setString(2, address.getCity());
        ps.setString(3, address.getPostalCode());
        ps.setInt(4, address.getCountry().getCountryId());

        int row = ps.executeUpdate();
        if (row > 0) {
            sql = "SELECT address_id FROM address WHERE address = ? AND city = ?";
            ps = con.prepareCall(sql);
            ps.setString(1, address.getAddress());
            ps.setString(2, address.getCity());

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        }

        return -1;
    }

    private static boolean insertUser(WebDeveloper user, int addressId) throws SQLException, ClassNotFoundException {
        Connection con = ConnectionAgent.getInstance();
        String sql = "INSERT INTO web_developer (username, password, email, firstname, lastname, address_id) VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareCall(sql);
        ps.setString(1, user.getUsername());
        ps.setString(2, user.getPassword());
        ps.setString(3, user.getEmail());
        ps.setString(4, user.getFirstName());
        ps.setString(5, user.getLastName());
        ps.setInt(6, addressId);

        int row = ps.executeUpdate();
        return row > 0;
    }
}
