package web.product.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;
import web.qna.db.QnaBean;
import web.qna.db.QnaDAO;

public class ProductDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductDetailAction execute()");
		
		request.setCharacterEncoding("utf-8");
		
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		String pageNum = request.getParameter("pageNum");
		
		if(product_num==0){
			product_num = ((Integer)request.getAttribute("product_num")).intValue();
			pageNum = (String)request.getAttribute("pageNum");
		}
		if(pageNum==null){pageNum="1";}
		
		ProductDAO productdao = new ProductDAO();
		ProductBean productbean = productdao.getProduct(product_num);
		
		QnaDAO qdao = new QnaDAO();
		
//		int count = qdao.getQnaCount();
//		int pageSize = 20;
//		int currentPage = Integer.parseInt(pageNum);
//		int startRow = (currentPage-1)*pageSize+1;
//		int endRow = currentPage*pageSize;
		
		List<QnaBean> qnaList = qdao.getQnaList(product_num);
		
//		int pageCount = count/pageSize+(count%pageSize==0?0:1);
//		int pageBlock = 5;
//		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
//		int endPage = startPage+pageBlock-1;
//		if(endPage > pageCount){endPage=pageCount;}

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("qnaList", qnaList);
//		request.setAttribute("count", count);
//		request.setAttribute("pageCount", pageCount);
//		request.setAttribute("pageBlock", pageBlock);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);
		
		request.setAttribute("productbean", productbean);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./product/detail.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
