package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.MemberDAO;
import co.yd.dao.OrderDAO;
import co.yd.dto.OrderDTO;
import co.yd.dto.OrderDetailDTO;

public class OrderSuccessCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderDAO dao = new OrderDAO();
		OrderDTO dto = new OrderDTO();
		
		dto.setmId(request.getParameter("id"));
		dto.setOrderName(request.getParameter("orderName"));
		dto.setOrderAddress1(request.getParameter("orderAddress"));
		dto.setOrderPostCode(request.getParameter("orderPostCode"));
		dto.setOrderPhoneNum(request.getParameter("orderPhoneNum"));
		dto.setOrderTotalPrice(25000);
		dto.setOrderAddress2(request.getParameter("orderDetailAddress"));
		
		dao.insertOrders(dto);
		
		OrderDetailDTO odDto = new OrderDetailDTO();
		odDto.setOrderId(dto.getOrderId());
		
		//dao.insertOrderDetail(odDto);
		
		
		return "order_jsp/orderSuccess.jsp";		
	}

}
