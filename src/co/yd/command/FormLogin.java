package co.yd.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FormLogin implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "login_jsp/login.jsp";
	}

}
