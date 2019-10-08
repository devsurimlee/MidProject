package co.yd.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.AdminNoticeBoardDAO;
import co.yd.dto.NoticeBoardDTO;

public class AdminNoticeWriteFormCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		return "admin/adminNoticeWriteForm.jsp";
	}

}
