package co.yd.command.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yd.command.Command;
import co.yd.dao.CartDAO;
import co.yd.dto.CartDTO;
import net.sf.json.JSONArray;

public class CartViewCommand implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	CartDTO cdto = new CartDTO();
	CartDAO cdao = new CartDAO();
	
	HttpSession session = request.getSession(false);
	cdto.setmId((String)session.getAttribute("id"));
	
	
	ArrayList<CartDTO> optionList = new ArrayList<CartDTO>();
	optionList = cdao.selectOptionCart(cdto);
	
	
	request.setAttribute("optionList", JSONArray.fromObject(optionList).toString());
	request.setAttribute("OptionList", optionList);
	
		return "order_jsp/cart.jsp";
	}

}
