package co.yd.command.member.command;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.MemberDAO;

public class MemberForgotIdCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("mName");
		String email = request.getParameter("mEmail");
		String getId = null;

		MemberDAO dao = new MemberDAO();
		getId = dao.forgotId(name, email);

		if (getId == null) { // 입력받은 이름과 이메일에 해당하는 아이디가 없음
			request.setAttribute("message", "해당 정보에 등록된 아이디가 없습니다.");
			return "login_jsp/forgotId.jsp";
		} else { // 해당하는 아이디를 찾았음
			// 이메일 전송
			final String user = "yedam.help@gmail.com"; // 보내는 사람 이메일 주소
			final String password = "pwcbixblceoqsrhv"; // 비밀번호

			Properties prop = new Properties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.port", "587");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.starttls.enable", "true");
//			prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

			Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));

				// 받는 사람의 이메일 주소
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
				// 메일 제목
				message.setSubject("쇼핑몰에서 알려드립니다.");
				// 메일 내용
				message.setText("잊어버리신 " + name + "님의 아이디는 '" + getId + "'입니다.\n즐거운 쇼핑 되세요!");

				// 전송
				Transport.send(message);
				System.out.println("Email got sent successfully");
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}

			request.setAttribute("message", "이메일로 아이디를 발송했습니다. 로그인 해 주세요.");
			return "basic_loginForm.do";

		}

	}
}