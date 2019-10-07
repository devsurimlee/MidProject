package co.yd.command.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import co.yd.command.Command;
import co.yd.dao.OrderDAO;
import co.yd.dto.AmountDTO;
import co.yd.dto.OrderDTO;
import co.yd.dto.OrderDetailDTO;
import co.yd.dto.OrderFormDTO;

public class OrderSuccessCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		session.getAttribute("id");
		
		
		OrderDAO dao = new OrderDAO();
		OrderDTO dto = new OrderDTO();
		
		//오더테이블에 주문 추가
		dto.setmId((String)session.getAttribute("id"));
		dto.setOrderName(request.getParameter("orderName"));
		dto.setOrderAddress1(request.getParameter("orderAddress"));
		dto.setOrderPostCode(request.getParameter("orderPostCode"));
		dto.setOrderPhoneNum(request.getParameter("orderPhoneNum"));
		dto.setOrderTotalPrice(Integer.parseInt(request.getParameter("orderTotalPrice")));
		dto.setOrderAddress2(request.getParameter("orderDetailAddress"));
		dao.insertOrders(dto);
		request.setAttribute("orders", dto);
		
		//오더디테일테이블에 주문 추가
		OrderDetailDTO odDto = new OrderDetailDTO();
		odDto.setOrderId(dto.getOrderId());
		odDto.setProductId(Integer.parseInt(request.getParameter("productId")));
		odDto.setAmountId(Integer.parseInt(request.getParameter("amountId")));
		odDto.setOrderProductCount(Integer.parseInt(request.getParameter("orderProductCount")));
		dao.insertOrderDetail(odDto);
		request.setAttribute("orderDetail", odDto);
		
		//재고테이블 물품 산만큼 수량 빼기
		AmountDTO amDto = new AmountDTO();
		amDto.setAmount_id(odDto.getAmountId());
		amDto.setP_id(odDto.getProductId());
		amDto.setOrderProductCount(odDto.getOrderProductCount());
		dao.subAmount(amDto);
		
		//주문한 물품 옵션 뿌려주는용
		OrderFormDTO ofDTO = new OrderFormDTO();
		
		try {
			BeanUtils.copyProperties(ofDTO, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		request.setAttribute("ofDTO", ofDTO);
		
		return "order_jsp/orderSuccess.jsp";		
	}

}
