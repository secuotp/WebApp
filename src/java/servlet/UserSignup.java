/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Address;
import model.AlertMessage;
import model.security.EncryptData;
import model.WebDeveloper;
import model.email.EmailSender;

/**
 *
 * @author zenology
 */
public class UserSignup extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, NoSuchAlgorithmException, MessagingException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");

        int countryId = Integer.parseInt(request.getParameter("country"));
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String postal = request.getParameter("postal");

        WebDeveloper user = new WebDeveloper();
        user.setUsername(username);
        user.setPassword(EncryptData.encryptPassword(password));
        user.setEmail(email);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setAddress(new Address(address, city, postal, countryId));

        if (WebDeveloper.signUp(user)) {
            String validator = WebDeveloper.generateValidator(user);
            if (validator != null) {
                String content = "<div style=\"width:90%; margin: 20px auto 0 auto; box-shadow: 0px 0px 10px 0px rgba(50, 50, 50, 0.75); border-radius: 5px\">\n"
                        + "    <div style=\"width:100% - 10px; height:55px; background-color: #36bbc4; padding: 10px; border-top-left-radius: 5px;border-top-right-radius: 5px\">\n"
                        + "         Logo Zone\n"
                        + "    </div>\n"
                        + "    <div style=\"padding: 10px; min-height: 300px\">\n"
                        + "        <p>Dear "+ username +"</p>\n"
                                + "<p>Please Confirm your newly register Account from this Link</p>\n"
                                + "<a href=\"https://secuotp.sit.kmutt.ac.th/WebApp/AccountVerified?serial="+ validator +"\">Click this Link to verifiy your account to using SecuOTP Services</a>"
                        + "    </div>"
                        + "</div>";
                EmailSender.sendHTML(email, "SecuOTP: Comfirm your Account", content);
                String message = AlertMessage.create(AlertMessage.INFO, "Your Registration is Completed. Please verify your account as sent to your email");
                request.setAttribute("msg", message);
                getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else {
            String message = AlertMessage.create(AlertMessage.ERROR, "An Error Occurs when Regiser new user. Please Try again!");
            request.setAttribute("msg", message);
            getServletContext().getRequestDispatcher("/SignUp").forward(request, response);
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
        } catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException | MessagingException ex) {
            Logger.getLogger(UserSignup.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException | MessagingException ex) {
            Logger.getLogger(UserSignup.class.getName()).log(Level.SEVERE, null, ex);
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
