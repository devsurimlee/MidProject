package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.ProductExhabitDAO;
import co.yd.dto.ProductDTO;

public class ProductDetailCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int key = Integer.parseInt(request.getParameter("key"));
		
		ProductExhabitDAO pDAO = new ProductExhabitDAO();
		ProductDTO dto = new ProductDTO();
		dto = pDAO.selectProduct(key);
		request.setAttribute("dto", dto);
		
		return "order_jsp/productDetail.jsp";
	}
}
