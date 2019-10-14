package co.yd.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.MemberDAO;
import co.yd.dto.MemberDTO;

public class AdminMemberUpdateCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		String path = "";
		System.out.println("test");
		dto.setmId(request.getParameter("mId"));
		dto.setmEmail(request.getParameter("mEmail"));
		dto.setmPhone(request.getParameter("mPhone"));
		dto.setgGrade(request.getParameter("gGrade"));
		dto.setmPostcode(request.getParameter("mpostcode"));
		dto.setmAddress1(request.getParameter("maddress1"));
		dto.setmAddress2(request.getParameter("maddress2"));
		
		System.out.println(dto.getgGrade());
		int result = dao.updateMember(dto);

		if(result > 0) {
			path = "admin/adminLeaveMemberListForm.jsp";
		}
		return path;
	}

}
