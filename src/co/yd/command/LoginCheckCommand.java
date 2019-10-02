package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.dao.MemberDAO;
import co.yd.dto.MemberDTO;

public class LoginCheckCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달된 id, password를 받아서 DB에서 확인해서 인증
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();

		String path = null;
		HttpSession session = request.getSession(false);

		dto.setmId(request.getParameter("id"));
		dto.setmPw(request.getParameter("pw"));

		System.out.println("command in");
		
		dto = dao.loginCheck(dto);

		System.out.println(dto.getmName());
		
		if (dto.getgGrade() != null) {
			System.out.println(dto.getgGrade());
			session.setAttribute("id", dto.getmId()); // 세션에 아이디저장
			session.setAttribute("grant", dto.getgGrade());
			session.setAttribute("name", dto.getmName());
			path = "/basic_index.do";
		} else {
			request.setAttribute("message", "로그인 실패하셨습니다. 아이디와 비밀번호를 다시 확인해 주세요.");
			path = "login_jsp/loginForm.jsp";
		}

		return path;
	}

}
