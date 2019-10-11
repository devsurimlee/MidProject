package co.yd.command.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.command.Command;
import co.yd.dao.WishListDAO;
import co.yd.dto.WishListDTO;

public class WishListDeleteCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		
		WishListDTO dto = new WishListDTO();
		WishListDAO dao = new WishListDAO();
		dto.setM_id((String)session.getAttribute("id"));
		
		if (request.getParameter("deleteCheck") != null) {
			dto.setP_id(Integer.parseInt(request.getParameter("deleteCheck")));
			dao.delectWishList(dto);
		}

		
		String deleteAll = request.getParameter("deleteAll");
		if (deleteAll != null) {
			dao.delectAllWishList(dto);
		}
		
		return "ajax:true";
	}

}
