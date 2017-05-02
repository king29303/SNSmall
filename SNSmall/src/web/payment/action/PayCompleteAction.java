package web.payment.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.client.db.ClientBean;
import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;
import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class PayCompleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = "test";
		String merchant_uid = request.getParameter("merchant_uid");
		String vendorId_str = request.getParameter("vendorId_str");
		String[] vendor_id = vendorId_str.split(",");
		int price = Integer.parseInt(request.getParameter("price"));
		String amount_str = request.getParameter("amount_str");
		String[] amount = amount_str.split(",");
		String product_str = request.getParameter("product_str");
		String[] product = product_str.split(",");
		int point = Integer.parseInt(request.getParameter("point"));
		String snsId_str = request.getParameter("snsId_str");
		String[] sns_id = snsId_str.split(",");
		String message = request.getParameter("message");
		String option1_str = request.getParameter("option1_str");
		String[] option1 = option1_str.split(",");
		String option2_str = request.getParameter("option2_str");
		String[] option2 = option2_str.split(",");
		String option3_str = request.getParameter("option3_str");
		String[] option3 = option3_str.split(",");
		String method = request.getParameter("method");
		String state="";
		if(method.equals("card")) state="payDone";
		else if(method.equals("deposit")) state="waiting";
		
		// Payment�뿉 Insert
		PaymentBean pb = null;
		ProductBean prob = null;
		PaymentDAO pdao = new PaymentDAO();
		ProductDAO prodao = new ProductDAO();
		int usedPoint = pdao.usingPoint(point, id);
		List<PaymentBean> list_pb = new ArrayList<>();
		for (int i = 0; i < amount.length; i++) {
			prob = prodao.getProduct((Integer.parseInt(product[i])));// 臾쇨굔 踰덊샇
																		// ProductBean
			pb = new PaymentBean();
			pb.setAmount(Integer.parseInt(amount[i]));
			pb.setClient_id(id);
			pb.setMessage(message);
			pb.setOrder_num(merchant_uid);
			pb.setProduct_num(Integer.parseInt(product[i]));
			pb.setSns_id(sns_id[i]);
			pb.setVendor_id(vendor_id[i]);
			pb.setOption1(option1[i]);
			pb.setOption2(option2[i]);
			pb.setOption3(option3[i]);
			list_pb.add(pb);
			// �룷�씤�듃 蹂�寃�
			pdao.subPoint(point, id);
			// sns star profit蹂�寃�, sell利앷�
			pdao.addSnsPay(prob.getPrice(), sns_id[i]);
			// vendor profit 蹂�寃�
			pdao.addVendorProfit(prob.getPrice(), vendor_id[i]);

			pdao.subAmount(Integer.parseInt(amount[i]), Integer.parseInt(product[i]));
		}
		pdao.insertPay(list_pb, usedPoint, state);
		return null;
	}
	
}
