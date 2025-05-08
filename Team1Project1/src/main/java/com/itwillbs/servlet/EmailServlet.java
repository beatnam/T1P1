package com.itwillbs.servlet;

import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String recipient = request.getParameter("to");
        String subject = request.getParameter("subject");
        String content = request.getParameter("message");

        // 환경 변수에서 이메일 정보 불러오기
        final String sender = ConfigLoader.getProperty("email.user");  
        final String password = ConfigLoader.getProperty("email.pass"); 

        // SMTP 설정
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // 인증 정보 설정
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, password);
            }
        });

        try {
            // 이메일 메시지 생성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject(subject);
            message.setContent(content, "text/html");  // HTML 이메일 적용

            // 이메일 전송
            Transport.send(message);

            response.getWriter().println("<p>이메일이 성공적으로 전송되었습니다!</p>");
        } catch (MessagingException e) {
            response.getWriter().println("<p>이메일 전송 실패: " + e.getMessage() + "</p>");
        }
    }
}

