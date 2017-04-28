package web.product.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import web.product.db.ProductBean;
import web.product.db.ProductDAO;

public class ProductUpdateAction implements Action{
	String opt1,opt2,opt3,pre_main_img,pre_detail_img,main_img,detail_img;
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
		
		prb.setProduct_num(Integer.parseInt(multi.getParameter("product_num")));
		prb.setCategory(multi.getParameter("category"));
		prb.setSubject(multi.getParameter("subject"));
		prb.setContent(multi.getParameter("content"));
		
		pre_main_img = multi.getParameter("pre_main_img");
		pre_detail_img = multi.getParameter("pre_detail_img");
		main_img = multi.getFilesystemName("main_img");
		detail_img = multi.getFilesystemName("detail_img");
					
		prb.setMain_img(multi.getFilesystemName("main_img"));
		prb.setDetail_img(multi.getFilesystemName("detail_img"));
		
		
		// 옵션명, 옵션 합치기 {
		if (multi.getParameter("opt_name1") != null && !multi.getParameter("opt_name1").equals("")){
			opt1 = multi.getParameter("opt_name1")+","+multi.getParameter("option1");	
		}
		if (multi.getParameter("opt_name2") != null && !multi.getParameter("opt_name2").equals("")){
			opt2 = multi.getParameter("opt_name2")+","+multi.getParameter("option2");
		}
		if (multi.getParameter("opt_name3") != null && !multi.getParameter("opt_name3").equals("")){
			opt3 = multi.getParameter("opt_name3")+","+multi.getParameter("option3");	
		}// } 옵션명, 옵션 합치기		
		
		prb.setOption1(opt1);
		prb.setOption2(opt2);
		prb.setOption3(opt3);
		prb.setPrice(Integer.parseInt(multi.getParameter("price")));
		prb.setAmount(Integer.parseInt(multi.getParameter("amount")));
				
		// 파일변경 시 기존 파일 삭제 {
				if(main_img != null && !main_img.equals(pre_main_img)){
					System.out.println(realPath+"\\"+pre_main_img);
					File file = new File(realPath+"\\"+pre_main_img);
					file.delete();
				}
				
				if(detail_img != null && !detail_img.equals(pre_detail_img)){
					System.out.println(realPath+"\\"+pre_detail_img);
					File file = new File(realPath+"\\"+pre_detail_img);
					file.delete();
				}// }파일변경 시 기존 파일 삭제
		
		// 4가지 경우에 따른 다른 수정 메소드 호출 {
		if(main_img != null && !main_img.equals(pre_main_img)){
			if(detail_img != null && !detail_img.equals(pre_detail_img)){
				System.out.println("둘다변경");
				prdao.updateProduct3(prb);
			}else{
				System.out.println("메인이미지만 변경");
				prdao.updateProduct1(prb);
			}
		}else{
			if(detail_img != null && !detail_img.equals(pre_detail_img)){
				System.out.println("상세이미지만 변경");
				prdao.updateProduct2(prb);
			}else{
				System.out.println("파일빼고 다 변경");
				prdao.updateProduct(prb);
			}
		}// } 4가지 경우에 따른 다른 수정 메소드 호출
		
		ActionForward forward = new ActionForward();		
		forward.setPath("./ProductListAction.pr");
		forward.setRedirect(true);
		
		return forward;		 
	}
}