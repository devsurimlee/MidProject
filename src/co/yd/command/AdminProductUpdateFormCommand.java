package co.yd.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.AmountDAO;
import co.yd.dao.ProductDAO;
import co.yd.dto.AmountDTO;
import co.yd.dto.ProductDTO;

public class AdminProductUpdateFormCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		ProductDTO productDto = new ProductDTO();
//		productDto.setP_id(Integer.parseInt(request.getParameter("p_id")));
//		
//		ProductDAO productDao = new ProductDAO();
//		ArrayList<AmountDTO> amountList = new ArrayList<AmountDTO>();
//		AmountDAO amountDao = new AmountDAO();
//		amountList = amountDao.selectAllToProduct(productDto);
//		
//		request.setAttribute("amountList", amountList);
//		
//		int key = Integer.parseInt(request.getParameter("key"));
//		productDto = productDao.select(key);
//		request.setAttribute("product", productDto);
		return "admin/adminProductUpdateForm.jsp";
	}

}
