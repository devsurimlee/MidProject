package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.dao.OrderDAO;
import co.yd.dto.MemberDTO;

public class OrderFormCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO Odao = new OrderDAO();
		MemberDTO Mdto = new MemberDTO();
		
		String path = null;
		HttpSession session = request.getSession(false);

		Mdto.setmId(request.getParameter("id"));
		Mdto = Odao.selectUserInfo(Mdto);
		return "order_jsp/orderForm.jsp";
		
	}



}
