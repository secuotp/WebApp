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
import model.WebDeveloper;

public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, NoSuchAlgorithmException {
        HttpSession session = request.getSession();
        session.removeAttribute("msg");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        password = EncryptPassword.encryptPassword(password);
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String country = request.getParameter("country_id");
        int country_id = Integer.parseInt(country);
        String postal_code = request.getParameter("postal_code");

        if (!WebDeveloper.emailCheck(email)) {
            session.setAttribute("msg", "<b>Register Failed: </b>This Email has already used!!");
            response.sendRedirect(getServletContext().getContextPath() + "/CountryServlet");

        } else {
            WebDeveloper.addNewAddress(address, city, country_id, postal_code);
            int address_id = WebDeveloper.findForWebDev(address, city, country_id, postal_code);
            WebDeveloper.addNewWebDev(username, password, email, firstname, lastname, address_id);
            WebDeveloper.sendValidateEmail(username, email);

            request.setAttribute("msg", "<b>Success!</b> This user has been added.<br/>Please Confirm your account via <b>Email Address</b>");
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

        } catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException ex) {
            Logger.getLogger(Register.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Register.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Register.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Register.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
