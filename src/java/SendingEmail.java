import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author LENOVO
 */
public class SendingEmail {
    private String user_email;
    private String user_verification_code;
    
    public SendingEmail(String user_email, String user_verification_code) {
        this.user_email = user_email;
        this.user_verification_code = user_verification_code;
    }
    
    public void sendMail() {
        String email = "parmarronak21112003@gmail.com";
        String password = "KJRK@21_11_2003";
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        
        Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user_email, user_verification_code);
            }
        }); 
        
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(user_email));
            message.setSubject("verification");
            message.setText("Hello "+user_email);
            Transport.send(message);
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
