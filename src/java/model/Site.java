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
import java.util.Date;

/**
 *
 * @author zenology
 */
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

    public static ArrayList<Site> getUserSite(int userId) throws ClassNotFoundException, SQLException {
        Connection con = ConnectionAgent.getInstance();
        String sql = "SELECT s.* FROM site_config_full s \n"
                + "JOIN admin_site_user a ON a.site_id = s.site_id\n"
                + "WHERE a.user_id = ?";
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
}
