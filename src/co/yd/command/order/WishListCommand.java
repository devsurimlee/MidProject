package co.yd.command.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.command.Command;
import co.yd.dao.WishListDAO;
import co.yd.dto.WishListDTO;

public class WishListCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		WishListDAO wdao = new WishListDAO();
		WishListDTO wdto = new WishListDTO();
		ArrayList<WishListDTO> optionList = new ArrayList<WishListDTO>();
		
		HttpSession session = request.getSession(false);
		session.getAttribute("id");
		
		
		wdto.setM_id((String)session.getAttribute("id")); 
		optionList = wdao.selectWishlist(wdto);
		
		request.setAttribute("optionList", optionList);
		
		return "order_jsp/wishList.jsp";
	}

}
