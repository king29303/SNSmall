package web.sns.action;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.sns.db.SnsBean;
import web.sns.db.SnsDAO;

public class SnsDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sns_id = request.getParameter("sns_id");
		
		SnsDAO sdao = new SnsDAO();
		SnsBean sb = sdao.getSnsDetail(sns_id);
		List<Integer> latest_list = sdao.snsProductList(sns_id, "date");
		List<Integer> popular_list = sdao.snsProductList(sns_id, "sell");
		//System.out.println("size: "+popular_list.size());
		for(int i=0; i<popular_list.size(); i++){
		//System.out.println("popular_get: "+popular_list.get(i));
		}
		request.setAttribute("sb", sb);
		request.setAttribute("latest_list", latest_list);
		request.setAttribute("popular_list", popular_list);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./sns_star/detail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
