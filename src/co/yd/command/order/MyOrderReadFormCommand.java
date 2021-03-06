package co.yd.command.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.AdminOrderDAO;
import co.yd.dto.OrderDetailDTO;

public class MyOrderReadFormCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		AdminOrderDAO dao = new AdminOrderDAO();
		ArrayList<OrderDetailDTO> list = new ArrayList<>();
		list = dao.orderRead(orderId);
		request.setAttribute("read", list);
		return "order_jsp/myOrderRead.jsp";
	}

}
