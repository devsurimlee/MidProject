package co.yd.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.NoticeBoardDAO;
import co.yd.dto.NoticeBoardDTO;

public class AdminNoticeUpdateCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		int nbId = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		
		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setNbId(nbId);
		dto.setNbTitle(title);
		dto.setNbContents(contents);
		
		NoticeBoardDAO dao = new NoticeBoardDAO();
		int r = dao.noticeUpdate(dto);
		if(r != 0) {
			request.setAttribute("updateMessage", "공지사항을 성공적으로 수정하였습니다.");
			return "admin_noticeListFormCommand.do";
		} else {
			request.setAttribute("updateMessage", "공지사항이 수정되지 않았습니다. 다시 시도해 주세요.");
			return "admin_board_jsp/noticeList.jsp";
		}
	}

}
