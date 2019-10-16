package co.yd.command.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.AddAmountDAO;
import co.yd.dao.AmountDAO;
import co.yd.dto.AddAmountDTO;

public class AdminAddAmountCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String path = "";
		AmountDAO amountDao = new AmountDAO();
		String[] amount_idString= request.getParameterValues("amount_id");
		String[] amount_countString = request.getParameterValues("amount_count");
		String[] changeIndex = request.getParameterValues("changeIndex");
		int[] amount_id = new int[changeIndex.length];
		int[] amount_count = new int[changeIndex.length];
		int count = 0;
		int[] result = new int[changeIndex.length];
		for(String index : changeIndex) {
			for(int i=0; i<amount_idString.length;i++) {
				if(index.equals(amount_idString[i])) {
					amount_id[count] =Integer.parseInt(index);
					amount_count[count] = Integer.parseInt(amount_countString[i]);
					
					result[count]=amountDao.update(amount_id[count],amount_count[count]);
				}
			}
			count++;
		}
		
		AddAmountDAO addAmountDao = new AddAmountDAO();
		int[] addResult = new int[amount_id.length ];
		count = 0;
		for(int j=0; j<result.length;  j++) {
			AddAmountDTO dto = new AddAmountDTO();
			dto.setAmount_id(amount_id[j]);
			dto.setAa_Count(result[j]);
			addResult[count] = addAmountDao.countIncrease(dto);
		}
		
		for(int result1  :addResult) {
			if(result1 >0) {
				path = "admin/adminAmountListForm.do";
			}
			else {
				path = "";
			}
		}
		
		return path;
	}

}
