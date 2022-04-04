/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mail;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Properties;
import java.util.Random;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author ADMIN
 */
public class resetPasswordEmail {

    public static void main(String[] args) throws MessagingException {
//        sendRecoverPasswordMail("quanglnnde150066@fpt.edu.vn", "123456", "QuangLNN");
//        System.out.println(Paths.get(".").toAbsolutePath().normalize().toString());
//System.out.println(getThisPath());
//System.out.println(System.getProperty("user.dir"));
    }

    public static String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }

    public static String getThisPath() {

//        return Paths.get(".").toAbsolutePath().normalize().toString();
//        return new File("").getAbsoluteFile().toString();
//        return System.getProperty("user.dir");
        return resetPasswordEmail.class.getProtectionDomain().getCodeSource().getLocation().getFile();
    }

    public static void sendRecoverPasswordMail(String mail, String code, String username) throws NoSuchProviderException, MessagingException {
        Properties mailServerProperties;
        mailServerProperties = System.getProperties();
        mailServerProperties.put("mail.smtp.port", "587");
        mailServerProperties.put("mail.smtp.auth", "true");
        mailServerProperties.put("mail.smtp.starttls.enable", "true");

        Session mailSession = Session.getDefaultInstance(mailServerProperties, null);
        mailSession.setDebug(true);
        Transport transport = mailSession.getTransport("smtp");
        
        // Bạn có thể chọn CC, BCC
//    generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("cc@gmail.com")); //Địa chỉ cc gmail
        MimeMessage message = new MimeMessage(mailSession);
        message.setSubject("[COZA STORE] Forgot Password? Reset Your Password Below!");
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(mail));
        //
        // This HTML mail have to 2 part, the BODY and the embedded image
        //
        MimeMultipart multipart = new MimeMultipart("related");

        // first part  (the html)
        BodyPart messageBodyPart = new MimeBodyPart();
        String emailBody = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
                + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                + "    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n"
                + "    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n"
                + "    <link href=\"https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,500;0,900;1,300&display=swap\"\n"
                + "        rel=\"stylesheet\">\n"
                + "    <title>[COZA STORE] Forgot Password?</title>\n"
                + "    <style>\n"
                + "        * {\n"
                + "            font-family: 'Roboto', sans-serif;\n"
                + "            padding: 0;\n"
                + "            margin: 0;\n"
                + "            box-sizing: border-box;\n"
                + "            font-weight: lighter;\n"
                + "        }\n"
                + "\n"
                + "        .container {\n"
                + "            background: #f1f1f1;\n"
                + "            min-height: 100vh;\n"
                + "            margin: auto;\n"
                + "            width: 50%;\n"
                + "        }\n"
                + "        @media (max-width: 991.98px) { \n"
                + "            .container {\n"
                + "                width: 70%;\n"
                + "            }\n"
                + "        }\n"
                + "        @media (max-width: 767.98px) { \n"
                + "            .container {\n"
                + "                width: 90%;\n"
                + "            }\n"
                + "        }\n"
                + "        @media (max-width: 575.98px) {\n"
                + "            .container {\n"
                + "                width: 100%;\n"
                + "            }\n"
                + "        }\n"
                + "        \n"
                + "        \n"
                + "        .a {\n"
                + "            display: flex;\n"
                + "            align-items: center;\n"
                + "            justify-content: center;\n"
                + "        }\n"
                + "\n"
                + "        .header {\n"
                + "            width: 5rem;\n"
                + "            height: 5rem;\n"
                + "            margin-left: 2rem;\n"
                + "        }\n"
                + "\n"
                + "        .header img {\n"
                + "            width: 100%;\n"
                + "            height: 100%;\n"
                + "            object-fit: contain;\n"
                + "        }\n"
                + "\n"
                + "        .mail-body {\n"
                + "            margin: 0px 2rem;\n"
                + "            background-color: #fff;\n"
                + "            padding: 0 2rem;\n"
                + "            padding-bottom: 4rem;\n"
                + "        }\n"
                + "\n"
                + "        .hello-part {\n"
                + "            padding-top: 2rem;\n"
                + "            font-size: 1rem;\n"
                + "\n"
                + "        }\n"
                + "\n"
                + "        .account {\n"
                + "            color: #717fe0;\n"
                + "            font-weight: bold;\n"
                + "            font-style: italic;\n"
                + "            font-size: 1rem;\n"
                + "\n"
                + "        }\n"
                + "\n"
                + "        .inform {\n"
                + "            font-weight: normal;\n"
                + "            font-size: 1rem;\n"
                + "            margin-bottom: 2rem;\n"
                + "            margin-top: 2rem;\n"
                + "        }\n"
                + "\n"
                + "        .box-code {\n"
                + "            width: 150px;\n"
                + "            background-color: #717fe0;\n"
                + "            color: #fff;\n"
                + "            padding: 1rem 1.5rem;\n"
                + "            text-align: center;\n"
                + "            border-radius: 2px;\n"
                + "            font-size: 1.3rem;\n"
                + "            font-weight: normal;\n"
                + "            /* margin-top: 1.5rem; */\n"
                + "            margin: 1.5rem auto;\n"
                + "        }\n"
                + "        .thank{\n"
                + "            margin-top: 2rem;\n"
                + "        }\n"
                + "        .thank div:first-child{\n"
                + "            padding-bottom: 0.2rem;\n"
                + "        }\n"
                + "        .mail-footer{\n"
                + "            text-align: center;\n"
                + "            font-size: 0.7rem;\n"
                + "        }\n"
                + "        .logo-slogan{\n"
                + "            width: 3rem;\n"
                + "            height: 3rem;\n"
                + "            margin: 0 auto;\n"
                + "        }\n"
                + "        .logo-slogan img {\n"
                + "            width: 100%;\n"
                + "            height: 100%;\n"
                + "            object-fit: contain;\n"
                + "        }\n"
                + "        .address{\n"
                + "            margin-top: 0.2rem;\n"
                + "        }\n"
                + "    </style>\n"
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <div class=\"a\">\n"
                + "        <div class=\"container\">\n"
                + "            <div class=\"header\">\n"
                + "                <img src=\"cid:logo\" alt=\"\">\n"
                + "            </div>\n"
                + "            <div class=\"mail-body\">\n"
                + "                <div class=\"hello-part\">Hello <span class=\"account\">" + username + "</span>,</div>\n"
                + "                <div class=\"inform\">A request has been recieved to\n"
                + "                    change the password for <span class=\"account\">" + username + "</span> account in Coza Store System.</div>\n"
                + "                <div class=\"code-block\">\n"
                + "                    <div>Have you lost your password? Here is your code to reset: </div>\n"
                + "                    <div class=\"box-code\">" + code + "</div>\n"
                + "                </div>\n"
                + "                <div class=\"warning\">If you did not initiate this request, please content us immediately at <a\n"
                + "                        href=\"mailto:cozaonlinestore@gmail.com\">cozaonlinestore@gmail.com</a>.</div>\n"
                + "                <div class=\"thank\">\n"
                + "                    <div>Thank you,</div>\n"
                + "                    <div>Send Coza Store Team</div>\n"
                + "                </div>\n"
                + "            </div>\n"
                + "            <div class=\"mail-footer\">\n"
                + "                <div class=\"logo-slogan\">\n"
                + "                    <img src=\"cid:logo\" alt=\"\"> \n"
                + "                </div>\n"
                + "                <div>For a better Appearance!</div>\n"
                + "                <div class=\"address\">8th floor, 379 Hudson St, New York, NY 10018</div>\n"
                + "            </div>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "\n"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        messageBodyPart.setContent(emailBody, "text/html");

        // add it
        multipart.addBodyPart(messageBodyPart);

        // second part (the image)
        BodyPart imageBodyPart = new MimeBodyPart();
//        DataSource fds = new FileDataSource("\\images\\icons\\logo-01.png");
//        DataSource fds = new FileDataSource("..\\web\\images\\icons\\logo-01.png");
//        DataSource fds = new FileDataSource("/images/icons/logo-01.png");
//        DataSource fds = new FileDataSource("./images/icons/logo-01.png");
//        DataSource fds = new FileDataSource("../images/icons/logo-01.png");
//        DataSource fds = new FileDataSource("web/images/icons/logo-01.png"); chạy được nhưng dùng ở servlet thì lỗi
//        DataSource fds = new FileDataSource("./web/images/icons/logo-01.png");
//        DataSource fds = new FileDataSource("../web/images/icons/logo-01.png");
//        DataSource fds = new FileDataSource(".../web/images/icons/logo-01.png");
//        DataSource fds = new FileDataSource("/web/images/icons/logo-01.png");
//        DataSource fds = new FileDataSource("/images/icons/logo-01.png");
//        DataSource fds = new FileDataSource("./images/icons/logo-01.png");
        DataSource fds = new FileDataSource(getThisPath().replace("WEB-INF/classes/", "") + "images/icons/logo-01.png");
        imageBodyPart.setDataHandler(new DataHandler(fds));
        imageBodyPart.setHeader("Content-ID", "<logo>");

        // add it
        multipart.addBodyPart(imageBodyPart);

        // put everything together
        message.setContent(multipart);

        transport.connect("smtp.gmail.com", "cozaonlinestore@gmail.com", "cozaonlinestore@pass123");
        transport.sendMessage(message,
                message.getRecipients(Message.RecipientType.TO));
        transport.close();
    }
}
