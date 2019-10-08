package co.yd.command.board.form;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;

public class FormQnaPassword implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		int qbId = Integer.parseInt(request.getParameter("qbId"));
		request.setAttribute("qbId", qbId);
		return "board_jsp/qnaPassword.jsp";
	}

}
