package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import co.yd.dao.MemberDAO;
import co.yd.dto.MemberDTO;

public class MemberUpdateCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();

		try {
			BeanUtils.copyProperties(dto, request.getParameterMap()); // 하나씩 안 넣고 전체를 한번에 넣어줌
		} catch (Exception e) {
			e.printStackTrace();
		}

		int r = dao.updateMember(dto);
		HttpSession session = request.getSession(false);
		session.setAttribute("list", dto);

		if (r != 0) { // 성공
			request.setAttribute("updateMessage", "회원 정보 수정이 완료되었습니다.");
			return "basic_mypageForm.do";
		} else { // 실패
			request.setAttribute("updateMessage", "회원 정보 수정이 완료되지 않았습니다. 다시 확인해 주세요.");
			return "login_jsp/updateMember.jsp";
		}
	}

}
