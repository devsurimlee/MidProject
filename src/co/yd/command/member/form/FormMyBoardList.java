package co.yd.command.member.form;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.command.Command;
import co.yd.dao.MemberDAO;
import co.yd.dto.QnaBoardDTO;

public class FormMyBoardList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		ArrayList<QnaBoardDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("id");

		list = dao.myBoardList(id);
		request.setAttribute("list", list);
		return "login_jsp/myBoardList.jsp";
	}

}
