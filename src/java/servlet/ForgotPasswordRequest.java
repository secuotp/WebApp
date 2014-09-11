/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AlertMessage;
import model.WebDeveloper;
import model.email.EmailSender;

/**
 *
 * @author zenology
 */
public class ForgotPasswordRequest extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, NoSuchAlgorithmException {
        String email = request.getParameter("email");
        String validator = WebDeveloper.generateValidator(email);
        if (WebDeveloper.passwordAvailiblity(email)) {
            String content = "<div style=\"width:90%; margin: 20px auto 0 auto; box-shadow: 0px 0px 10px 0px rgba(50, 50, 50, 0.75); border-radius: 5px\">\n"
                    + "    <div style=\"width:100% - 10px; height:55px; background-color: #36bbc4; padding: 10px; border-top-left-radius: 5px;border-top-right-radius: 5px\">\n"
                    + "         Logo Zone\n"
                    + "    </div>\n"
                    + "    <div style=\"padding: 10px; min-height: 300px\">\n"
                    + "        <p>Dear " + email + "</p>\n"
                    + "<p>To reset your password click on this link:\n"
                    + "<a href=\"https://secuotp.sit.kmutt.ac.th/WebApp/PasswordReset?v=" + validator + "\">Reset Password</a>"
                    + "    </div>"
                    + "</div>";
            try {
                EmailSender.sendHTML(email, "SecuOTP: Password Reset", content);
                
                String message = AlertMessage.create(AlertMessage.INFO, "Password reset Email has been sent");
                request.setAttribute("msg", message);
                getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
            } catch (MessagingException ex) {
                String message = AlertMessage.create(AlertMessage.ERROR, "Messaging Error: Email can't be sent");
                request.setAttribute("msg", message);
                getServletContext().getRequestDispatcher("/forgot-password.jsp").forward(request, response);
            }
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
            Logger.getLogger(ForgotPasswordRequest.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException ex) {
            Logger.getLogger(ForgotPasswordRequest.class.getName()).log(Level.SEVERE, null, ex);
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
