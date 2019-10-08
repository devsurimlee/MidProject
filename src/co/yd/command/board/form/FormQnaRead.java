package co.yd.command.board.form;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.QnaBoardDAO;
import co.yd.dto.QnaBoardDTO;

public class FormQnaRead implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		QnaBoardDTO dto = new QnaBoardDTO();
		QnaBoardDTO answer = new QnaBoardDTO();
		QnaBoardDAO dao = new QnaBoardDAO();
		int qbId = Integer.parseInt(request.getParameter("qbId"));
		
		dto = dao.qnaRead(qbId);
		answer = dao.qnaReadAnswer(qbId);
		
		request.setAttribute("content", dto);
		request.setAttribute("answer", answer);
		return "board_jsp/qnaRead.jsp";
	}

}
