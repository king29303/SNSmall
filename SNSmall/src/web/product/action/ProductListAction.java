package web.product.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class ProductListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws Exception{
		System.out.println("BoardListAction execute()");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id"); 
		ActionForward forward = new ActionForward();
		
			ProductDAO prdao = new ProductDAO(); 
			int count = prdao.getProductCount(id);
			int pageSize = 10;
			
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null) pageNum="1";
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage-1)*pageSize+1;
			int endRow = currentPage*pageSize;
			int pageCount = 0;
			int pageBlock = 10;
			int startPage = 0;
			int endPage = 0;
			
			List<ProductBean> productList = null;
			if(count!=0) {
				productList = prdao.getProductList(id, startRow, pageSize);
				pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
				
				startPage = ((currentPage - 1)/pageBlock)*pageBlock+1;
				endPage = startPage + pageBlock - 1;
				if(endPage > pageCount){
					endPage = pageCount;
				}
			}
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("count", count);
			request.setAttribute("productList", productList);
			
			forward.setPath("./product/productList.jsp");
			forward.setRedirect(false);			
		return forward;
		
	}

}