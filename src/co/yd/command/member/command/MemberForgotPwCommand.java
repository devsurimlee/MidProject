package co.yd.command.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import co.yd.command.Command;
import co.yd.dao.MemberDAO;
import co.yd.dto.MemberDTO;

public class MemberForgotPwCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		
		try {
			BeanUtils.copyProperties(dto, request.getParameterMap()); // 하나씩 안 넣고 전체를 한번에 넣어줌
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int r = dao.forgotPw(dto);
		
		if (r == 0) { // 실패
			request.setAttribute("message", "일치하는 회원정보가 없습니다.");
			return "basic_forgotPwForm.do";
		} else { // 성공
			request.setAttribute("getId", dto.getmId());
			return "login_jsp/resetPw.jsp";
		}
	}

}
