package servlet.linked;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AlertMessage;
import model.ConnectionAgent;
import model.WebDeveloper;

public class Emergency extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        
        HttpSession session = request.getSession();
        
        String userId_temp = ((WebDeveloper)session.getAttribute("user")).getUserId();
        
        int userId = 0;
        if (userId_temp != null) {
            userId = Integer.parseInt(userId_temp);
        }
        Connection con = ConnectionAgent.getInstance();

        PreparedStatement ps;
        String cmd = "SELECT * FROM site, admin_site_user WHERE admin_site_user.user_id = ? AND admin_site_user.site_id = site.site_id";
        ps = con.prepareStatement(cmd);
        ps.setInt(1, userId);

        ResultSet rs = ps.executeQuery();
        List<model.Site> li = new ArrayList<>();
        
        String message = AlertMessage.create(AlertMessage.ERROR, "Unable to remove. The data is not found.");
        
        while (rs.next()) {
            li.add(new model.Site(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getBoolean(7), rs.getInt(8), rs.getDate(9)));
            message = AlertMessage.create(AlertMessage.SUCCESS, "Successfully removed.");
        }
        
        request.setAttribute("msg-emergency", message);
        request.setAttribute("sites", li);
        request.setAttribute("menu", "emergency");
        getServletContext().getRequestDispatcher("/emergency.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Emergency.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Emergency.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Emergency.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Emergency.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
