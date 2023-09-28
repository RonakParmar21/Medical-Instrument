/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.gemtrack.dao;


import java.util.Properties;  
import javax.mail.*;  
import javax.mail.internet.*;

/**
 *
 * @author LENOVO
 */
public class EmailUti {
    EmailUti() {
     
  String host="smtp.gmail.com";  
  final String user="parmarronak21112003";//change accordingly  
  final String password="mwae mirx wrzr vhzx";//change accordingly  
    
  String to="bhagyeshmorvadiya213@gmail.com";//change accordingly  
  
   //Get the session object  
  Properties props = new Properties();
  props.put("mail.smtp.host", "smtp.gmail.com");
  props.put("mail.smtp.port", "587");
  props.put("mail.smtp.auth", "true");
  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
  props.put("mail.smtp.starttls.enable", "true");
  props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
     
   Session session = Session.getDefaultInstance(props,  
    new javax.mail.Authenticator() {  
      protected PasswordAuthentication getPasswordAuthentication() {  
    return new PasswordAuthentication(user,password);  
      }  
    });  
  
   //Compose the message  
    try {  
     MimeMessage message = new MimeMessage(session);  
     message.setFrom(new InternetAddress(user));  
     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
     message.setSubject("javatpoint");  
     message.setText("This is simple program of sending email using JavaMail API");  
       
    //send the message  
     Transport.send(message);  
  
     System.out.println("message sent successfully...");  
   
     } catch (MessagingException e) {e.printStackTrace();}     
    }
    public static void main(String[] args) {  
        EmailUti eu = new EmailUti();
        
 } 
}
