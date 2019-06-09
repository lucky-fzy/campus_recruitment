package com.ldu.bs.utils;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmail {
    //发送邮件
    public static void sendEmail(String companyEmail, String sendText) throws AddressException, MessagingException {
        Properties properties = new Properties();
        properties.put("mail.transport.protocol", "smtp");// 连接协议
        properties.put("mail.smtp.host", "smtp.qq.com");// 主机名
        properties.put("mail.smtp.port", 465);// 端口号
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.enable", "true");// 设置是否使用ssl安全连接 ---一般都使用
        properties.put("mail.debug", "true");// 设置是否显示debug信息 true 会在控制台显示相关信息
        // 得到回话对象
        Session session = Session.getInstance(properties);
        // 获取邮件对象
        Message message = new MimeMessage(session);

        try {
            // 设置发件人邮箱地址
            message.setFrom(new InternetAddress("1965348521@qq.com"));
            // 设置收件人邮箱地址
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(companyEmail));//一个收件人
            // 设置邮件标题
            message.setSubject("校园招");
            // 设置邮件内容   链接地址：<a style='text-decoration: none;' href='"+url.toString()+"'>"+url.toString()+"</a>
            message.setText(sendText);
            // 得到邮差对象
            Transport transport = session.getTransport();
            // 连接自己的邮箱账户
            transport.connect("1965348521@qq.com", "sxyfrmuxiloseahd");// 密码为QQ邮箱开通的stmp服务后得到的客户端授权码
            // 发送邮件
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (javax.mail.MessagingException e) {
            e.printStackTrace();
        }
    }
}
