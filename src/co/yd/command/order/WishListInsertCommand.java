package co.yd.command.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.command.Command;
import co.yd.dao.WishListDAO;
import co.yd.dto.WishListDTO;

public class WishListInsertCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		String userId = (String) session.getAttribute("id");
		String key = (String) request.getParameter("key");

		// 회원 로그인시
		if (userId != null) {
			WishListDTO dto = new WishListDTO();
			WishListDAO dao = new WishListDAO();

			dto.setM_id(userId);
			dto.setP_id(Integer.parseInt(key));
			dao.insertWishList(dto);
			request.setAttribute("dto", dto);

			// 비회원
		} else {
			//session.setAttribute("amountId", Integer.parseInt(request.getParameter("amountId")));
			//session.setAttribute("orderProductCount", Integer.parseInt(request.getParameter("orderProductCount")));
		}

		return "basic_productDetail.do?key=" + key;
	}

}
