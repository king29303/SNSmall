package web.client.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.client.db.ClientDAO;

public class dupIdCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("userid");
		ClientDAO cldao = new ClientDAO();
		boolean check = cldao.idDupCheck(id);
		request.setAttribute("check", check);
		request.setAttribute("id", id);
		ActionForward forward = new ActionForward();
		forward.setPath("./member/client/dupIdCheck.jsp");
		forward.setRedirect(false);			
		return forward;
	}
	

}