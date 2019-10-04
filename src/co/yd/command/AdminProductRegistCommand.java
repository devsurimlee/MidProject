package co.yd.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.dao.AddAmountDAO;
import co.yd.dao.AmountDAO;
import co.yd.dao.ProductDAO;
import co.yd.dto.AddAmountDTO;
import co.yd.dto.AmountDTO;
import co.yd.dto.ProductDTO;

public class AdminProductRegistCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDTO productDto = dto(request, response);
		ArrayList<AmountDTO> amountList = new ArrayList<AmountDTO>();
		ArrayList<AddAmountDTO> addAmountDtoList = new ArrayList<AddAmountDTO>();
		String path = "";

		boolean productResult = productProcess(productDto); //상품등록
		boolean amountResult = false;
		boolean addAmountResult = false;
		if (productResult) {
			int amountCount = Integer.parseInt(request.getParameter("amount_count")); //사용안할경우 예외처리 필요
					
			amountList = buildAmountDtoList(productDto,amountCount);

			amountResult = amountProcess(amountList);
			if (amountResult) {
				addAmountDtoList = bulidaddAmountList(amountList);
				addAmountResult = addAmountProcess(addAmountDtoList);
				if (addAmountResult) {
					path = "admin_Index.do";
				}
			}

		} else {
			path = "";
		}

		return path;
	}

	private ProductDTO dto(HttpServletRequest request, HttpServletResponse response) {
		ProductDTO productDto = new ProductDTO();
		productDto.setP_name(request.getParameter("p_name"));
		productDto.setP_price(Integer.parseInt(request.getParameter("p_price")));
		productDto.setP_size(request.getParameter("p_size")); // amount column
		productDto.setP_color(request.getParameter("p_color")); // amount column
		productDto.setP_detail(request.getParameter("p_detail"));
		productDto.setP_category(request.getParameter("p_category"));
		productDto.setP_show_state(request.getParameter("p_show_state"));
		return productDto;
	}

	private boolean productProcess(ProductDTO productDto) {
		boolean result = false;
		ProductDAO productDao = new ProductDAO();
		 productDao.insert(productDto);
		 int p_id = productDto.getP_id();
		if (p_id > 0) {
			result = true;
		}

		return result;
	}

	private ArrayList<AmountDTO> buildAmountDtoList(ProductDTO productDto, int amountCount) {
		ArrayList<AmountDTO> amountDtoList = new ArrayList<AmountDTO>();
		String[] sizeSplit = productDto.getP_size().split(",");
		String[] colorSplit = productDto.getP_color().split(",");
		for (int sizeCount = 0; sizeCount < sizeSplit.length; sizeCount++) {
			for (int colorCount = 0; colorCount < colorSplit.length; colorCount++) {
				AmountDTO amountDto = new AmountDTO();
				amountDto.setP_id(productDto.getP_id());
				amountDto.setAmount_size(sizeSplit[sizeCount]);
				amountDto.setAmount_color(colorSplit[colorCount]);
				amountDto.setAmount_count(amountCount);// need to update
				amountDtoList.add(amountDto);
			}
		}
		return amountDtoList;
	}

	private boolean amountProcess(ArrayList<AmountDTO> amountDtoList) {
		boolean result = false;
		AmountDAO amountDao = new AmountDAO();
		int check = amountDao.insert(amountDtoList);
		if (check > 1) {
			result = true;

		}
		return result;
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

	private ArrayList<AddAmountDTO> bulidaddAmountList(ArrayList<AmountDTO> amountList) {
		ArrayList<AddAmountDTO> addAmountList = new ArrayList<AddAmountDTO>();
		for (AmountDTO dto : amountList) {
			if (dto.getAmount_count() != 0) {
				AddAmountDTO addAmountDto = new AddAmountDTO();
				addAmountDto.setAa_Count(dto.getAmount_count());
				addAmountDto.setAmount_id(dto.getAmount_id());
				addAmountList.add(addAmountDto);
			}
		}
		return addAmountList;
	}

}
