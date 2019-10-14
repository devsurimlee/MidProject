package co.yd.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.MemberDAO;
import co.yd.dto.MemberDTO;

public class AdminMemberDeleteCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberDAO dao = new MemberDAO();
		String deletemId = request.getParameter("key");
		System.out.println(deletemId);
		int value = dao.deleteMember(deletemId);
		String path = "";
		if (value != 0) {
			path = "admin/adminLeaveMemberListForm.jsp";
		}
		else
		{
			
		}

		// TODO Auto-generated method stub
		return path;
	}

}
