/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gemtrack.servlets;


//import = "java.io.*,java.util.*,javax.mail.*"
//<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
//<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

import com.gemtrack.dao.EmailUti;
import com.gemtrack.dao.GEmailSender;
import java.io.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.Properties;  
import javax.mail.*;  
import javax.mail.internet.*;


import com.gemtrack.dao.SignupDao;
import com.gemtrack.entities.Signup;
import com.gemtrack.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.jasper.tagplugins.jstl.core.Redirect;

/**
 *
 * @author LENOVO
 */
public class SignupServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet signupServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            // fetch all data
            String user_id = request.getParameter("user_id");
            String user_name = request.getParameter("user_name");
            String user_email = request.getParameter("user_email");
            String user_password = request.getParameter("user_password");
            String user_cpassword = request.getParameter("user_cpassword");
            String user_mobile = request.getParameter("user_mobile");
            String user_bdate = request.getParameter("user_bdate");
            String user_registration = request.getParameter("user_registration");
//            Date user_bdate = request.getParameter("user_bdate");
  

            String user_verification_code;
            Random random = new Random();
            user_verification_code = ""+random.nextInt(999999);
//            user_verification_code = (""+random);
            out.println("<h1>User verification code is : "+user_verification_code+"</h1>");
            
            
                    

            
            
            
            
//            GEmailSender gEmailSender = new GEmailSender();
            
//            String to = "parmarjignasakishorbhai@gmail.com";
//            String from = "parmarronak21112003@gmail.com";
//            String subject = "Sending email using gmail";
//            String text = "hello ";
            
//            boolean b = gEmailSender.sendEmail(to, from, subject,text);
            
//            if(b) {
//                out.println("Succe");
//            } else {
//                
//                out.println("Problem");
//            }
            

  String host="smtp.gmail.com";  
  final String user="parmarronak21112003";//change accordingly  
  final String password="edgk duom pynn eyzj";//change accordingly  
  //edgk duom pynn eyzj
    
  String to=user_email;//change accordingly  
  
   //Get the session object  
  Properties props = new Properties();
//  props.put("mail.smtp.host", "smtp.gmail.com");
//  props.put("mail.smtp.port", "587");
//  props.put("mail.smtp.auth", true);
//  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//  props.put("mail.smtp.starttls.enable", true);
//  props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//  props.put("mail.smtp.starttls.enable","true");
props.put("mail.smtp.user","username"); 
props.put("mail.smtp.host", "smtp.gmail.com"); 
props.put("mail.smtp.port", "25"); 
props.put("mail.debug", "true"); 
props.put("mail.smtp.auth", "true"); 
props.put("mail.smtp.starttls.enable","true"); 
props.put("mail.smtp.EnableSSL.enable","true");

props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
props.setProperty("mail.smtp.socketFactory.fallback", "false");   
props.setProperty("mail.smtp.port", "465");   
props.setProperty("mail.smtp.socketFactory.port", "465");
     
   Session session = Session.getDefaultInstance(props,  
    new javax.mail.Authenticator() {  
      protected PasswordAuthentication getPasswordAuthentication() {  
    return new PasswordAuthentication(user,password);  
      }  
    });  
   
   
   //Compose the message  
    
    
    //Signup sign = new Signup(user_name, user_email, user_password, user_cpassword, user_mobile, user_bdate, user_verification_code);
            
            
      //      SignupDao sd = new SignupDao(ConnectionProvider.getConnection());
    

            
        //    if(sd.saveUser(sign)) {
//                out.println("DONE");
//                out.println("<script>alert('Register Successfull')</script>");

try {  
     MimeMessage message = new MimeMessage(session);  
     message.setFrom(new InternetAddress(user));  
     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
     message.setSubject("javatpoint");  
     message.setText("This is simple program of sending email using JavaMail API"+user_verification_code);  
     
     request.setAttribute("user_id", user_id);
     request.setAttribute("user_name", user_name);
     request.setAttribute("user_email", user_email);
     request.setAttribute("user_password", user_password);
     request.setAttribute("user_cpassword", user_cpassword);
     request.setAttribute("user_mobile", user_mobile);
     request.setAttribute("user_bdate", user_bdate);
     request.setAttribute("user_registration", user_registration);
     request.setAttribute("uvc", user_verification_code);
request.getRequestDispatcher("verify.jsp").forward(request, response);
       
    //send the message  
     Transport.send(message);  
  
   //  System.out.println("message sent successfully..."+user_verification_code);  
   
     } catch (MessagingException e) {e.printStackTrace();}     

out.println("<script>alert('success');</script>");
//                out.println("<input type='hidden' name='uservcode' value='"+user_verification_code+"' />");
                
            //    response.sendRedirect("verify.jsp");
               
          //  } else {
            //    out.println("<script>alert('Email is already exists try with another email');</script>");
              //  response.sendRedirect("login.jsp");
           // }
            
            
            
            
          //  con.prepareStatement("select * from signup where e = user_email");
            
            
            // for check email duplication
            //if(e==user_email) {
                
//            } else {
//            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
//            String user_name = request.getParameter("user_name");
//            String user_email = request.getParameter("user_email");
//            String user_password = request.getParameter("user_password");
//            String user_cpassword = request.getParameter("user_cpassword");
//            String user_mobile = request.getParameter("user_mobile");
//            String user_bdate = request.getParameter("user_bdate");
//            
//            // create Signup object...
//            Signup signup1 = new Signup(user_name, user_email, user_password, user_cpassword, user_mobile, user_bdate);
//            
//            // create signupDao object
//            signupDao signupdao = new signupDao(ConnectionProvider.getConnection());
//            
//            if(signupdao.saveUser(signup1)) {
//                out.println("done");
//            } else {
//                out.println("Error");
//            }
//
//            signupdao.saveUser(signup1);
//            
//            out.println(user_name);
            
//            out.println("<h1>Servlet SignupServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        processRequest(request, response);
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
        processRequest(request, response);
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

    private static class Date {

        public Date() {
        }
    }

}
