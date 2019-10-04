package co.yd.command.member.form;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;

public class FormUpdateMember implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		return "login_jsp/updateMember.jsp";
	}

}
