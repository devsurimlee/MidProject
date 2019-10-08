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

import co.yd.command.AdminIndexCommand;
import co.yd.command.AdminMemberDeleteCommand;
import co.yd.command.AdminMemberListFormCommand;
import co.yd.command.AdminMemberUpdateCommand;
import co.yd.command.AdminMemberUpdateFormCommand;
import co.yd.command.AdminProductDeleteCommand;
import co.yd.command.AdminProductListFormCommand;
import co.yd.command.AdminProductRegistCommand;
import co.yd.command.AdminProductRegistFormCommand;
import co.yd.command.AdminProductUpdateCommand;
import co.yd.command.AdminProductUpdateFormCommand;
import co.yd.command.Command;
import co.yd.command.board.command.NoticeDeleteCommand;
import co.yd.command.board.command.NoticeUpdateCommand;
import co.yd.command.board.command.NoticeWriteCommand;
import co.yd.command.board.form.FormNoticeList;
import co.yd.command.board.form.FormNoticeRead;
import co.yd.command.board.form.FormNoticeUpdate;
import co.yd.command.board.form.FormNoticeWrite;
import co.yd.command.member.command.MemberCheckIdCommand;
import co.yd.command.member.command.MemberDeleteCommand;
import co.yd.command.member.command.MemberForgotIdCommand;
import co.yd.command.member.command.MemberForgotPwCommand;
import co.yd.command.member.command.MemberJoinCommand;
import co.yd.command.member.command.MemberLoginCommand;
import co.yd.command.member.command.MemberLogoutCommand;
import co.yd.command.member.command.MemberResetPwCommand;
import co.yd.command.member.command.MemberUpdateCommand;
import co.yd.command.member.command.MemberUpdatePwCommand;
import co.yd.command.member.form.FormDeleteMember;
import co.yd.command.member.form.FormForgotId;
import co.yd.command.member.form.FormForgotPw;
import co.yd.command.member.form.FormJoin;
import co.yd.command.member.form.FormLogin;
import co.yd.command.member.form.FormLogout;
import co.yd.command.member.form.FormMypage;
import co.yd.command.member.form.FormUpdateMember;
import co.yd.command.member.form.FormUpdatePw;
import co.yd.command.order.BestItemListCommand;
import co.yd.command.order.CartInsertCommand;
import co.yd.command.order.CartViewCommand;
import co.yd.command.order.IndexCommand;
import co.yd.command.order.OrderFormCommand;
import co.yd.command.order.OrderSuccessCommand;
import co.yd.command.order.ProductBottomListCommand;
import co.yd.command.order.ProductDetailCommand;
import co.yd.command.order.ProductDressListCommand;
import co.yd.command.order.ProductOuterListCommand;
import co.yd.command.order.ProductTopListCommand;
import co.yd.command.order.WishListCommand;

@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = null;

	public MainController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		map = new HashMap<String, Command>();
		// 수림 추가
		map.put("/basic_index.do", new IndexCommand());
		map.put("/basic_orderForm.do", new OrderFormCommand());
		map.put("/basic_orderSuccess.do", new OrderSuccessCommand());
		map.put("/basic_productDetail.do", new ProductDetailCommand());
		map.put("/basic_wishList.do", new WishListCommand());
		map.put("/basic_cartInsert.do", new CartInsertCommand());
		map.put("/basic_cartView.do", new CartViewCommand());
		
		map.put("/basic_bestItemList.do", new BestItemListCommand());
		map.put("/basic_topList.do", new ProductTopListCommand());
		map.put("/basic_bottomList.do", new ProductBottomListCommand());
		map.put("/basic_dressList.do", new ProductDressListCommand());
		map.put("/basic_outerList.do", new ProductOuterListCommand());
		 

		// 연우 추가
		map.put("/admin_Index.do", new AdminIndexCommand());
		map.put("/admin_productListForm.do", new AdminProductListFormCommand());
		map.put("/admin_productUpdateForm.do", new AdminProductUpdateFormCommand());
		map.put("/admin_productUpdate.do", new AdminProductUpdateCommand());
		map.put("/admin_productDelete.do", new AdminProductDeleteCommand());
		map.put("/admin_productRegistForm.do", new AdminProductRegistFormCommand());
		map.put("/admin_productRegist.do", new AdminProductRegistCommand());
		map.put("/adminMemberListFormCommand.do",new AdminMemberListFormCommand());
		map.put("/adminMemberUpdateFormCommand.do", new AdminMemberUpdateFormCommand());
		map.put("/adminMemberUpdateCommand.do",new AdminMemberUpdateCommand());
		map.put("/adminMemberDeleteCommand.do",new AdminMemberDeleteCommand());
		
		// 지원 추가
		// 멤버 관련
		map.put("/basic_loginForm.do", new FormLogin());
		map.put("/basic_joinForm.do", new FormJoin());
		map.put("/basic_logoutForm.do", new FormLogout());
		map.put("/basic_forgotIdForm.do", new FormForgotId());
		map.put("/basic_forgotPwForm.do", new FormForgotPw());
		map.put("/basic_mypageForm.do", new FormMypage());
		map.put("/basic_updateMemberForm.do", new FormUpdateMember());
		map.put("/basic_updatePwForm.do", new FormUpdatePw());
		map.put("/basic_deleteMemberForm.do", new FormDeleteMember());

		map.put("/basic_login.do", new MemberLoginCommand());
		map.put("/basic_join.do", new MemberJoinCommand());
		map.put("/checkId.do", new MemberCheckIdCommand());
		map.put("/basic_logout.do", new MemberLogoutCommand());
		map.put("/basic_forgotId.do", new MemberForgotIdCommand());
		map.put("/basic_forgotPw.do", new MemberForgotPwCommand());
		map.put("/basic_resetPw.do", new MemberResetPwCommand());
		map.put("/basic_updateMember.do", new MemberUpdateCommand());
		map.put("/basic_updatePw.do", new MemberUpdatePwCommand());
		map.put("/basic_deleteMember.do", new MemberDeleteCommand());
		
		// 공지게시판
		map.put("/basic_noticeListForm.do", new FormNoticeList());
		map.put("/basic_noticeReadForm.do", new FormNoticeRead());
		map.put("/basic_noticeUpdateForm.do", new FormNoticeUpdate());
		map.put("/basic_noticeWriteForm.do", new FormNoticeWrite());
		
		map.put("/basic_noticeDelete.do", new NoticeDeleteCommand());
		map.put("/basic_noticeUpdate.do", new NoticeUpdateCommand());
		map.put("/basic_noticeWrite.do", new NoticeWriteCommand());

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

		if (page != null) {
			if (page.startsWith("redirect:")) {
				response.sendRedirect(page.substring(9));
			} else if (page.startsWith("ajax:")) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(page.substring(5));
			} else if (page.startsWith("script:")) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().append(page.substring(7));
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(page);
				dispatcher.forward(request, response);
			}
		}
	}

}
