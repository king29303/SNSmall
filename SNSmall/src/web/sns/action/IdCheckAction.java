package web.sns.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.sns.db.SnsDAO;

public class IdCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("IdCheck execute()");
		request.setCharacterEncoding("utf-8");
		String sns_id = request.getParameter("sns_id");
		
		SnsDAO  sdao = new SnsDAO();
		
		int check= sdao.joinIdCheck(sns_id);
		
		
		request.setAttribute("check", check);
		request.setAttribute("sns_id", sns_id);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./SNSmall/member/sns/joinIdCheck.jsp");
		forward.setRedirect(false);
		return forward;
	
	}

	
	
}
