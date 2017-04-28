package web.client.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class logOutAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		session.invalidate();
		
		response.setContentType("text/html; charset=UTF-8"); // 서버에서 클라이언트로 보내는 내용 타입 설정
		PrintWriter out = response.getWriter(); // 자바api 중 하나 PrintWriter
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다.');"); // (;) 이 엔터키 역할
		out.println("location.href='./Main.cl'");
		out.println("</script>");
		out.close();
			
		return null;
	}

}