package co.yd.command.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.AddAmountDAO;
import co.yd.dao.AmountDAO;
import co.yd.dao.ProductDAO;
import co.yd.dto.AddAmountDTO;
import co.yd.dto.AmountDTO;
import co.yd.dto.ProductDTO;

public class AdminProductUpdateCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductDTO productDto = dto(request, response);
		ArrayList<AmountDTO> amountList = new ArrayList<AmountDTO>();
		ArrayList<AddAmountDTO> addAmountDtoList = new ArrayList<AddAmountDTO>();
		String path = "";

		boolean productResult = productProcess(productDto); // 상품등록
		boolean addAmountResult = false;
		if (productResult) {
			amountList = buildAmountDtoList(request, response);
			addAmountDtoList = amountProcess(amountList);
			if (addAmountDtoList.equals(null)) {
				System.out.println("재고 변경사항 없음");
				path = "admin_productListForm.do";
			} else {
				addAmountResult = addAmountProcess(addAmountDtoList);
				if (addAmountResult) {
					path = "admin_productListForm.do";
				}
			}

		} else {
			path = "";
		}

		return path;
	}

	private ProductDTO dto(HttpServletRequest request, HttpServletResponse response) {
		ProductDTO productDto = new ProductDTO();
		productDto.setP_id(Integer.parseInt(request.getParameter("product_id")));
		productDto.setP_name(request.getParameter("product_name"));
		productDto.setP_price(Integer.parseInt(request.getParameter("product_price")));
		productDto.setP_detail(request.getParameter("product_detail"));
		productDto.setP_category(request.getParameter("product_category"));
		productDto.setP_show_state(request.getParameter("product_show_state"));
		return productDto;
	}

	private boolean productProcess(ProductDTO productDto) {
		boolean result = false;
		ProductDAO productDao = new ProductDAO();
		productDao.update(productDto);
		

		return result;
	}

	private ArrayList<AmountDTO> buildAmountDtoList(HttpServletRequest request, HttpServletResponse response) {
		// amount 셋팅
		String[] amountIdStringArr = request.getParameterValues("amountId");
		String[] amountColor = request.getParameterValues("amountColor");

		String[] amountSize = request.getParameterValues("amountSize");
		String[] amountCountStringArr = request.getParameterValues("amountCount");

		int[] amountIdArr = new int[amountIdStringArr.length];
		int[] amountCountArr = new int[amountCountStringArr.length];
		for (int i = 0; i < amountIdStringArr.length; i++) {
			amountIdArr[i] = Integer.parseInt(amountIdStringArr[i]);
		}
		for (int i = 0; i < amountCountStringArr.length; i++) {
			amountCountArr[i] = Integer.parseInt(amountCountStringArr[i]);
		}

		int length = amountIdArr.length;
		ArrayList<AmountDTO> amountDtoList = new ArrayList<AmountDTO>();
		for (int i = 0; i < length; i++) {
			AmountDTO dto = new AmountDTO();
			dto.setAmount_id(amountIdArr[i]);
			dto.setAmount_color(amountColor[i]);
			dto.setAmount_size(amountSize[i]);
			dto.setAmount_count(amountCountArr[i]);
			// not pid;
			amountDtoList.add(dto);
		}
		return amountDtoList;
	}

	private ArrayList<AddAmountDTO> amountProcess(ArrayList<AmountDTO> amountDtoList) {
		ArrayList<AddAmountDTO> list = new ArrayList<AddAmountDTO>();
		AmountDAO amountDao = new AmountDAO();
		int returnValue = 0;
		for (AmountDTO amountDto : amountDtoList) {
			returnValue = amountDao.update(amountDto);
			if (returnValue == 2147438647) {
				System.out.println("Error");
			} else if (returnValue == 0) {
				System.out.println("추가값없음");
			} else {
				list.add(bulidAddAmount(amountDto, returnValue));
			}
		}
		return list;
	}

	private boolean addAmountProcess(ArrayList<AddAmountDTO> addAmountList) {
		boolean result = false;
		int check = 0;
		AddAmountDAO addAmountDao = new AddAmountDAO();
		for (AddAmountDTO dto : addAmountList) {
			if (addAmountList.size() != 0) {
				check += addAmountDao.countIncrease(dto);
			} else
				result = true;
		}
		return result;
	}

	private AddAmountDTO bulidAddAmount(AmountDTO amountDto, int addInt) {
		AddAmountDTO dto = new AddAmountDTO();
		dto.setAmount_id(amountDto.getAmount_id());
		dto.setAa_Count(addInt);
		return dto;
	}

}
