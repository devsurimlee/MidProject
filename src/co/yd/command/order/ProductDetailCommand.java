package co.yd.command.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.ProductExhabitDAO;
import co.yd.dto.AmountDTO;
import co.yd.dto.ProductDTO;
import net.sf.json.JSONArray;

public class ProductDetailCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int key = Integer.parseInt(request.getParameter("key"));
		request.setAttribute("key", key);
		
		//상품 테이블
		ProductExhabitDAO pDAO = new ProductExhabitDAO();
		ProductDTO dto = new ProductDTO();
		dto = pDAO.selectProduct(key);
		request.setAttribute("dtoList", JSONArray.fromObject(dto).toString());
		request.setAttribute("dto", dto);
		
		//재고 테이블
		ArrayList<AmountDTO> list = new ArrayList<AmountDTO>();
		list = pDAO.selectProductStock(key);
		request.setAttribute("amountList", JSONArray.fromObject(list).toString());
		request.setAttribute("amount", list);

		
		return "order_jsp/productDetail.jsp";
	}
}
