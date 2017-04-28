package web.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class ProductInsertAction implements Action{
	String opt1,opt2,opt3;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		String realPath = request.getRealPath("/vendor_img");
		System.out.println("물리적경로:"+realPath);
		int maxSize = 5*1024*1024;
		MultipartRequest multi = 
				new MultipartRequest(request, realPath, maxSize, "utf-8", 
						new DefaultFileRenamePolicy());
		
		ProductBean prb = new ProductBean();
		ProductDAO prdao = new ProductDAO();
		prb.setVendor_id(multi.getParameter("vendor_id"));
		prb.setCategory(multi.getParameter("category"));
		prb.setSubject(multi.getParameter("subject"));
		prb.setContent(multi.getParameter("content"));
		prb.setMain_img(multi.getFilesystemName("main_img"));
		prb.setDetail_img(multi.getFilesystemName("detail_img"));
		if (multi.getParameter("opt_name1") != null && !multi.getParameter("opt_name1").equals("")){
			opt1 = multi.getParameter("opt_name1")+","+multi.getParameter("option1");	
		}
		if (multi.getParameter("opt_name2") != null && !multi.getParameter("opt_name2").equals("")){
			opt2 = multi.getParameter("opt_name2")+","+multi.getParameter("option2");
		}
		if (multi.getParameter("opt_name3") != null && !multi.getParameter("opt_name3").equals("")){
			opt3 = multi.getParameter("opt_name3")+","+multi.getParameter("option3");	
		}
		
		prb.setOption1(opt1);
		prb.setOption2(opt2);
		prb.setOption3(opt3);
		prb.setPrice(Integer.parseInt(multi.getParameter("price")));
		prb.setAmount(Integer.parseInt(multi.getParameter("amount")));
		prdao.insertProduct(prb);
				
		ActionForward forward = new ActionForward();		
		forward.setPath("./Main.ve");
		forward.setRedirect(true);
		
		return forward;		 
	}
}