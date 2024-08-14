package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WelcomeServlet extends HttpServlet {
	
	private static final long serialVersionUID = -2674045855758967850L;


	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트의 요청이 GET일 경우 
		System.out.println("HelloServlet doGet...");
		
		// HTML 출력
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<meta charset='URF-8'/>");
		writer.println("<title>WelcomeServlet</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>WelcomeServlet</h3>");
		writer.println("<a href='/ch09/1.ServletTest.jsp'>Servlet 메인 </a>");
		writer.println("<a href='/ch09/hello.do'>hello</a>");
		writer.println("<a href='/ch09/welcome.do'>welcome</a>");
		writer.println("<a href='/ch09/greeting.do'>greeting</a>");
		writer.println("</body>");
		writer.println("</html>");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("HelloServlet doPost...");
	}
	
}
