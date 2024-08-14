package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	
	private static final long serialVersionUID = 5428543086214936840L;

	@Override
	public void init() throws ServletException {
		// 서블릿이 최초로 실행될 때 (초기화) - 모든 서블릿에 적용
		System.out.println("HelloServlet init...");
	}
	
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
		writer.println("<title>HelloServlet</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>HelloServlet</h3>");
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
	
	@Override
	public void destroy() {
		System.out.println("HelloServlet destroy...");
	}
	
}
