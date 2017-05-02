package web.vendor.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class MultipleCancleAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		PaymentDAO pdao = new PaymentDAO();
		ProductDAO prodao = new ProductDAO();

		String order_num = request.getParameter("order_num");
		List<PaymentBean> pb_list = pdao.getPayment(order_num);
		int usedPoint = pb_list.get(0).getUsedPoint();
		String id=pb_list.get(0).getClient_id();
		ProductBean prob = null;
		for(int i=0; i<pb_list.size(); i++){
			PaymentBean pb = pb_list.get(i);
			prob = prodao.getProduct(pb.getProduct_num());
			pdao.subSnsPay(prob.getPrice(), pb.getSns_id());
			pdao.subVendorProfit(prob.getPrice(), pb.getVendor_id());
			pdao.subAmount(pb.getAmount(), pb.getProduct_num());
		}
				pdao.deletePay(order_num);
				pdao.addPoint(usedPoint, id);
				out.println("<script>");
				out.println("alert('취소가 완료되었습니다.');");
				out.println("location.href='CancleList.ve';");
				out.println("</script>");

		return null;
	}

}
