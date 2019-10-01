package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.ProductDAO;
import co.yd.dto.ProductDTO;

public class AdminProductRegistCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDTO dto = new ProductDTO();
		ProductDAO dao = new ProductDAO();
		String path;
	

		dto.setP_id(Integer.parseInt(request.getParameter("p_id")));
		dto.setP_name(request.getParameter("p_name"));
		dto.setP_price(Integer.parseInt(request.getParameter("p_price")));
		dto.setP_size(request.getParameter("p_size"));
		dto.setP_color(request.getParameter("p_color"));
		dto.setP_detail(request.getParameter("p_detail"));
		dto.setP_category(request.getParameter("p_category"));
		dto.setP_show_state(request.getParameter("p_show_state"));
		
		int n = dao.insert(dto);
		
		if (n > 0) {
			path = "";
		} else {
			path = "";
		}

		return path;
	}

}
