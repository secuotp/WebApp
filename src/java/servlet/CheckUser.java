package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ConnectionAgent;

public class CheckUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection connection = ConnectionAgent.getInstance();
            String uname = request.getParameter("uname");
            PreparedStatement ps = connection.prepareStatement("select username from WEB_DEVELOPER where username = ?");
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) {
                out.println("<b>" + uname + "</b> is avaliable");
                request.setAttribute("usermsg", "OK");
            } else {
                out.println("<b>" + uname + "</b> is already in use");
                request.setAttribute("usermsg", "NOT OK");
            }
            out.println();
        } catch (ClassNotFoundException | SQLException ex) {
            out.println("Error ->" + ex.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}