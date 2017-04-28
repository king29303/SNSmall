package web.sns.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.payment.action.PayCompleteAction;

public class SnsFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/snsList.sn")){
			action = new StarListAction();
			try{	
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/SnsDetailAction.sn")){
			action = new SnsDetailAction();
			try{	
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/sns_join.sn")){
			forward= new ActionForward();
	 		forward.setPath("./member/sns/sns_join.jsp");
	 		forward.setRedirect(false);
	 		
		}else if(command.equals("/IdCheckAction.sn")){
			action = new IdCheckAction();
	 		try{
	 			forward=action.execute(request, response);
	 		}catch(Exception e){
	 			e.printStackTrace();
	 		}
	 		
		}else if(command.equals("/SnsJoinAction.sn")){
			action = new SnsJoinAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}else if(command.equals("/common_join.sn")){
			forward= new ActionForward();
	 		forward.setPath("./SNSmall/member/common_join.jsp");
	 		forward.setRedirect(false);
	 		
		}else if(command.equals("/SnsInfo.sn")){
			action = new Snsinfo();
	 		try{
	 			forward=action.execute(request, response);
	 		}catch(Exception e){
	 			e.printStackTrace();
	 		}
	 		
		}else if(command.equals("/passConfirm.sn")){
			forward= new ActionForward();
	 		forward.setPath("./member/sns/passConfirm.jsp");
	 		forward.setRedirect(false);
		}

		if(forward!=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
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
