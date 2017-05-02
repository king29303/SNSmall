package web.client.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ClientFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/Main.cl")){
			forward = new ActionForward();
			forward.setPath("./main/index.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/clientJoin.cl")) {
			forward = new ActionForward();
			forward.setPath("./member/client/clientJoinForm.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/Service.cl")) {
			forward = new ActionForward();
			forward.setPath("./service/service.jsp");
			forward.setRedirect(false);
		}else if (command.equals("/mailAction.cl")) {
			action = new mailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/clientJoinAction.cl")) {
			action = new clientJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/dupIdCheck.cl")){
			action = new dupIdCheck();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if (command.equals("/login.cl")) {
			forward = new ActionForward();
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/dupIdCheck.cl")) {
			action = new dupIdCheck();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/loginAction.cl")){
			action = new loginAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/logOut.cl")){
			// �뙣�궎吏� net.member.action �뙆�씪 MemberLogout.java
			action = new logOutAction();
			// forward = execute硫붿꽌�뱶 �샇異� -> 二쇱냼媛� 由ы꽩
			try{
				forward = action.execute(request, response);	
			}catch(Exception e){
				e.printStackTrace();
			}				
		}else if (command.equals("/clientJoin2.cl")) {
			forward = new ActionForward();
			forward.setPath("./member/client/clientJoinForm2.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/login2.cl")) {
			forward = new ActionForward();
			forward.setPath("./member/loginForm2.jsp");
			forward.setRedirect(false);
		} 
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
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
