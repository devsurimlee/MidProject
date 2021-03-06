package co.yd.command.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.NoticeBoardDAO;
import co.yd.dto.NoticeBoardDTO;

public class NoticeWriteCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeBoardDAO dao = new NoticeBoardDAO();
		NoticeBoardDTO dto = new NoticeBoardDTO();
		
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		
		dto.setNbTitle(title);
		dto.setNbContents(contents);
		int r = dao.noticeWrite(dto);
		if(r != 0) {
			request.setAttribute("writeMessage", "공지사항이 등록되었습니다.");
			return "basic_noticeListForm.do";
		} else {
			request.setAttribute("writeMessage", "공지사항이 등록되지 않았습니다. 다시 시도해 주세요.");
			return "basic_noticeListForm.do";
		}
	}

}
