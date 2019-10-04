package co.yd.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.ProductDAO;
import co.yd.dto.ProductDTO;

public class AdminProductListFormCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		ProductDAO dao = new ProductDAO();
		list = dao.selectAll();
		request.setAttribute("list", list);
		return "admin/adminProductListForm.jsp";
	}

}
