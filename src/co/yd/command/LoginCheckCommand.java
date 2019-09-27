package co.yd.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.dao.MemberDAO;
import co.yd.dto.MemberDTO;

public class LoginCheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달된 id, password를 받아서 DB에서 확인해서 인증
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();

		String path = null;
		HttpSession session = request.getSession(false);

		dto.setmId(request.getParameter("id"));
		dto.setmPw(request.getParameter("pw"));

		dto = dao.loginCheck(dto);

		if (dto.getgGrade() != null) {
			System.out.println(dto.getgGrade());
			session.setAttribute("id", dto.getmId()); // 세션에 아이디저장
			session.setAttribute("grant", dto.getgGrade());
			session.setAttribute("name", dto.getmName());
			path = "login_jsp/loginSuccess.jsp";
		} else {
			path = "login_jsp/loginFailure.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(path); // 패스에 경로 지정
		dispatcher.forward(request, response);

	}

}