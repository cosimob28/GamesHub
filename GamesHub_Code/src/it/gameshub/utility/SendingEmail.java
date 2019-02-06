package it.gameshub.utility;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendingEmail {

	private String email;
	private String myHash;

	public SendingEmail(String email, String myHash) {
		this.email = email;
		this.myHash = myHash;
	}
	public void sendMail() {
		try{
            String host ="smtp.gmail.com" ;
            String user = "gameshub2019@gmail.com";
            String pass = "GamesHub19.";
            String to = "domenico.trotta@live.it";
            String from = "gameshub2019@gmail.com";
            String subject = "Conferma E-mail";
            String messageText = "Il tuo link di verifica :: "+"http://localhost:8080/GamesHub_Code/AttivaAccountControl?key1="+email+"&key2="+myHash;
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setText(messageText);

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("message send successfully");
        }catch(Exception ex)
        {
            System.out.println(ex);
        }
	}
}
