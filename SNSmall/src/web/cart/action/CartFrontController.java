package web.cart.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class CartFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		// /Team/CartList.ca
		String contextPath = request.getContextPath(); 
		//  /Team
		String command = requestURI.substring(contextPath.length()); // /*.ca
		// /CartList.ca
		System.out.println(command);
		ActionForward forward = null;
		Action action = null;
		if(command.equals("/CartList.ca")){
			action=new CartListAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}else if(command.equals("/CartAdd.ca")){
			action=new CartAdd();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}else if(command.equals("/main.ca")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./shopping_basket/main.jsp");
		}else if(command.equals("/requestTest.ca")){
			action=new requestTest();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}
		
		
		
		
		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
}
