package co.yd.command.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.command.Command;
import co.yd.dao.CartDAO;
import co.yd.dto.CartDTO;

public class CartDeleteCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		CartDTO dto = new CartDTO();
		CartDAO dao = new CartDAO();
		dto.setmId((String)session.getAttribute("id"));
		
		if (request.getParameter("deleteCheck") != null) {
			dto.setAmountId(Integer.parseInt(request.getParameter("deleteCheck")));
			dao.delectCart(dto);
		}

		
		String deleteAll = request.getParameter("deleteAll");
		if (deleteAll != null) {
			dao.delectAllCart(dto);
		}
		
		return "ajax:true";
	}

}
