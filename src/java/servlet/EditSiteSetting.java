package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AlertMessage;
import model.Site;

public class EditSiteSetting extends HttpServlet {

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
        
        String otpPattern = request.getParameter("otpPattern");
        String otpLength = request.getParameter("otpLength");
        String otpTimezone = request.getParameter("otpTimezone");
        
        // UPDATE to Database
        Site.editSiteInfo(site_id, site_name, domain, description, disabled);
        Site.editSiteConfig(site_id, otpPattern, otpLength, otpTimezone);
        
        String message = AlertMessage.create(AlertMessage.SUCCESS, "Successfully updated.");
        
        request.setAttribute("msg", message);
        request.setAttribute("site_id", site_id_tmp); // forward to old page after UPDATE table
        
        String url = "/SiteSetting?site_id=" + site_id_tmp;
        getServletContext().getRequestDispatcher(url).forward(request, response);
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
            Logger.getLogger(EditSiteSetting.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EditSiteSetting.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(EditSiteSetting.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EditSiteSetting.class.getName()).log(Level.SEVERE, null, ex);
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