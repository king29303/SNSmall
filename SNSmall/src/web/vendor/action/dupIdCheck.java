package web.vendor.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.vendor.db.VendorDAO;

public class dupIdCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 중복아이디체크
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("userid");
		VendorDAO vdao = new VendorDAO();
		boolean check = vdao.idDupCheck(id);
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		ActionForward forward = new ActionForward();
		forward.setPath("./member/vendor/dupIdCheck.jsp");
		forward.setRedirect(false);			
		return forward;
	}
	

}