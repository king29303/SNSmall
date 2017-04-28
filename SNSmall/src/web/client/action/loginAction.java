package web.client.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.client.db.ClientDAO;
import web.client.db.MemberTypeBean;

public class loginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		ClientDAO cldao = new ClientDAO();
		MemberTypeBean mtb = (MemberTypeBean)cldao.idCheck(id,pass);
		if (mtb.getCheck()==0){
			response.setContentType("text/html; charset=UTF-8"); // 서버에서 클라이언트로 보내는 내용 타입 설정
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호틀림');"); // ; 이 엔터키 역할
			out.println("history.back();"); // ; 이 엔터키 역할
			out.println("</script>");
			out.close();
			return null;
		}else if(mtb.getCheck()==-1){
			response.setContentType("text/html; charset=UTF-8"); // 서버에서 클라이언트로 보내는 내용 타입 설정
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 없음');"); // ; 이 엔터키 역할
			out.println("history.back();"); // ; 이 엔터키 역할
			out.println("</script>");
			out.close();
			return null;
		}
		
		// 로그인 성공시 세션생성
		String type = mtb.getType();
		HttpSession session = request.getSession();		
		session.setAttribute("type", type);
		session.setAttribute("id", id);
		session.setAttribute("pass", pass);
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.cl");
		forward.setRedirect(true);			
		return forward;
	}
}