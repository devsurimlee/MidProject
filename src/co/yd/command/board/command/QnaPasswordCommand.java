package co.yd.command.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.QnaBoardDAO;

public class QnaPasswordCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		int qbId = Integer.parseInt(request.getParameter("qbId"));
		int password = Integer.parseInt(request.getParameter("pw"));
		QnaBoardDAO dao = new QnaBoardDAO();
		int r = dao.qnaPasswordCheck(qbId, password);
		
		if(r != 0) {
			return "basic_qnaReadForm.do?id"+qbId;
		} else {
			request.setAttribute("passwordMessage", "비밀번호가 일치하지 않습니다. 다시 시도해 주세요.");
			return "basic_qnaListForm.do?title=상품문의";
		}
	}

}
