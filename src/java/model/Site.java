package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class Site extends SiteConfig {

    private int siteId;
    private String siteName;
    private String domain;
    private String serialNumber;
    private String description;
    private String imgPath;
    private boolean disabled;
    private int userCount;
    private Date dateCreated;
    
    private String otpPattern;
    private String otpLength;
    private String otpTimezone;

    public Site() {
    }

    public Site(int siteId, String siteName, String domain, String serialNumber, String description, String imgPath, boolean disabled, int userCount, Date dateCreated) {
        this.siteId = siteId;
        this.siteName = siteName;
        this.domain = domain;
        this.serialNumber = serialNumber;
        this.description = description;
        this.imgPath = imgPath;
        this.disabled = disabled;
        this.userCount = userCount;
        this.dateCreated = dateCreated;
    }

    public int getSiteId() {
        return siteId;
    }

    public void setSiteId(int siteId) {
        this.siteId = siteId;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public boolean isDisabled() {
        return disabled;
    }

    public void setDisabled(boolean disabled) {
        this.disabled = disabled;
    }

    public int getUserCount() {
        return userCount;
    }

    public void setUserCount(int userCount) {
        this.userCount = userCount;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getOtpPattern() {
        return otpPattern;
    }

    public void setOtpPattern(String otpPattern) {
        this.otpPattern = otpPattern;
    }

    public String getOtpLength() {
        return otpLength;
    }

    public void setOtpLength(String otpLength) {
        this.otpLength = otpLength;
    }

    public String getOtpTimezone() {
        return otpTimezone;
    }

    public void setOtpTimezone(String otpTimezone) {
        this.otpTimezone = otpTimezone;
    }
    
    public static ArrayList<Site> getSiteInfo(int siteId) throws ClassNotFoundException, SQLException {
        
        Connection con = ConnectionAgent.getInstance();
        String sql = "SELECT * FROM site s, site_config sc WHERE s.site_id = " + siteId + " AND sc.site_id = " + siteId;
        PreparedStatement ps = con.prepareCall(sql);
        
        ResultSet rs = ps.executeQuery();
        ArrayList<Site> list = new ArrayList<>();
        
        while (rs.next()) {
            Site s = new Site();
            
            s.setSiteId(rs.getInt(1));
            s.setSiteName(rs.getString(2));
            s.setDomain(rs.getString(3));
            s.setSerialNumber(rs.getString(4));
            s.setDescription(rs.getString(5));
            s.setImgPath(rs.getString(6));
            s.setDisabled(rs.getInt(7) > 0);
            s.setUserCount(rs.getInt(8));
            s.setDateCreated(new Date(rs.getTimestamp(9).getTime()));
            s.setOtpPattern(rs.getString("pattern_id"));
            s.setOtpLength(rs.getString("length"));
            s.setOtpTimezone(rs.getString("Time_zone_id"));
            
            list.add(s);
        }
        return list;
    }

    public static ArrayList<Site> getUserSite(int userId, String key) throws ClassNotFoundException, SQLException {
        Connection con = ConnectionAgent.getInstance();
        
        if (key == null)
            key = "";
        
        String sql = "SELECT s.* FROM site_config_full s \n"
                + "JOIN admin_site_user a ON a.site_id = s.site_id\n"
                + "WHERE a.user_id = ? AND s.site_name like '%" + key + "%'";
        PreparedStatement ps = con.prepareCall(sql);
        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();
        ArrayList<Site> list = new ArrayList<>();
        
        while (rs.next()) {
            Site s = new Site();
            s.setSiteId(rs.getInt(1));
            s.setSiteName(rs.getString(2));
            s.setDomain(rs.getString(3));
            s.setSerialNumber(rs.getString(4));
            s.setDescription(rs.getString(5));
            s.setImgPath(rs.getString(6));
            s.setDisabled(rs.getInt(7) > 0);
            s.setUserCount(rs.getInt(8));
            s.setDateCreated(new Date(rs.getTimestamp(9).getTime()));
            s.setSiteConfigId(rs.getInt(10));
            s.setPattern(rs.getString(11));
            s.setLength(rs.getInt(12));
            s.setSiteCanDisabled(rs.getInt(13) > 0);
            s.setTimeZone(rs.getString(14));
            
            list.add(s);
        }
        return list;
    }
    
    public static int addSite (String site_name, String domain, String serial_number, String description) throws ClassNotFoundException, SQLException {
        
        String cmd = "INSERT INTO site (site_name, domain, serial_number, description) VALUES (?, ?, ?, ?)";
        
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setString(1, site_name);
        ps.setString(2, domain);
        ps.setString(3, serial_number);
        ps.setString(4, description);
        return ps.executeUpdate();
    }

    public static String findSiteId (String serial_number) throws SQLException, ClassNotFoundException {
        
        // Find site_id for addAdminSiteUser method
        String cmd = "SELECT * FROM site WHERE serial_number = '" + serial_number + "'";
        Connection con = ConnectionAgent.getInstance();
        String result = "";
        int result_tmp = -1;
        PreparedStatement ps = con.prepareStatement(cmd);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            result_tmp = rs.getInt("site_id");
        }
        result = "" + result_tmp;
        return result;
    }
    
    public static int  addSiteConfig (String site_id, String otpPattern, String otpLength, String otpTimezone) throws ClassNotFoundException, SQLException {
        String cmd = "INSERT INTO site_config (site_id, pattern_id, length, otp_disable, Time_zone_id) VALUES (?, ?, ?, ?, ?)";
        
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setString(1, site_id);
        ps.setString(2, otpPattern);
        ps.setString(3, otpLength);
        ps.setString(4, "0");
        ps.setString(5, otpTimezone);
        
        return ps.executeUpdate();
    }
    
    public static int editSiteInfo (int site_id, String site_name, String domain, String description, int disabled) throws ClassNotFoundException, SQLException {

        String cmd = "UPDATE site SET site_name = ?, domain = ?, description = ?, disabled = ? WHERE site_id = ?";
        
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        
        ps.setString(1, site_name);
        ps.setString(2, domain);
        ps.setString(3, description);
        ps.setInt(4, disabled);
        ps.setInt(5, site_id);
        
        int rs = ps.executeUpdate();
 
        return rs;
    }
    
    public static int editSiteConfig (int site_id, String otpPattern, String otpLength, String otpTimezone) throws ClassNotFoundException, SQLException {
        String cmd = "UPDATE site_config SET pattern_id = ?, length = ?, Time_zone_id = ? WHERE site_id = ?";
        
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setString(1, otpPattern);
        ps.setString(2, otpLength);
        ps.setString(3, otpTimezone);
        ps.setInt(4, site_id);
        
        int rs = ps.executeUpdate();
        return rs;
    }
}
