package com.itwillbs.servlet;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/email")
public class EmailController {

    @PostMapping("/send")
    public String sendEmail(@RequestParam String to, 
                            @RequestParam String subject, 
                            @RequestParam String message) {

        final String sender = System.getenv("EMAIL_USER");
        final String password = System.getenv("EMAIL_PASS");

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, password);
            }
        });

        try {
            Message emailMessage = new MimeMessage(session);
            emailMessage.setFrom(new InternetAddress(sender));
            emailMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            emailMessage.setSubject(subject);
            emailMessage.setContent(message, "text/html");

            Transport.send(emailMessage);
            return "이메일이 성공적으로 전송되었습니다!";
        } catch (MessagingException e) {
            return "이메일 전송 실패: " + e.getMessage();
        }
    }
}