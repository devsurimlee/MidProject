package co.yd.command.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.NoticeBoardDAO;

public class NoticeDeleteCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeBoardDAO dao = new NoticeBoardDAO();
		int nbId = Integer.parseInt(request.getParameter("id"));
		int r = dao.noticeDelete(nbId);
		if(r != 0) {
			request.setAttribute("deleteMessage", "공지글이 삭제되었습니다.");
			return "basic_noticeListForm.do";
		} else {
			request.setAttribute("deleteMessage", "공지글이 삭제되지 않았습니다. 다시 시도해 주세요.");
			return "basic_noticeListForm.do";
		}
	}

}
