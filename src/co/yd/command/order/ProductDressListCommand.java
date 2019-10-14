package co.yd.command.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.ProductExhabitDAO;
import co.yd.dto.ProductDTO;

public class ProductDressListCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDTO pDto = new ProductDTO();
		ProductExhabitDAO mDao = new ProductExhabitDAO();
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = mDao.selectDressDisplay(pDto);
		request.setAttribute("list", list);
		
		
		return "order_jsp/ProductDressList.jsp";
	}

}
