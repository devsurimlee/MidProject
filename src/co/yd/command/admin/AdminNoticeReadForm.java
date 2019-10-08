package co.yd.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.NoticeBoardDAO;
import co.yd.dto.NoticeBoardDTO;

public class AdminNoticeReadForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		int nbId = Integer.parseInt(request.getParameter("id"));
		NoticeBoardDAO dao = new NoticeBoardDAO();
		NoticeBoardDTO dto = new NoticeBoardDTO();
		
		dto = dao.noticeRead(nbId);
		request.setAttribute("content", dto);
		System.out.println(dto.getNbContents());
		return "admin_board_jsp/noticeRead.jsp";
	}

}
