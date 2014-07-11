package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Log {

    public static int[] getWeekLog(String method, String site_id_string) throws SQLException, ClassNotFoundException {
        
        int site_id = Integer.parseInt(site_id_string);
        String userCmd = "SELECT * FROM get_site_user_week_log where site_id = " + site_id;
        String smsCmd = "SELECT * FROM get_site_sms_week_log where site_id = " + site_id;
        String requestCmd = "SELECT * FROM get_site_request_week_log where site_id = " + site_id;

        Connection con = ConnectionAgent.getInstance();

        PreparedStatement user = con.prepareStatement(userCmd);
        PreparedStatement sms = con.prepareStatement(smsCmd);
        PreparedStatement request = con.prepareStatement(requestCmd);
        
        int[] result = new int[7];
        
        ResultSet rs;
        int i = 0;
        if (method.equals("user")) {
            rs = user.executeQuery();
            while (rs.next()) {
                result[i] = rs.getInt("user");
                i++;
            }
        } else if (method.equals("sms")) {
            rs = sms.executeQuery();
            while (rs.next()) {
                result[i] = rs.getInt("sms");
                i++;
            }
        } else if (method.equals("request")) {
            rs = request.executeQuery();
            while (rs.next()) {
                result[i] = rs.getInt("request");
                i++;
            }
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
            result = new String[5];
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
        for (int a = 0; a < result.length; a++) {
            System.out.println(result[a]);
        }
        return result;
    }
}