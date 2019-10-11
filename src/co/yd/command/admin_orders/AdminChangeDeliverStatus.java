package co.yd.command.admin_orders;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.AdminOrderDAO;
import co.yd.dto.OrderDTO;
import net.sf.json.JSONArray;

public class AdminChangeDeliverStatus implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		String json = request.getParameter("list");
		JSONArray array = JSONArray.fromObject(json);
		List<Map> list = JSONArray.toList(array, Map.class);
		System.out.println(array);
//		System.out.println(list.get(0).get("orderId"));
//		System.out.println(list.size());
		
		AdminOrderDAO dao = new AdminOrderDAO();
		OrderDTO dto = new OrderDTO();
//		for(int i=0; i<list.size(); i++) {
//			dto = new OrderDTO();
//			dto.setOrderId(Integer.parseInt((String) list.get(i).get("orderId")));
//			dto.setOrderDeliverState((String)list.get(i).get("orderDeliverState"));
//			int r = dao.changeDeliverStatus(dto);
//			System.out.println("성공 실패: " + r);
//		}
		return "ajax:" + 1;
	}

}
