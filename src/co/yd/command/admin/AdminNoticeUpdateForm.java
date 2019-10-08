package co.yd.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.NoticeBoardDAO;
import co.yd.dto.NoticeBoardDTO;

public class AdminNoticeUpdateForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nbId = Integer.parseInt(request.getParameter("id"));
		NoticeBoardDTO dto = new NoticeBoardDTO();
		NoticeBoardDAO dao = new NoticeBoardDAO();
		dto = dao.noticeRead(nbId);
		request.setAttribute("content", dto);
		return "admin_board_jsp/noticeUpdate.jsp";
	}

}
