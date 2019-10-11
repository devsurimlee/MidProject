package co.yd.command.admin_orders;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

public class AdminChangeDeliverStatus implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		String json = request.getParameter("list");
		JSONArray array = JSONArray.fromObject(json);
		JsonConfig jc = null;
		List<Map> list = JSONArray.toList(array, Map.class, jc);
		
		System.out.println(list);
		return null;
	}

}
