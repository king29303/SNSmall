package web.cart.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.cart.db.CartBean;

public class requestTest implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String[] client_id = request.getParameterValues("client_id");
		System.out.println(client_id);
		for(int i=0;i<client_id.length;i++){
			System.out.println(client_id[i]);
		}
		return null;
	}

}
