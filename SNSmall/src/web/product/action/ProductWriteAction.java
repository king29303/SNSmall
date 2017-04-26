package web.product.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class ProductWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductWriteAction execute()");
		request.setCharacterEncoding("utf-8");
		
		String realPath = request.getRealPath("images");
		System.out.println("물리적 경로 : "+realPath);
		
		int maxSize = 5*1024*1024;
		MultipartRequest multi = 
				new MultipartRequest(request,realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		ProductBean pb = new ProductBean();
		//pb.setEmail(request.getParameter("email"));
		
		
		ProductDAO pdao = new ProductDAO();
		return null;
	}

}
