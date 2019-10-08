package co.yd.command.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.QnaBoardDAO;

public class QnaDeleteCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		QnaBoardDAO dao = new QnaBoardDAO();
		int qbId = Integer.parseInt(request.getParameter("id"));
		int r = dao.qnaDelete(qbId);
		if(r != 0) {
			request.setAttribute("deleteMessage", "문의글이 삭제되었습니다.");
			return "basic_qnaListForm.do?title=상품문의";
		} else {
			request.setAttribute("deleteMessage", "문의글이 삭제되지 않았습니다. 다시 시도해 주세요.");
			return "basic_qnaListForm.do?title=상품문의";
		}
	}

}
