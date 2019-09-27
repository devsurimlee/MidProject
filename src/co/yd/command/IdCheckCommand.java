package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.MemberDAO;

public class IdCheckCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();

		String id = request.getParameter("id");
		boolean flag = dao.isIdCheck(id);
		String ajax = null;

		if (flag) {
			

		} else {
			
		}

		return "ajax:"+ajax;
	}

}
