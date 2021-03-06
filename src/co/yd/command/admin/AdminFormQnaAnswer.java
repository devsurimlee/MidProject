package co.yd.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.QnaBoardDAO;
import co.yd.dto.QnaBoardDTO;

public class AdminFormQnaAnswer implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		QnaBoardDTO dto = new QnaBoardDTO();
		QnaBoardDAO dao = new QnaBoardDAO();
		int qbId = Integer.parseInt(request.getParameter("id"));
		
		dto = dao.qnaRead(qbId);
		request.setAttribute("content", dto);
		
		return "admin_board_jsp/qnaAnswer.jsp";
	}

}
