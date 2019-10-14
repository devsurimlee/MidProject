package co.yd.command.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.command.Command;
import co.yd.dao.MemberDAO;
import co.yd.dto.MemberDTO;

public class MemberLoginCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달된 id, password를 받아서 DB에서 확인해서 인증
		System.out.println("command in");
		
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		MemberDTO ndto = new MemberDTO();

		HttpSession session = request.getSession(false);
		dto.setmId(request.getParameter("id"));
		dto.setmPw(request.getParameter("pw"));
		
		ndto = dao.loginCheck(dto);
		session.setAttribute("list", ndto);

		if (ndto.getgGrade() != null) {
			System.out.println(ndto.getgGrade());
			session.setAttribute("id", ndto.getmId()); // 세션에 아이디저장
			session.setAttribute("grant", ndto.getgGrade());
			session.setAttribute("name", ndto.getmName());
			if(request.getParameter("id").equals("admin"))
				return "admin_deliverListForm.do?status=전체";
			else
				return "basic_index.do";
		} else {
			request.setAttribute("message", "로그인 실패하셨습니다. 아이디와 비밀번호를 다시 확인해 주세요.");
			return "login_jsp/login.jsp";
		}
	}

}
