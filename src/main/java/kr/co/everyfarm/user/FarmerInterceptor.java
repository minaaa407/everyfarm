package kr.co.everyfarm.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class FarmerInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		response.setContentType("text/html; charset=utf-8");
		HttpSession httpSession = request.getSession();
		PrintWriter printwriter = response.getWriter();

		if (httpSession.getAttribute("admin") == null) {
			logger.info("로그인 후 이용가능한 기능 접근");
			printwriter.print("<script charset=UTF-8>alert('로그인 후 이용가능합니다.'); location.href=\"/farmerLogin\"</script>");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}
