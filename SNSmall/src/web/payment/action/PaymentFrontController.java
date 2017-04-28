package web.payment.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PaymentFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		if (command.equals("/Pay.pa")) {
			forward = new ActionForward();
			forward.setPath("./pay/pay.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/PayCompleteAction.pa")) {
			action = new PayCompleteAction();
			try {
				action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Deposit.pa")) {
			forward = new ActionForward();
			forward.setPath("./pay/deposit.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/PayDone.pa")) {
			forward = new ActionForward();
			forward.setPath("./pay/payDone.jsp");
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
