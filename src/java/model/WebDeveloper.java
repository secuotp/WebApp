/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model;

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
    public static WebDeveloper login(String username, String password) throws NoSuchAlgorithmException, ClassNotFoundException, SQLException{
        String encPassword = EncryptData.encryptPassword(password);
        Connection con = ConnectionAgent.getInstance();
        
        String sql = "SELECT w.*, u.user_type_name FROM web_developer w JOIN user_type u ON u.user_type_id = w.user_type_id WHERE username = ? AND password = ?";
        PreparedStatement ps = con.prepareCall(sql);
        ps.setString(1, username);
        ps.setString(2, encPassword);
        
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
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
    
    public static WebDeveloper login(int userId) throws NoSuchAlgorithmException, ClassNotFoundException, SQLException{
        Connection con = ConnectionAgent.getInstance();
        
        String sql = "SELECT w.*, u.user_type_name FROM web_developer w JOIN user_type u ON u.user_type_id = w.user_type_id WHERE user_id = ?";
        PreparedStatement ps = con.prepareCall(sql);
        ps.setInt(1, userId);

        
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
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
}
