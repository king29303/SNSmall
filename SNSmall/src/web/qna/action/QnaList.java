package web.qna.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.qna.db.QnaBean;
import web.qna.db.QnaDAO;

public class QnaList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("QnaList execute()");
		
		request.setCharacterEncoding("utf-8");
		
		QnaDAO qdao = new QnaDAO();
		int count = qdao.getQnaCount();
		int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		int product_num = Integer.parseInt(request.getParameter("product_num"));
		if(pageNum==null){pageNum="1";}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		
		//List<QnaBean> qnaList = qdao.getQnaList(startRow, pageSize);
		
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		int pageBlock = 5;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > pageCount){endPage=pageCount;}

		request.setAttribute("pageNum", pageNum);
		//request.setAttribute("qnaList", qnaList);
		request.setAttribute("count", count);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./ProductDetailAction.pr?product_num="+product_num+"&pageNum="+pageNum);
		forward.setRedirect(true);
		return forward;
	}

}
