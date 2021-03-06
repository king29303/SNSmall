package web.payment.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class PayMultipleCancleAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		PaymentDAO pdao = new PaymentDAO();
		ProductDAO prodao = new ProductDAO();
		String id = "test";
		String order_num = request.getParameter("order_num");
		List<PaymentBean> pb_list = pdao.getPayment(order_num);
		int usedPoint = pb_list.get(0).getUsedPoint();
		ProductBean prob = null;
		for (int i = 0; i < pb_list.size(); i++) {
			PaymentBean pb = pb_list.get(i);
			prob = prodao.getProduct(pb.getProduct_num());
		}
		pdao.deletePayRequest(order_num);
		out.println("<script>");
		out.println("alert('취소가 완료되었습니다.');");
		out.println("location.href='PayList.pa';");
		out.println("</script>");

		return null;
	}

}
