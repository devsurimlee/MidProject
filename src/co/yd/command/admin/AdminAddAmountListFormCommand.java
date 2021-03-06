package co.yd.command.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.dao.AmountDAO;
import co.yd.dto.AmountDTO;

public class AdminAddAmountListFormCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				
		AmountDAO amountDao = new AmountDAO();
		ArrayList<AmountDTO>amountList = new ArrayList<AmountDTO>();
		amountList = amountDao.selectAll();
		request.setAttribute("amountList", amountList);
		
		return "admin/adminAmountListForm.jsp";
	}

}
