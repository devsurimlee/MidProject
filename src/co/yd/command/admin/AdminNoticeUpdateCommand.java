package co.yd.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.AdminNoticeBoardDAO;
import co.yd.dto.NoticeBoardDTO;

public class AdminNoticeUpdateCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setNbId(Integer.parseInt(request.getParameter("NbID")));
		dto.setNbTitle(request.getParameter("NbTitle"));
		dto.setNbContents(request.getParameter("Nbcontents"));
		dto.setNbHit(Integer.parseInt(request.getParameter("NbHit")));
		
		AdminNoticeBoardDAO dao = new AdminNoticeBoardDAO();
		dao.update(dto);
		
		return null;
	}

}
