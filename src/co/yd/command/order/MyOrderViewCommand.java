package co.yd.command.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.command.Command;
import co.yd.dao.OrderDAO;
import co.yd.dto.OrderDTO;

public class MyOrderViewCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		OrderDTO dto = new OrderDTO();
		OrderDAO dao = new OrderDAO();
		
		dto.setmId((String)session.getAttribute("id")); 
		dao.selectMyOrders(list);
		
		
		return "order_jsp/myOrderView.jsp";
	}

}
