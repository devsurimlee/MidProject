package co.yd.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.ProductDAO;
import co.yd.dto.ProductDTO;

public class AdminProductPnameCheckCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String result;
		ProductDAO dao = new ProductDAO();
		ProductDTO dto = new ProductDTO();
		String p_name = request.getParameter("key");
		dto = dao.select(p_name);
		
		if(dto.getP_name().equals("")) {
			result = "사용가능";
		}
		else result = "사용불가";
		return result;
	}

}
