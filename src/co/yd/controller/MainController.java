package co.yd.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.command.IdCheckCommand;
import co.yd.command.IndexCommand;
import co.yd.command.InsertMemberCommand;
import co.yd.command.InsertMemberFormCommand;
import co.yd.command.LoginCheckCommand;
import co.yd.command.LoginFormCommand;
import co.yd.command.LogoutCommand;
import co.yd.command.OrderFormCommand;
import co.yd.command.OrderSuccessCommand;

@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = null;

	public MainController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		map = new HashMap<String, Command>();
		map.put("/basic_index.do", new IndexCommand());
		
		
		// 수림 추가
		map.put("/basic_orderForm.do", new OrderFormCommand());
		map.put("/basic_orderSuccess.do", new OrderSuccessCommand());
		
		
		
		
		// 연우 추가
		
		
		
		
		
		// 지원 추가
		map.put("/basic_login.do", new LoginFormCommand());
		map.put("/basic_loginCheck.do", new LoginCheckCommand());
		map.put("/basic_insertMember.do", new InsertMemberFormCommand());
		map.put("/basic_join.do", new InsertMemberCommand());
		map.put("/idCheck.do", new IdCheckCommand());
		map.put("/basic_logout.do", new LogoutCommand());
		
		
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 들어온 요청을 확인 후 실행시켜 주는 부분
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());

		Command comm = map.get(path);
		String page = comm.execute(request, response);
		
		if(page!=null) {
			if(page.startsWith("redirect:")) {
				response.sendRedirect(page.substring(9));
			} else if(page.startsWith("ajax:")) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(page.substring(5));
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(page);
				dispatcher.forward(request, response);
			}
		}
	}

}
