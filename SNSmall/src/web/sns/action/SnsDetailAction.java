package web.sns.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class SnsDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sns_id = request.getParameter("sns_id");
		
		SnsDAO sdao = new SnsDAO();
		SnsBean sb = sdao.getSnsDetail(sns_id);
		request.setAttribute("sb", sb);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./sns_star/detail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
