package web.payment.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;

public class PayListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String client_id = "test";
		String method = request.getParameter("method");
		PaymentDAO pdao = new PaymentDAO();
		int page = Integer.parseInt(request.getParameter("page"));
		List<PaymentBean> pay_list = pdao.getPaymentById(page, client_id, method);
		request.setAttribute("pay_list", pay_list);
		ActionForward forward = new ActionForward();
		forward.setPath("./mypage/payInnerList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
