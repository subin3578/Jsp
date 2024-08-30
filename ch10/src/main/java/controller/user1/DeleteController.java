package controller.user1;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User1Service;

@WebServlet("/user1/delete.do")

public class DeleteController extends HttpServlet {

	private static final long serialVersionUID = -4710401872068918132L;
	
	private User1Service service = User1Service.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// a 태그라서 doGet에서 이용
		// list.jsp에서 삭제버튼 누를 때 같이 가져온 uid 정보 수신
		String uid = req.getParameter("uid");
		
		// 데이터 삭제 요청
		service.deleteUser1(uid);
		
		//
		resp.sendRedirect("/ch10/user1/list.do");
	
	}
}
