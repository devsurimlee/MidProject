package co.yd.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.MemberDAO;
import co.yd.dto.MemberDTO;

public class AdminMemberListFormCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();
		MemberDAO dao = new MemberDAO();
		members = dao.sel
		return null;
	}

}
