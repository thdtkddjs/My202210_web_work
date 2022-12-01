package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class EncodingFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//만약 인코딩 설정이 되지 않았다면
		if(request.getCharacterEncoding()==null) {
			//Post 방식 전송 시에 한글 깨짐을 방지한다.
			request.setCharacterEncoding("utf-8");
		}
		//2. 요청의 흐름 이어가기
		chain.doFilter(request, response);
	}

}
