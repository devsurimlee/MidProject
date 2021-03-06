package co.yd.command.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.command.Command;
import co.yd.dao.MemberDAO;

public class MemberUpdatePwCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("id");
		String pw = request.getParameter("mPw");
		
		MemberDAO dao = new MemberDAO();
		int r = dao.resetPw(id, pw);
		
		if (r != 0) { // 성공
			request.setAttribute("resetPw", "비밀번호 재설정을 완료하였습니다. 다시 로그인 해 주세요.");
			session.invalidate();
			return "basic_loginForm.do";
		} else { // 실패
			request.setAttribute("message", "비밀번호 재설정에 실패하였습니다. 다시 시도해 주세요.");
			return "login_jsp/updatePw.jsp";
		}
	}

}
