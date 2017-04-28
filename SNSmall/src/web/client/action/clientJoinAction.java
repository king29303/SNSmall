package web.client.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.client.db.ClientBean;
import web.client.db.ClientDAO;
import web.vendor.db.VendorBean;
import web.vendor.db.VendorDAO;



public class clientJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		ClientDAO cldao = new ClientDAO();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		boolean check=cldao.idDupCheck(id); 
		if(check==false){
			out.println("<script>");
			out.println("alert('다른 아이디를 입력하세요');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}		
		ClientBean clb = new ClientBean();
		clb.setClient_id(request.getParameter("id"));
		clb.setPass(request.getParameter("pass"));
		clb.setName(request.getParameter("name"));
		clb.setEmail(request.getParameter("email"));
		clb.setPhone(request.getParameter("phone"));
		String addre = request.getParameter("postcode")+", "+request.getParameter("address")+", "+request.getParameter("address2");
		clb.setAddress(addre);
		
		cldao.insertClient(clb);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./login.cl");
		forward.setRedirect(true);
		return forward;
	}
		
}
