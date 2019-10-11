package co.yd.command.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

import co.yd.command.Command;
import co.yd.dao.AdminOrderDAO;
import co.yd.dao.OrderDAO;
import co.yd.dto.OrderDTO;

public class MyOrderViewCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		String id =  (String)session.getAttribute("id");
		
		AdminOrderDAO dao = new AdminOrderDAO();
		OrderDTO dto = new OrderDTO();
		String p = request.getParameter("p"); // 페이지번호
		int pageNo = 1;
		if (p != null && !p.isEmpty()) {
			pageNo = Integer.parseInt(p);
		}
		int first, last; 		// 조회할 시작과 끝 레코드 번호
		int recordTotal; 		// 총레코드 갯수(DB조회)
		int pagePerRecord = 5;  // 한페이지에 출력할 레코드 건수
		int pageCnt; 			// 페이지수
		first = (pageNo - 1) * pagePerRecord + 1; // 해당페이지의 시작레코드
		last = first + pagePerRecord - 1; // 해당페이지의 마지막레코드
		String status = null;
		recordTotal = dao.countOrders(status); // 전체레코드 수
		pageCnt = recordTotal / pagePerRecord + (recordTotal % pagePerRecord > 0 ? 1 : 0);// 마지막페이지번호

		try {
			request.setAttribute("orderList", dao.selectAll(dto, first, last));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("pageCnt", pageCnt);
		// 뷰페이지로 포워드
		return "order_jsp/myOrderView.jsp";
		
	}

}
