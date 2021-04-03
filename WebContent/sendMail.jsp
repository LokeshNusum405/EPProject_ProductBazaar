<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Session"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
 String user ="mealmate.sdp26@gmail.com";
          
          String pass ="Mealmate@sdp26"; 
          
          String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
          String host = "smtp.gmail.com";
          String to =(String)session.getAttribute("email"); 

          String from ="mealmate.sdp26@gmail.com";

          String subject ="Mail Check";
          
          String messageText ="change your password";  // you can use HTML tags also
          boolean sessionDebug = true;

Properties props = System.getProperties();
props.put("mail.smtp.host", host);
props.put("mail.transport.protocol.", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.", "true");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.timeout", "1000");    
props.put("mail.smtp.connectiontimeout", "1000");  
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setContent(messageText, "text/html"); // use setText if you want to send text
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
transport.sendMessage(msg, msg.getAllRecipients());    
    
out.println("success");

// res.sendRedirect("login.html");
%>