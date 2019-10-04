package co.yd.command.member.form;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;

public class FormForgotPw implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "login_jsp/forgotPw.jsp";
	}

}
