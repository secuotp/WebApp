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

public class GetSites extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        HttpSession hs = request.getSession();
        String user_id = (String) hs.getAttribute("user_id");
        String site_name = request.getParameter("site_name");
        Connection con = ConnectionAgent.getInstance();
        
        PreparedStatement ps;
        String cmd = "SELECT * FROM site, admin_site_user WHERE admin_site_user.user_id = ? AND admin_site_user.site_id = site.site_id";
        
        if (request.getParameter("path").equals("mysi2") && !site_name.equals("")) {
            cmd = "SELECT * FROM site, admin_site_user WHERE admin_site_user.user_id = ? AND admin_site_user.site_id = site.site_id AND site_name = ?";
            ps = con.prepareStatement(cmd);
            ps.setString(1, user_id);
            ps.setString(2, site_name);
        } else {
            ps = con.prepareStatement(cmd);
            ps.setString(1, user_id);
        }
        
        ResultSet rs = ps.executeQuery();
        
        List<Site> li = new ArrayList<>();
        while (rs.next()) {
            li.add(new Site(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getString(9)));
        }
        
        hs.setAttribute("sites", li);
        if (request.getParameter("path").equals("mysi") || request.getParameter("path").equals("mysi2"))
            getServletContext().getRequestDispatcher("/sites.jsp").forward(request, response);
        if (request.getParameter("path").equals("emergency"))
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
            Logger.getLogger(GetSites.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GetSites.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(GetSites.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GetSites.class.getName()).log(Level.SEVERE, null, ex);
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
