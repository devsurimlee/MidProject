package co.yd.command.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.QnaBoardDAO;
import co.yd.dto.QnaBoardDTO;

public class AdminFormQnaList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		ArrayList<QnaBoardDTO> list = new ArrayList<>();
		QnaBoardDAO dao = new QnaBoardDAO();
		String title = request.getParameter("title");
		list = dao.qnaList(title);
		request.setAttribute("list", list);
		return "admin_board_jsp/qnaList.jsp";
	}

}
