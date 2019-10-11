package co.yd.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
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
		
		String originEmail = dto.getmEmail();
		String[] splitEmail = originEmail.split("@");
		request.setAttribute("splitEmail", splitEmail);
		System.out.println(dto.getmEmail());
		String originPhone = dto.getmPhone();
		String[] splitPhone = originPhone.split("-");
		request.setAttribute("splitPhone", splitPhone);
		return "admin/adminMemberUpdateForm.jsp";
	}

}
