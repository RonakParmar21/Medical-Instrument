package com.gemtrack.dao;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GEmailSender {

    public boolean sendEmail(String to, String from, String subject, String text) {
        boolean flag = false;

        // SMTP properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true"); // Enable STARTTLS
        properties.put("mail.smtp.port", "587");

        String username = "parmarronak21112003";
        String password = "mwae mirx wrzr vhzx";

        // Create a session with authentication
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Create a MimeMessage
            MimeMessage message = new MimeMessage(session);
            message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to));
            message.setFrom(new InternetAddress(from));
            message.setSubject(subject);
            message.setText(text);

            // Send the message
            Transport.send(message);

            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }
}


///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package com.gemtrack.dao;
//
//import com.gemtrack.entities.Message;
//import java.util.Properties;
//import javax.mail.Authenticator;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//import org.apache.tomcat.jni.User;
//
///**
// *
// * @author LENOVO
// */
//public class GEmailSender {
//
//    public boolean sendEmail(String to, String from, String subject, String text) {
//        boolean flag = false;
//
//        // login
//        //smtp propertiess
//        Properties properties = new Properties();
//        properties.put("mail.smtp.host", "smtp.gmail.com");
//        properties.put("mail.smtp.auth", true);
//        properties.put("mail.smtp.starttls.enable", true);
//        properties.put("mail.smtp.port", "587");
//
//        String username = "parmarronak21112003";
//        String password = "KJRK@21_11_2003";
//
//        // session
//        Session session = Session.getInstance(properties, new Authenticator() {
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() {
////            return super.getPasswordAuthentication(username, password);
//                return new PasswordAuthentication(username, password);
//            }
//        });
//
//        try {
//
////            Message message = new MimeMessage(session);
//            MimeMessage message = new MimeMessage(session);
//            message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to));
//            message.setFrom(new InternetAddress(from));
//            message.setSubject(subject);
//            message.setText(text);
//
//            Transport.send(message);
//
//            flag = true;
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return flag;
//    }
//}
