package controller.user1;

import java.io.IOException;

import dto.User1DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User1Service;

@WebServlet("/user1/register.do")

public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 3989756952756485985L;
	private User1Service service = User1Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user1/register.jsp");
		dispatcher.forward(req,resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// register.jsp (HTML VIEW)에서 form으로 받은 데이터 수신
		String uid = req.getParameter("uid");
		String name= req.getParameter("name");
		String birth = req.getParameter("birth");
		String hp = req.getParameter("hp");
		String age = req.getParameter("age");
		
		
		// DTO 생성
		
		User1DTO dto = new User1DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setBirth(birth);
		dto.setHp(hp);
		dto.setAge(age);
		
		// 모델 서비스 호출
		service.insertUser1(dto);
		
		// 리다이렉트
		resp.sendRedirect("/ch10/user1/list.do");
	}
}