package web.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class ProductUpdateForm implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int product_num=Integer.parseInt(request.getParameter("product_num"));
		ProductDAO prdao=new ProductDAO();
		ProductBean prb=prdao.getProduct(product_num);
	
		if(prb.getOption1() != null){
			String opt_name1 = prb.getOption1().split(",")[0];
			prb.setOption1(prb.getOption1().substring(opt_name1.length()+1));
			request.setAttribute("opt_name1", opt_name1);
		}
		if(prb.getOption2() != null){
			String opt_name2 = prb.getOption2().split(",")[0];
			prb.setOption2(prb.getOption2().substring(opt_name2.length()+1));
			request.setAttribute("opt_name2", opt_name2);
		}
		if(prb.getOption3() != null){
			String opt_name3 = prb.getOption3().split(",")[0];
			prb.setOption3(prb.getOption3().substring(opt_name3.length()+1));
			request.setAttribute("opt_name3", opt_name3);
		}				
		request.setAttribute("prb", prb);
			
		ActionForward forward=new ActionForward();
		forward.setPath("./product/productUpdate.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
