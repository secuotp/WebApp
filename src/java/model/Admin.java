package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Admin {

    String username;
    String firstname;
    String lastname;
    String email;
    String userTypeName;

    public Admin(String username, String firstname, String lastname, String email, String userTypeName) {
        this.username = username;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.userTypeName = userTypeName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserTypeName() {
        return userTypeName;
    }

    public void setUserTypeName(String userTypeName) {
        this.userTypeName = userTypeName;
    }

    public static ArrayList getAdmin(String site_id) throws ClassNotFoundException, SQLException {

        String cmd = "SELECT username, firstname, lastname, email, user_type_name FROM admin_site_user a, web_developer w, user_type u where a.user_id = w.user_id and a.role = u.user_type_id and site_id = " + site_id;

        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ResultSet rs = ps.executeQuery();

        List<Admin> admins = new ArrayList<>();
        while (rs.next()) {
            admins.add(new Admin(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
        }
        return (ArrayList) admins;
    }

    public static int addSiteAdmin(String user_id_string, String site_id_string, int role) throws ClassNotFoundException, SQLException {
        int user_id = Integer.parseInt(user_id_string);
        int site_id = Integer.parseInt(site_id_string);
        String cmd = "INSERT INTO admin_site_user (user_id, site_id, role) VALUES (?, ?, ?)";
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setInt(1, user_id);
        ps.setInt(2, site_id);
        ps.setInt(3, role);
        return ps.executeUpdate();
    }

    public static int removeAdmin(String user_id, String site_id) throws ClassNotFoundException, ClassNotFoundException, ClassNotFoundException, ClassNotFoundException, ClassNotFoundException, ClassNotFoundException, SQLException {
        String cmd = "DELETE from admin_site_user WHERE user_id = " + user_id + " AND site_id = " + site_id;
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        int rs = ps.executeUpdate();
        return rs;
    }

    public static String usernameToID(String username) throws SQLException, ClassNotFoundException {
        String cmd = "SELECT user_id FROM web_developer WHERE username = '" + username + "'";

        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ResultSet rs = ps.executeQuery();

        int result = -1;
        while (rs.next()) {
            result = rs.getInt(1);
        }
        return "" + result;
    }

    public static boolean isAlreadyAdmin(String site_id, String user_id) throws SQLException, ClassNotFoundException {
        String cmd = "SELECT user_id FROM admin_site_user WHERE site_id = " + site_id + " AND user_id = " + user_id;

        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            return true;
        }
        return false;
    }
}
