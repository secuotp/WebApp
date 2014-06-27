package servlet;

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
import model.ConnectionAgent;
import model.Site;

public class EditSite2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        String site_id_tmp = request.getParameter("site_id");
        int site_id = Integer.parseInt(site_id_tmp);
        String site_name = request.getParameter("site_name");
        String domain = request.getParameter("domain");
        String serial_number = request.getParameter("serial_number");
        String description = request.getParameter("description");
        String disabled_tmp = request.getParameter("disabled");
        int disabled = Integer.parseInt(disabled_tmp);

        Site.editSite(site_id, site_name, domain, serial_number, description, disabled);

        HttpSession hs = request.getSession();
        String username = (String) hs.getAttribute("user_id");
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement("select site.site_id, site.site_name from site, admin_site_user where admin_site_user.user_id = ? and admin_site_user.site_id = site.site_id");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        List<Site> li = new ArrayList<>();
        while (rs.next()) {
            li.add(new Site(rs.getInt(1), rs.getString(2)));
        }
        hs.setAttribute("sites", li);
        request.setAttribute("ssid", site_id_tmp); // forward to old page after UPDATE table
        getServletContext().getRequestDispatcher("/EditSite").forward(request, response);
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
            Logger.getLogger(EditSite2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EditSite2.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EditSite2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EditSite2.class.getName()).log(Level.SEVERE, null, ex);
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
