package co.yd.command.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.AdminNoticeBoardDAO;
import co.yd.dto.NoticeBoardDTO;


public class AdminNoticeUpdateFormComand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NoticeBoardDTO dto = new NoticeBoardDTO();
		
		
		int key = Integer.parseInt(request.getParameter("key"));
		dto.setNbId(key);
		AdminNoticeBoardDAO dao =new AdminNoticeBoardDAO();
		dto = dao.noticeRead(key);
		
		request.setAttribute("dto", dto);
		
		return "admin/adminNoticeUpdateForm.jsp";
		
	}

}
