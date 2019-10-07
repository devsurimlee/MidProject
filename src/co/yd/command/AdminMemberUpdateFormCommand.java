package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.AdminMemberDAO;
import co.yd.dto.MemberDTO;

public class AdminMemberUpdateFormCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminMemberDAO dao = new AdminMemberDAO();
		String mId= request.getParameter("key");
		MemberDTO dto = new MemberDTO();
		dto = dao.select(mId);
		request.setAttribute("dto", dto);
		return "admin/adminMemberUpdateForm.jsp";
	}

}
