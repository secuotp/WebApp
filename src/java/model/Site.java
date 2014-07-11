package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Site {

    private int site_id;
    private String site_name;
    private String domain;
    private String serial_number;
    private String description;
    private String app_picture;
    private int disbled;
    private int user_count;
    private String date_created;

    public Site(int site_id, String site_name) {
        this.site_id = site_id;
        this.site_name = site_name;
    }

    public Site(int site_id, String site_name, String domain, String serial_number, String description, String app_picture, int disbled, int user_count, String date_created) {
        this.site_id = site_id;
        this.site_name = site_name;
        this.domain = domain;
        this.serial_number = serial_number;
        this.description = description;
        this.app_picture = app_picture;
        this.disbled = disbled;
        this.user_count = user_count;
        this.date_created = date_created;
    }

    public int getSite_id() {
        return site_id;
    }

    public void setSite_id(int site_id) {
        this.site_id = site_id;
    }

    public String getSite_name() {
        return site_name;
    }

    public void setSite_name(String site_name) {
        this.site_name = site_name;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getSerial_number() {
        return serial_number;
    }

    public void setSerial_number(String serial_number) {
        this.serial_number = serial_number;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getApp_picture() {
        return app_picture;
    }

    public void setApp_picture(String app_picture) {
        this.app_picture = app_picture;
    }

    public int getDisbled() {
        return disbled;
    }

    public void setDisbled(int disbled) {
        this.disbled = disbled;
    }

    public int getUser_count() {
        return user_count;
    }

    public void setUser_count(int user_count) {
        this.user_count = user_count;
    }

    public String getDate_created() {
        return date_created;
    }

    public void setDate_created(String date_created) {
        this.date_created = date_created;
    }

    public static int addSite(String site_name, String domain, String serial_number, String description) throws ClassNotFoundException, SQLException {

        String cmd = "INSERT INTO site (site_name, domain, serial_number, description) VALUES (?, ?, ?, ?)";

        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setString(1, site_name);
        ps.setString(2, domain);
        ps.setString(3, serial_number);
        ps.setString(4, description);
        return ps.executeUpdate();
    }

    public static int findSiteId(String serial_number) throws SQLException, ClassNotFoundException {
        
        // Find site_id for addAdminSiteUser method
        String cmd = "SELECT * FROM site where serial_number = '" + serial_number + "'";
        Connection con = ConnectionAgent.getInstance();
        int result = -1;
        PreparedStatement ps = con.prepareStatement(cmd);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            return rs.getInt("site_id");
        }
        return result;
    }

    public static int addAdminSiteUser(String user_id_string, int site_id) throws ClassNotFoundException, SQLException {
        int user_id = Integer.parseInt(user_id_string);
        String cmd = "INSERT INTO admin_site_user (user_id, site_id) VALUES (?, ?)";
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setInt(1, user_id);
        ps.setInt(2, site_id);
        return ps.executeUpdate();
    }

    public static int editSite(int site_id, String site_name, String domain, String serial_number, String description, int disabled) throws ClassNotFoundException, SQLException {

        String cmd = "UPDATE site SET site_name = '" + site_name + "', domain = '" + domain + "', serial_number = '" + serial_number + "', description = '" + description + "', disabled = " + disabled + " where site_id = " + site_id;

        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        int rs = ps.executeUpdate();
        return rs;
    }
}
