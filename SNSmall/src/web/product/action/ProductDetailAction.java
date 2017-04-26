package web.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class ProductDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductDetail execute()");
		int num = 1;
		
		ProductDAO pdao = new ProductDAO();
		
		ActionForward forward = new ActionForward();
		forward.setPath("./product/detail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
