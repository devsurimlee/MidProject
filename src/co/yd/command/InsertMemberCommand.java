package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.MemberDAO;
import co.yd.dto.MemberDTO;

public class InsertMemberCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		String path = null;

		dto.setmId(request.getParameter("id"));
		dto.setmPw(request.getParameter("password"));
		dto.setmName(request.getParameter("name"));
		dto.setmEmail(request.getParameter("email"));
		dto.setmPostcode(request.getParameter("postcode"));
		dto.setmAddress1(request.getParameter("address"));
		dto.setmPhone(request.getParameter("phone"));

		System.out.println(request.getParameter("id"));
		
		int r = dao.insertMember(dto);

		if (r != 0) {
			path = "login_jsp/joinSuccess.jsp";
		} else {
			path = "login_jsp/joinFailure.jsp";
		}

		return path;

	}

}
