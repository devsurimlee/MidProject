package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.MemberDAO;

public class MemberCheckIdCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();

		String id = request.getParameter("id");
		boolean flag = dao.isIdCheck(id);
		String result = null;

		if (flag == true) { // 아이디 사용 가능
			result = "{\"flag\": true}";
		} else { // 아이디 사용 불가능
			result = "{\"flag\": false}";
		}

//		response.getWriter().print(result);
		return "ajax:" + result;
	}

}
