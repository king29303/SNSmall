package web.vendor.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.vendor.db.VendorBean;
import web.vendor.db.VendorDAO;

public class vendorViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		VendorDAO vdao = new VendorDAO();
		VendorBean vb = vdao.getVendor(id);
		
		request.setAttribute("vb", vb);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.ve");
		forward.setRedirect(true);			
		return forward;
	}
}