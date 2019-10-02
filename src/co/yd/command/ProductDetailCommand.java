package co.yd.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.ProductExhabitDAO;
import co.yd.dto.AmountDTO;
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
		
		
		ArrayList<AmountDTO> list = new ArrayList<AmountDTO>();
		list = pDAO.selectProductStock(key);
		request.setAttribute("amount", list);
		
		return "order_jsp/productDetail.jsp";
	}
}
