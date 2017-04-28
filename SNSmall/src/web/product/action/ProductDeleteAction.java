package web.product.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class ProductDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String realPath = request.getRealPath("/vendor_img");
		int product_num=Integer.parseInt(request.getParameter("product_num"));
		ProductDAO prdao=new ProductDAO();
		ProductBean prb=prdao.getProduct(product_num);
		prdao.deleteProduct(product_num);
		File file1 = new File(realPath+"\\"+prb.getMain_img());
		File file2 = new File(realPath+"\\"+prb.getDetail_img());
		file1.delete();
		file2.delete();			
		
		ActionForward forward=new ActionForward();
		forward.setPath("./ProductListAction.pr");
		forward.setRedirect(true);
		return forward;
	}
}