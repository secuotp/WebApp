package servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.EncryptPassword;
import model.WebDev;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, NoSuchAlgorithmException {
        HttpSession hs = request.getSession();

        if (request.getParameter("username") != null && request.getParameter("password") != null) {
            String password = EncryptPassword.encryptPassword(request.getParameter("password"));
            WebDev wd = WebDev.find(request.getParameter("username"), password);
            if (wd.getFirstname() != null) {
                hs.setAttribute("login", "ok");
                hs.setAttribute("email", wd.getEmail());
                hs.setAttribute("firstname", wd.getFirstname());
                hs.setAttribute("lastname", wd.getLastname());
                hs.setAttribute("address_id", wd.getAddress_id());
                hs.setAttribute("user_id", wd.getUser_id());
                request.setAttribute("path", "login");
                getServletContext().getRequestDispatcher("/GetSites").forward(request, response);
            } else {
                request.setAttribute("errMsg", "<div class=\"alert alert-error\"><i class=\"icon-remove-sign\"></i>Invalid username or password.</div>");
                getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errMsg", "<div class=\"alert alert-error\"><i class=\"icon-remove-sign\"></i>Invalid username or password.</div>");
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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