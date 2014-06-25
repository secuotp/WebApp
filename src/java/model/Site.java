package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Site {
    private int site_id;
    private String site_name;
    private String domain;
    private String serial_number;
    private String description;
    private String app_picture;
    
    public Site(int site_id, String site_name) {
        this.site_id = site_id;
        this.site_name = site_name;
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
    
    public static int addSite(String site_name, String domain, String serial_number, String description) throws ClassNotFoundException, SQLException {

        String cmd = "INSERT INTO SITE (site_name, domain, serial_number, description) VALUES (?, ?, ?, ?)";

        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setString(1, site_name);
        ps.setString(2, domain);
        ps.setString(3, serial_number);
        ps.setString(4, description);
        return ps.executeUpdate();
    }
    
    public static int editSite(int site_id, String site_name, String domain, String serial_number, String description) throws ClassNotFoundException, SQLException {
        
        String cmd = "UPDATE SITE SET site_name='" + site_name + "', domain='" + domain + "', serial_number='" + serial_number + "', description='" + description +"' where site_id = "+site_id;
        
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        int rs = ps.executeUpdate();
        return rs;
    }
}