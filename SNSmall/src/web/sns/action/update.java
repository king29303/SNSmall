package web.sns.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class update implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("Snsupdate execute()");
		
		//세션제어
				HttpSession session = request.getSession();
				String id= (String)session.getAttribute("id");
				String type= (String)session.getAttribute("type");
				
				ActionForward forward = new ActionForward();
				if(id==null){
					forward.setPath("./login.ve");
					forward.setRedirect(true);
					return forward;
				}
					SnsDAO sdao = new SnsDAO();
					SnsBean sb = sdao.getSnsDetail(id);
					
					request.setAttribute("sb", sb);
					request.setAttribute("type", type);
					request.setAttribute("id", id);
					
					forward.setPath("./SNSmall/member/sns/snsUpdate.jsp");
					forward.setRedirect(false);
					return forward;
	}

}
