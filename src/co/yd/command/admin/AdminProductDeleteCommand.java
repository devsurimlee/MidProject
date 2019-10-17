package co.yd.command.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.AddAmountDAO;
import co.yd.dao.AmountDAO;
import co.yd.dao.MemberDAO;
import co.yd.dao.ProductDAO;
import co.yd.dto.AddAmountDTO;
import co.yd.dto.AmountDTO;
import co.yd.dto.MemberDTO;
import co.yd.dto.ProductDTO;

public class AdminProductDeleteCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "";
		AddAmountDAO addAmountDao = new AddAmountDAO();
		ArrayList<AddAmountDTO> addAmountList = new ArrayList<AddAmountDTO>();//재고추가 삭제 목록에 재고id 가 fk 걸려있어서 제거해야함.
		ProductDAO productDao = new ProductDAO();
		ProductDTO productDto = new ProductDTO();
		AmountDAO amountDao = new AmountDAO(); //재고에 fk로 p_id가   걸려있어 재고에 있는 것부터 제거해야함. 
		ArrayList<AmountDTO>amountList = new ArrayList<AmountDTO>();//재고에 fk로 p_id가   걸려있어 재고에 있는 것부터 제거해야함. 
		
		productDto.setP_id(Integer.parseInt(request.getParameter("key")));
		amountList= amountDao.selectAllToProduct(productDto); //재고리스트 가져오기위한 장치
				
		for(AmountDTO amount: amountList) {
			AddAmountDTO add_AmountDto = new AddAmountDTO();
			add_AmountDto.setAmount_id(amount.getAmount_id());
			addAmountList.add(add_AmountDto); //재고 추가증가 테이블 amountid 값 가져오기
		}
		
		//삭제 시작 재고추가감소테이블 -> 재고 테이블 -> 상품테이블순 삭제
		
		for(AddAmountDTO addAmountDto :addAmountList) {
			addAmountDao.Delete(addAmountDto);
		}
		
		for(AmountDTO amountDto : amountList) {
			amountDao.delete(amountDto);
		}
		
		
		int result = productDao.delete(productDto);
		if(result >0) {
			path = "admin_productListForm.do";
		}
		
		return path;
	}
	
}
