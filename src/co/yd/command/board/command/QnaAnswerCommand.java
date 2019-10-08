package co.yd.command.board.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import co.yd.command.Command;
import co.yd.dao.QnaBoardDAO;
import co.yd.dto.QnaBoardDTO;

public class QnaAnswerCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnaBoardDAO dao = new QnaBoardDAO();
		QnaBoardDTO dto = new QnaBoardDTO();
		
		try {
			BeanUtils.copyProperties(dto, request.getParameterMap()); // 하나씩 안 넣고 전체를 한번에 넣어줌
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int r = dao.qnaWriteAnswer(dto);
		
		if (r != 0) { // 성공
			request.setAttribute("answerMessage", "답글이 성공적으로 등록되었습니다.");
			return "basic_qnaReadForm.do?qbId="+dto.getQbOrigin();
		} else { // 실패
			request.setAttribute("answerMessage", "답글이 등록되지 않았습니다. 다시 시도해 주세요.");
			return "basic_qnaReadForm.do?id="+dto.getQbOrigin();
		}
	}

}
