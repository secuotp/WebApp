/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Zenology
 */
public class MailClient {
    
    private final String FROM = "54217016@st.sit.kmutt.ac.th";
    private final String HOST = "smtp.sit.kmutt.ac.th";
    private Properties properties;
    private Session session;
    
    public MailClient() {
        properties = System.getProperties();
        properties.setProperty("mail.smtp.host", HOST);
        properties.setProperty("mail.user", "54217016");
        properties.setProperty("mail.password", "f1nalfantasy");
        session = Session.getDefaultInstance(properties);
    }
    
    public void sendTextEmail(String to, String subject, String text) {
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM));
            javax.mail.Address[] address = new javax.mail.Address[1];
            address[0] = new InternetAddress(to);
            message.addRecipients(Message.RecipientType.TO, address);
            
            message.setSubject(subject);
            message.setText(text);
            
            Transport.send(message);
        } catch (MessagingException ex) {            
            ex.printStackTrace();
        }
    }
    
    public void sendHTMLEmail(String to, String subject, String text) {
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM));
            javax.mail.Address[] address = new javax.mail.Address[1];
            address[0] = new InternetAddress(to);
            message.addRecipients(Message.RecipientType.TO, address);
            
            message.setSubject(subject);
            message.setContent(text, "text/html");
            
            Transport.send(message);
        } catch (MessagingException ex) {            
            ex.printStackTrace();
        }
    }
}
