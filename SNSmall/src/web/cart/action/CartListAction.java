package web.cart.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.cart.db.CartBean;
import web.cart.db.CartDAO;

public class CartListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("장바구니 리스트 보여주기");
		
		CartDAO cdao = new CartDAO();
		String client_id = "abc";
		
		List<CartBean> CartList = cdao.getCartList(client_id);
		request.setAttribute("CartList", CartList);
		ActionForward forward = new ActionForward();
		forward.setPath("./shopping_basket/cart_list.jsp");
		forward.setRedirect(false);
		System.out.println(forward.getPath());
		return forward;
	}

}
