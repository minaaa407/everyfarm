package kr.co.everyfarm.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.everyfarm.user.FarmerBean;
import kr.co.everyfarm.user.MemberBean;
import kr.co.everyfarm.user.UserDAO;
import kr.co.everyfarm.user.UserPw;

@Controller
public class AdminController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
		return "home/admin";
	}
	
	@RequestMapping(value = "/adLogin", method = RequestMethod.GET)
	public String adLogin() {
		return "admin/adLogin";
	}
	
	@RequestMapping(value = "/adLogin", method = RequestMethod.POST)
	@ResponseBody
	public String login(MemberBean memberBean, FarmerBean farmerBean, HttpServletRequest request) {
		System.out.println("login:: post");

		HttpSession session = request.getSession();
		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);

		System.out.println("첫번째:" + memberBean.getM_Pw());
		String encryPassword = UserPw.encrypt(memberBean.getM_Pw());
		memberBean.setM_Pw(encryPassword);
		System.out.println("두번째:" + memberBean.getM_Pw());

		MemberBean member = userDAO.mlogin(memberBean);

		if (member != null) {
			session.setAttribute("member", member);
			return "redirect:/home";
		} else {
			return "redirect:/login";
		}
	}
	
}
