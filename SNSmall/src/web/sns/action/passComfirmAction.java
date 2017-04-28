package web.sns.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;


public class passComfirmAction implements Action{

	//비밀번호확인하고 업데이트창으로 가는 page
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("sns_pass_confirmaction execute()");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sns_id");
		
		ActionForward forward = new ActionForward();
		if(id==null){
			forward.setPath("./MemberLoginForm.me");
			forward.setRedirect(true); 
			return forward;
		}
		
		String pass = request.getParameter("pass");
		
		SnsDAO sdao = new SnsDAO();
		int check= sdao.passCheck(id, pass);
		
		if(check==0){
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호틀림');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		
		SnsBean sb= sdao.getSnsDetail(id);
		request.setAttribute("sb", sb);
		
		forward.setPath("./SNSmall/member/sns/snsUpdate.jsp");
		forward.setRedirect(false);  
		return forward;
		
	}

}
