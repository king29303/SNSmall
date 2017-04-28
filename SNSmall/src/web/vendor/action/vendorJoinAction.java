package web.vendor.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.vendor.db.VendorBean;
import web.vendor.db.VendorDAO;



public class vendorJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		VendorDAO vdao = new VendorDAO();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		boolean check=vdao.idDupCheck(id); 
		if(check==false){
			out.println("<script>");
			out.println("alert('다른 아이디를 입력하세요');");
			out.println("history.back();");
			out.println("</script>");
			return null;
		}		
		VendorBean vb = new VendorBean();
		vb.setVendor_id(request.getParameter("id"));
		vb.setPass(request.getParameter("pass"));
		vb.setPerson_name(request.getParameter("name"));
		vb.setCompany_name(request.getParameter("company"));
		vb.setPhone(request.getParameter("phone"));
		String addre = request.getParameter("postcode")+", "+request.getParameter("address")+", "+request.getParameter("address2");
		vb.setAddress(addre);
		vdao.insertVendor(vb);
		ActionForward forward = new ActionForward();
		forward.setPath("./login.ve");
		forward.setRedirect(true);
		return forward;
	}
		
}
