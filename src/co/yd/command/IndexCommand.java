package co.yd.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.ProductExhabitDAO;
import co.yd.dto.ProductDTO;

public class IndexCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ProductDTO pDto = new ProductDTO();
		ProductExhabitDAO mDao = new ProductExhabitDAO();
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = mDao.selectDisplayAll(pDto);
		request.setAttribute("list", list); //db에서 넘어온 값을  request객체 속성으로 삽입
		
		return "jsp/main.jsp";
	}

}
