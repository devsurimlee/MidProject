package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.MemberDAO;
import co.yd.dto.MemberDTO;

public class AdminMemberUpdateCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		
		dto.setmId(request.getParameter("mId"));
		dto.setmName(request.getParameter("mName"));
		dto.setmPhone(request.getParameter("mEmail"));
		dto.setmPhone(request.getParameter("mPhone"));
		dto.setmAddress1(request.getParameter("mAddress1"));
		dto.setgGrade(request.getParameter("gGrade"));
		
		dao.updateMember(dto);
		
		
		return null;
	}

}
