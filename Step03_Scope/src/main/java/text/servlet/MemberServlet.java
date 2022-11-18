package text.servlet;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dto.MemberDto;

@WebServlet("/member")
public class MemberServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//회원 한 명의 정보를 얻어오는 비즈니스 로직 수행
		MemberDto dto=new MemberDto(1, "김구라", "노량진");
		
		//scope에 dto라는 키값으로 담기
		req.setAttribute("dto", dto);
		
		//forward 이동
		RequestDispatcher rd=req.getRequestDispatcher("/test/member.jsp");
		rd.forward(req, resp);
		
	}
}
