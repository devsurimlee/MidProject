package co.yd.command.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.command.Command;
import co.yd.dao.MemberDAO;

public class MemberCheckPwCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String id = (String)session.getAttribute("id");
		String pw = request.getParameter("pw");
		MemberDAO dao = new MemberDAO();
		boolean flag = dao.checkPw(id, pw);
		
		if(flag == true) {
			return "login_jsp/updatePw.jsp";			
		} else {
			request.setAttribute("passwordMessage", "비밀번호가 일치하지 않습니다. 다시 시도해 주세요.");
			return "login_jsp/checkPw.jsp";
		}
	}

}
