package co.yd.command.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import co.yd.command.Command;
import co.yd.dao.OrderDAO;
import co.yd.dto.MemberDTO;
import co.yd.dto.OrderFormDTO;

public class OrderSingleFormCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO odao = new OrderDAO();
		MemberDTO mdto = new MemberDTO();
		
		HttpSession session = request.getSession(false);
		
		//product테이블의 p_id = key
		int key = Integer.parseInt(request.getParameter("key"));
		request.setAttribute("key", key);
		
		mdto.setmId((String)session.getAttribute("id"));
		mdto = odao.selectUserInfo(mdto);
		//회원정보 조회하여 넘김
		request.setAttribute("mdto", mdto); //db에서 넘어온 값을  request객체 속성으로 삽입
		//상품상세페이지에서 넘어온값
		OrderFormDTO ofDTO = new OrderFormDTO();
		
		try {
			BeanUtils.copyProperties(ofDTO, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		request.setAttribute("ofDTO", ofDTO);
		
		
		////합치면서 늘어난코드
		
		//상품옵션 넘기는 파라미터들 배열로 담아야됨
		String[] amountId = request.getParameterValues("amountId");
		String[] productName = request.getParameterValues("productName");
		String[] productId = request.getParameterValues("productId");
		String[] amountColor = request.getParameterValues("amountColor");
		String[] amountSize = request.getParameterValues("amountSize");
		String[] amountCount = request.getParameterValues("amountCount");
		String[] productPrice = request.getParameterValues("price");

		request.setAttribute("amountId", amountId);
		request.setAttribute("key", key);
		request.setAttribute("productName", productName);
		request.setAttribute("productId", productId);
		request.setAttribute("amountColor", amountColor);
		request.setAttribute("amountSize", amountSize);
		request.setAttribute("amountCount", amountCount);
		request.setAttribute("productPrice", productPrice);
		
		
		return "order_jsp/orderSingleForm.jsp";
		
	}


}
