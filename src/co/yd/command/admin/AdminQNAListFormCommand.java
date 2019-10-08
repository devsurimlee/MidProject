package co.yd.command.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.QnABoardDAO;
import co.yd.dto.QnA_BoardDTO;


public class AdminQNAListFormCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<QnA_BoardDTO> list = new ArrayList<QnA_BoardDTO>();
		QnABoardDAO dao = new QnABoardDAO();
//		list = dao.noticeList();
		request.setAttribute("list", list);
		return null;
	}

}
