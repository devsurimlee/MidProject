package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import co.yd.dao.MemberDAO;
import co.yd.dto.MemberDTO;

public class InsertMemberCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		
		try {
			BeanUtils.copyProperties(dto, request.getParameterMap()); // 하나씩 안 넣고 전체를 한번에 넣어줌
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/*
		 * dto.setmId(request.getParameter("id"));
		 * dto.setmPw(request.getParameter("password"));
		 * dto.setmName(request.getParameter("name"));
		 * dto.setmEmail(request.getParameter("email"));
		 * dto.setmPostcode(request.getParameter("postcode"));
		 * dto.setmAddress1(request.getParameter("address1"));
		 * dto.setmAddress2(request.getParameter("address2"));
		 * dto.setmPhone(request.getParameter("phone"));
		 */

		int r = dao.insertMember(dto);
		
		if (r != 0) { // 성공
			request.setAttribute("message", "회원이 되신 것을 축하드립니다!");
			return "basic_login.do";
		} else { // 실패
			request.setAttribute("message", "회원가입에 실패하셨습니다. 다시 시도해 주세요.");
			return "login_jsp/insertMember.jsp";
		}


	}

}
