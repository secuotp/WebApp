package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EndUser {

    public static int emergencyRemoveEnduser(int site_id, String username, String email, String firstname, String lastname, String phone_number) throws ClassNotFoundException, ClassNotFoundException, ClassNotFoundException, ClassNotFoundException, ClassNotFoundException, ClassNotFoundException, SQLException {
        String cmd = "DELETE from end_user WHERE site_id = " + site_id + " AND username = '" + username + "' and email = '" + email + "' and firstname = '" + firstname + "' and lastname = '" + lastname + "' and phone_number = '" + phone_number + "'";
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        int rs = ps.executeUpdate();
        return rs;
    }
}
