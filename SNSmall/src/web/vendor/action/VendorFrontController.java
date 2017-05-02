package web.vendor.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VendorFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/vendorJoin.ve")) {
			forward = new ActionForward();
			forward.setPath("./member/vendor/vendorJoinForm.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/vendorJoinAction.ve")) {
			action = new vendorJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/dupIdCheck.ve")) {
			action = new dupIdCheck();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/vendorView.ve")) {
			action = new vendorViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/vendorJoin2.ve")) {
			forward = new ActionForward();
			forward.setPath("./member/vendor/vendorJoinForm2.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/CancleList.ve")) {
			action = new CancleListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/PayCancle.ve")) {
			action = new PayCancleAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MultipleCancleDone.ve")) {
			action = new MultipleCancleAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/multipleCancle.ve")) {
			forward = new ActionForward();
			forward.setPath("./mypage/vendor/multiple_cancle_list.jsp");
			forward.setRedirect(false);
		}
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} // �씠�룞

	}// doProcess()

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
