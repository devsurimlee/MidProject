package co.yd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import co.yd.command.Command;
import co.yd.dao.OrderDAO;
import co.yd.dto.AmountDTO;
import co.yd.dto.OrderDTO;
import co.yd.dto.OrderDetailDTO;

public class OrderSigleSuccessCommand implements Command{

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
		String[] amountId = request.getParameterValues("amountId");
		String[] amountCount = request.getParameterValues("amountCount");
		String[] productId = request.getParameterValues("productId");
		String[] key = request.getParameterValues("productId");
		String[] productName = request.getParameterValues("productName");
		String[] amountColor = request.getParameterValues("amountColor");
		String[] amountSize = request.getParameterValues("amountSize");
		String[] productPrice = request.getParameterValues("price");

		request.setAttribute("amountId", amountId);
		request.setAttribute("key", key);
		request.setAttribute("productName", productName);
		request.setAttribute("productId", productId);
		request.setAttribute("amountColor", amountColor);
		request.setAttribute("amountSize", amountSize);
		request.setAttribute("amountCount", amountCount);
		request.setAttribute("productPrice", productPrice);
		
		
		
		ArrayList<OrderDetailDTO> list = new ArrayList<>();
		
		for(int i = 0; i < amountId.length; i++) {
			OrderDetailDTO odDto = new OrderDetailDTO();
			odDto.setOrderId(dto.getOrderId());
			odDto.setProductId(Integer.parseInt(productId[i]));
			odDto.setAmountId(Integer.parseInt(amountId[i]));
			odDto.setOrderProductCount(Integer.parseInt(amountCount[i]));
			list.add(odDto);
		}
		dao.insertAllOrderDetail(list);
		
		
		/// 재고테이블 주문한 물품 재고 업데이트
		ArrayList<AmountDTO> amountList = new ArrayList<>();
		
		for(int i = 0; i < amountId.length; i++) {
			AmountDTO aDto = new AmountDTO();
			aDto.setP_id(Integer.parseInt(productId[i]));
			aDto.setAmount_id(Integer.parseInt(amountId[i]));
			aDto.setOrderProductCount(Integer.parseInt(amountCount[i]));
			amountList.add(aDto);
		}
		
		dao.subAllAmount(amountList);
		
		//주문한 물품 옵션 뿌려주는용

		
		return "order_jsp/orderAllSuccess.jsp";		
	}

}
