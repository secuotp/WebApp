package model;

import model.security.EncryptData;
import java.security.NoSuchAlgorithmException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Date;

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

    public static boolean checkAvailiblity(String email) throws ClassNotFoundException, SQLException {
        Connection con = ConnectionAgent.getInstance();
        String sql = "SELECT COUNT(*) FROM web_developer WHERE email = ?";
        PreparedStatement ps = con.prepareCall(sql);
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) != 0;
        } else {
            return false;
        }
    }

    public static String generateValidator(WebDeveloper user) throws ClassNotFoundException, SQLException, NoSuchAlgorithmException {
        String validator = EncryptData.encryptValidator(user.getUsername());
        try{
            String sql = "CALL insert_validator (?,?,1)";
            Connection con = ConnectionAgent.getInstance();
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, user.getUsername());
            cs.setString(2, validator);
            
            cs.execute();
            
            return validator;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }

    }

    public static String generateValidator(String email) throws ClassNotFoundException, SQLException, NoSuchAlgorithmException, SQLException {
        String validator = EncryptData.encryptValidator(email);

      
            String sql = "CALL insert_email_validator (?,?)";
            Connection con = ConnectionAgent.getInstance();
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1, email);
            cs.setString(2, validator);
            
            cs.execute();
            
            return validator;

    }
    
    // 1 for Register , 2 for Password Reset
    public static int validateUser(String validator, int mode) throws ClassNotFoundException, SQLException {
        try{
        Connection con = ConnectionAgent.getInstance();
        String sql = "CALL validate_user(?, ?, ?)";
        CallableStatement cs = con.prepareCall(sql);
        cs.setString(1, validator);
        cs.setInt(2, mode);
        cs.registerOutParameter(3, Types.INTEGER);
        
        cs.execute();
        int progress = cs.getInt(3);
        
        return progress;
        }catch(SQLException ex){
            return -1;
        }
    }
    
    public static boolean changePassword(WebDeveloper user) throws ClassNotFoundException, NoSuchAlgorithmException {
        String encryptPassword = EncryptData.encryptPassword(user.getPassword());
        try{
            Connection con = ConnectionAgent.getInstance();
            String sql = "UPDATE web_developer SET password = ? WHERE user_id = ?";
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, encryptPassword);
            ps.setString(2, user.getUserId());
            
            int row = ps.executeUpdate();
            return row > 0; 
        }catch(SQLException ex){
            return false;
        }
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
