package co.yd.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yd.command.Command;
import co.yd.command.IndexCommand;
import co.yd.command.LoginCheckCommand;
import co.yd.command.LoginFormCommand;

@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = null;

	public MainController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		map = new HashMap<String, Command>();
		map.put("/index.do", new IndexCommand());
		// 수림 추가
		
		
		
		
		
		// 연우 추가
		
		
		
		
		
		// 지원 추가
		map.put("/login.do", new LoginFormCommand());
		map.put("/loginCheck.do", new LoginCheckCommand());
		
		
		
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 들어온 요청을 확인 후 실행시켜 주는 부분
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());

		Command comm = map.get(path);
		comm.execute(request, response);
	}

}
