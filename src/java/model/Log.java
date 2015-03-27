package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Log {
    public static int[] getLog(String method, String site_id_string, String mode) throws SQLException, ClassNotFoundException {
        
        int site_id = Integer.parseInt(site_id_string);
        String userWeek = "SELECT * FROM get_site_user_week_log where site_id = " + site_id;
        String userMonth = "SELECT * FROM get_site_user_month_log where site_id = " + site_id;
        String userYear = "SELECT * FROM get_site_user_year_log where site_id = " + site_id;
        String smsWeek = "SELECT * FROM get_site_sms_week_log where site_id = " + site_id;
        String smsMonth = "SELECT * FROM get_site_sms_month_log where site_id = " + site_id;
        String smsYear = "SELECT * FROM get_site_sms_year_log where site_id = " + site_id;
        String requestWeek = "SELECT * FROM get_site_request_week_log where site_id = " + site_id;
        String requestMonth = "SELECT * FROM get_site_request_month_log where site_id = " + site_id;
        String requestYear = "SELECT * FROM get_site_request_year_log where site_id = " + site_id;

        String userMode = "";
        String smsMode = "";
        String requestMode = "";

        int[] result = new int[0];

        if (mode.equals("week")) {
            result = new int[7];
            userMode = userWeek;
            smsMode = smsWeek;
            requestMode = requestWeek;
        } else if (mode.equals("month")) {
            result = new int[6];
            userMode = userMonth;
            smsMode = smsMonth;
            requestMode = requestMonth;
        } else if (mode.equals("year")) {
            result = new int[12];
            userMode = userYear;
            smsMode = smsYear;
            requestMode = requestYear;
        }

        Connection con = ConnectionAgent.getInstance();

        PreparedStatement user = con.prepareStatement(userMode);
        PreparedStatement sms = con.prepareStatement(smsMode);
        PreparedStatement request = con.prepareStatement(requestMode);

        ResultSet rs;
        int i = 0;
        switch (method) {
            case "user":
                rs = user.executeQuery();
                while (rs.next()) {
                    result[i] = rs.getInt("user");
                    i++;
                }
                break;
            case "sms":
                rs = sms.executeQuery();
                while (rs.next()) {
                    result[i] = rs.getInt("sms");
                    i++;
                }
                break;
            case "request":
                rs = request.executeQuery();
                while (rs.next()) {
                    result[i] = rs.getInt("request");
                    i++;
                }
                break;
        }
        return result;
    }

    public static String[] getUnit(String unit) throws SQLException, ClassNotFoundException {
        String weekCmd = "SELECT title FROM get_site_request_week_log";
        String monthCmd = "SELECT title FROM secuotp.get_site_request_month_log";
        String yearCmd = "SELECT title FROM secuotp.get_site_request_year_log";

        Connection con = ConnectionAgent.getInstance();

        PreparedStatement week = con.prepareStatement(weekCmd);
        PreparedStatement month = con.prepareStatement(monthCmd);
        PreparedStatement year = con.prepareStatement(yearCmd);

        String[] result = new String[0];

        ResultSet rs;
        int i = 0;
        if (unit.equals("week")) {
            result = new String[7];
            rs = week.executeQuery();
            while (rs.next()) {
                result[i] = rs.getString("title");
                i++;
            }
        } else if (unit.equals("month")) {
            result = new String[6];
            rs = month.executeQuery();
            while (rs.next()) {
                result[i] = rs.getString("title");
                i++;
            }
        } else if (unit.equals("year")) {
            result = new String[12];
            rs = year.executeQuery();
            while (rs.next()) {
                result[i] = rs.getString("title");
                i++;
            }
        }
        return result;
    }

    public static int summaryLog(String siteId, String mode) throws ClassNotFoundException, SQLException {
        Connection con = ConnectionAgent.getInstance();
        String sql = null;
        switch (mode) {
            case "Request":
                sql = "SELECT * FROM get_site_request_log WHERE site_id = ?";
                break;
            case "Sms":
                sql = "SELECT * FROM get_site_sms_log WHERE site_id = ?";
                break;
            default:
                sql = "SELECT * FROM get_site_user_log WHERE site_id = ?";
                break;
        }

        PreparedStatement ps = con.prepareCall(sql);
        ps.setInt(1, Integer.parseInt(siteId));
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(2);
        } else {
            return -1;
        }
    }
}
