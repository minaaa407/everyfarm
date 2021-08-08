package kr.co.everyfarm.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "home/home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("login:: get");
		return "user/loginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO memberVO, FarmerVO farmerVO, HttpServletRequest request) {
		System.out.println("login:: post");

		HttpSession session = request.getSession();

		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
		MemberVO member = userDAO.mlogin(memberVO);

		if (member != null) {
			session.setAttribute("member", member);
			return "redirect:home/home";

		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/sign", method = RequestMethod.GET)
	public String sign() {
		System.out.println("sign:: get");
		return "user/signUp";
	}

	@RequestMapping(value = "/sign", method = RequestMethod.POST)
	public String sign(MemberVO memberVO) {
		System.out.println("sign:: post");

		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
		userDAO.mjoin(memberVO);

		return "home/home";
	}

	@RequestMapping(value = "/CheckId", method = RequestMethod.GET)
	public String CheckId() {
		return "user/signUp";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "home/home";
	}

	@RequestMapping("/myInfo")
	public String myInfo() {
		return "user/myPage";
	}

}

/*
 * @Controller public class MemberController {
 * 
 * @RequestMapping(value = "/user/{var}") public String
 * User(@PathVariable("var") String var) { String returnUrl = "";
 * if(var.equals("login")) { returnUrl = "member/loginForm"; }else
 * if(var.equals("sign")) { returnUrl = "member/signUp"; } return returnUrl; } }
 */
