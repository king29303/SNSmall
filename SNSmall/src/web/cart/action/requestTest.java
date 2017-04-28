package web.cart.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.cart.db.CartBean;

public class requestTest implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String client_id2 = request.getParameter("client_id");
		String product_num = request.getParameter("product_num");
		String amount = request.getParameter("client_id");
		System.out.println(client_id2);
		System.out.println(product_num);
		System.out.println(amount);
		return null;
	}

}
