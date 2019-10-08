package co.yd.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.AdminNoticeBoardDAO;
import co.yd.dto.NoticeBoardDTO;

public class AdminNoticeWriteCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NoticeBoardDTO dto = new NoticeBoardDTO();
		AdminNoticeBoardDAO dao = new AdminNoticeBoardDAO();
		dto.setNbTitle("");
		dto.setNbContents("");
		dao.insert(dto);
		return null;
	}

}
