package co.yd.command.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.AdminMemberDAO;
import co.yd.dao.OrderDAO;
import co.yd.dto.MemberDTO;

public class AdminMemberListFormCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();

		AdminMemberDAO dao = new AdminMemberDAO();
		list = dao.SelectAll();
		for(MemberDTO dto : list) {
			dao.addAll_O_Total_Price(dto);
			System.out.println(dto.getSumOrder());
		}
		request.setAttribute("list",list);
		return "admin/adminMemberListForm.jsp";
	}

}
