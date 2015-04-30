/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author nakin
 */
public class EndUser {
    private int site_id;
    private String username;
    private String email;
    private String firstname;
    private String lastname;
    private String phone_number;

    public EndUser() {
    }
    
    public int getSite_id() {
        return site_id;
    }

    public void setSite_id(int site_id) {
        this.site_id = site_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }
    
    public static ArrayList<EndUser> getEndUser(String site_id, String key) throws ClassNotFoundException, SQLException {
        
        if (key == null)
            key = "";
        
        Connection con = ConnectionAgent.getInstance();
        String sql = "SELECT * FROM end_user WHERE site_id = '" + site_id + "' AND (username like '%" + key + "%' OR firstname like '%" + key + "%' OR lastname like '%" + key + "%' OR phone_number like '%" + key + "%')";
        PreparedStatement ps = con.prepareCall(sql);
        
        ResultSet rs = ps.executeQuery();
        ArrayList<EndUser> list = new ArrayList<>();
        
        while (rs.next()) {
            EndUser e = new EndUser();
            
            e.setSite_id(rs.getInt("site_id"));
            e.setUsername(rs.getString("username"));
            e.setFirstname(rs.getString("firstname"));
            e.setLastname(rs.getString("lastname"));
            e.setEmail(rs.getString("email"));
            e.setPhone_number(rs.getString("phone_number"));
            
            list.add(e);
        }
        return list;
    }
}
