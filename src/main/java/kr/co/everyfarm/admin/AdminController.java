package kr.co.everyfarm.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.everyfarm.user.UserPw;

@Controller
public class AdminController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
		return "admin/admin";
	}
	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public String alogin() {
		return "admin/AdLogin";
	}
	
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String alogin(AdminBean adminBean, HttpServletRequest request) {
		System.out.println("login:: post");

		HttpSession session = request.getSession();
		AdminDAO adminDAO = sqlSessionTemplate.getMapper(AdminDAO.class);

		System.out.println("첫번째:" + adminBean.getA_Pw());
		String encryPassword = UserPw.encrypt(adminBean.getA_Pw());
		adminBean.setA_Pw(encryPassword);
		System.out.println("두번째:" + adminBean.getA_Pw());

		AdminBean admin = adminDAO.alogin(adminBean);

		if (admin != null) {
			session.setAttribute("admin", admin);
			return "redirect:/admin";
		} else {
			return "redirect:/adminLogin";
		}
	}
}
