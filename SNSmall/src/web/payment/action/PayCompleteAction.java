package web.payment.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.client.db.ClientBean;
import web.payment.db.PaymentBean;
import web.payment.db.PaymentDAO;

public class PayCompleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = "test";
		String merchant_uid = request.getParameter("merchant_uid");
		String vendor_id = request.getParameter("vendor_id");
		int price = Integer.parseInt(request.getParameter("price"));
		String amount_str = request.getParameter("amount_str");
		String[] amount = amount_str.split(",");
		String product_str = request.getParameter("product_str");
		String[] product = product_str.split(",");
		int point = Integer.parseInt(request.getParameter("point"));
		String sns_id = request.getParameter("sns_id");
		String message = request.getParameter("message");

		//Payment에 Insert
		PaymentBean pb = null;
		List<PaymentBean> list_pb = new ArrayList<>();
		for(int i=0; i<amount.length; i++){
			pb = new PaymentBean();
			pb.setAmount(Integer.parseInt(amount[i]));
			pb.setClient_id(id);
			pb.setMessage(message);
			pb.setNum(merchant_uid);
			pb.setProduct_num(Integer.parseInt(product[i]));
			pb.setSns_id(sns_id);
			pb.setVendor_id(vendor_id);
			
			list_pb.add(pb);
		}
		
		PaymentDAO pdao = new PaymentDAO();
		pdao.insertPay(list_pb);
		
		//포인트 변경
		//pdao.subPoint(point, id);
		
		//sns star profit변경
		pdao.addSnsProfit(price, sns_id);
		
		//vendor profit 변경
		pdao.addVendorProfit(price, vendor_id);
		
		//수량변경
		pdao.subAmount(list_pb);
		
		
		
		
		return null;
	}
	
}
