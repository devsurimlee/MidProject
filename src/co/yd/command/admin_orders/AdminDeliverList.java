package co.yd.command.admin_orders;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.AdminOrderDAO;
import co.yd.dto.OrderDTO;

public class AdminDeliverList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		// 페이징 처리
		String status = request.getParameter("status");
		String selectKey = request.getParameter("selectKey");
		String keyword = request.getParameter("keyword");
		System.out.println("selectKey: " + selectKey + " keyword: " + keyword);
		AdminOrderDAO dao = new AdminOrderDAO();
		OrderDTO dto = new OrderDTO();
		dto.setOrderDeliverState(status);
		String p = request.getParameter("p"); // 페이지번호
		int pageNo = 1;
		if (p != null && !p.isEmpty()) {
			pageNo = Integer.parseInt(p);
		}
		int first, last; 		// 조회할 시작과 끝 레코드 번호
		int recordTotal; 		// 총레코드 갯수(DB조회)
		int pagePerRecord = 0;  // 한페이지에 출력할 레코드 건수
		if(status.equals("배송준비중") || status.equals("입금완료"))
			pagePerRecord = 8;	// 배송준비중랑 입금완료일 때는 한 페이지에 게시글 8개씩
		else
			pagePerRecord = 5;	// 전체나 배송완료일 때는 한 페이지에 게시글 5개씩
		int pageCnt; 			// 페이지수
		first = (pageNo - 1) * pagePerRecord + 1; // 해당페이지의 시작레코드
		last = first + pagePerRecord - 1; // 해당페이지의 마지막레코드
		recordTotal = dao.countOrders(status, selectKey, keyword); // 전체레코드 수
		pageCnt = recordTotal / pagePerRecord + (recordTotal % pagePerRecord > 0 ? 1 : 0);// 마지막페이지번호

		try {
			request.setAttribute("orderList", dao.orderList(dto, first, last, selectKey, keyword));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("pageCnt", pageCnt);
		// 뷰페이지로 포워드
		return "admin_orders/deliverList.jsp";
	}

}
