package co.yd.command.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.NoticeBoardDAO;
import co.yd.dto.NoticeBoardDTO;

public class AdminNoticeListForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<NoticeBoardDTO> list = new ArrayList<>();
		NoticeBoardDAO dao = new NoticeBoardDAO();
		
		list = dao.noticeList();
		request.setAttribute("list", list);
		return "admin_board_jsp/noticeList.jsp";
	}

}
