package co.yd.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.MemberDAO;
import co.yd.dto.MemberDTO;

public class AdminProductDeleteCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		
		String mId = (request.getParameter("mId"));
		
		dao.deleteMember(mId);
		
		return null;
	}
	
}