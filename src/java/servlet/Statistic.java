package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Log;

public class Statistic extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        String site_id = request.getParameter("site_id");
        String site_name = request.getParameter("site_name");
        String mode = request.getParameter("mode");
        String length_string = request.getParameter("length");
        
        int length = Integer.parseInt(length_string);
        
        int[] user = Log.getLog("user", site_id, mode);
        int[] req = Log.getLog("request", site_id, mode);
        int[] sms = Log.getLog("sms", site_id, mode);
        String[] unit = Log.getUnit(mode);
        
        int userSum = Log.summaryLog(site_id, "User");
        int smsSum = Log.summaryLog(site_id, "Sms");
        int requestSum = Log.summaryLog(site_id, "Request");
        
        request.setAttribute("site_id", site_id);
        request.setAttribute("site_name", site_name);
        request.setAttribute("user", user);
        request.setAttribute("req", req);
        request.setAttribute("sms", sms);
        request.setAttribute("unit", unit);
        request.setAttribute("length", length);
        request.setAttribute("user_summary", userSum);
        request.setAttribute("sms_summary", smsSum);
        request.setAttribute("request_summary", requestSum);
        getServletContext().getRequestDispatcher("/site-statistic.jsp").forward(request, response);
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
        } catch (SQLException ex) {
            Logger.getLogger(Statistic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Statistic.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(Statistic.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Statistic.class.getName()).log(Level.SEVERE, null, ex);
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
