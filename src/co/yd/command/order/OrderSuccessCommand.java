package co.yd.command.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
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
		dto.setOrderTotalPrice(Integer.parseInt(request.getParameter("orderTotalPrice")));
		dto.setOrderAddress2(request.getParameter("orderDetailAddress"));
		
		dao.insertOrders(dto);
		
		OrderDetailDTO odDto = new OrderDetailDTO();
		odDto.setOrderId(dto.getOrderId());
		odDto.setProductId(Integer.parseInt(request.getParameter("productId")));
		odDto.setAmountId(Integer.parseInt(request.getParameter("amountId")));
		odDto.setOrderProductCount(Integer.parseInt(request.getParameter("orderProductCount")));
		
		//dao.insertOrderDetail(odDto);
		
		
		return "order_jsp/orderSuccess.jsp";		
	}

}
