package kr.co.everyfarm.admin;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.user.MailAuth;
import kr.co.everyfarm.user.MemberBean;
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
		return "admin/sign-in";
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
	
	@RequestMapping(value = "/adminSign", method = RequestMethod.GET)
	public String sign(Model model) {
		model.addAttribute("adminBean", new AdminBean());
		return "admin/sign-up";
	}
	
	@RequestMapping(value = "/adminSign", method = RequestMethod.POST)
	public String sign(AdminBean adminBean, BindingResult bindingResult, HttpServletRequest request) {

		System.out.println("첫번째:" + adminBean.getA_Pw());
		String encryPassword = UserPw.encrypt(adminBean.getA_Pw());
		adminBean.setA_Pw(encryPassword);
		System.out.println("두번째:" + adminBean.getA_Pw());

		AdminDAO adminDAO = sqlSessionTemplate.getMapper(AdminDAO.class);
		adminDAO.ajoin(adminBean);

		if (bindingResult.hasErrors()) {
			return "admin/sign-up";
		}
		return "redirect:/adminSign";
	}
	
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String mlist(Model model) {
		AdminDAO dao = sqlSessionTemplate.getMapper(AdminDAO.class);
		List<MemberBean> mlist = dao.mlist();
		model.addAttribute("member", mlist);
		return "admin/userList";
	}
	
	@RequestMapping(value = "/farmerList", method = RequestMethod.GET)
	public String flist(Model model) {
		AdminDAO dao = sqlSessionTemplate.getMapper(AdminDAO.class);
		List<FarmerBean> flist = dao.flist();
		model.addAttribute("farmer", flist);
		return "admin/farmerList";
	}
	
	@RequestMapping(value = "/adminLogout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		return "admin/sign-in";
	}
	
	@RequestMapping(value = "/amdinFindId", method = RequestMethod.GET)
	public String findId() {
		return "/admin/findId";
	}

	@RequestMapping(value = "/amdinFindId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findId(@ModelAttribute AdminBean adminBean) {

		Map<String, Object> map = new HashMap<String, Object>();

		AdminDAO dao = sqlSessionTemplate.getMapper(AdminDAO.class);
		AdminBean admin = dao.findId(adminBean);

		if (admin == null) {
			map.put("url", "/amdinFindId");
			map.put("error", false);
		} else {
			map.put("url", "/adminLogin");
			map.put("memId", admin.getA_Id());
			map.put("error", true);
		}

		return map;
	}

	@RequestMapping(value = "/amdinFindPw", method = RequestMethod.GET)
	public String findPw() {
		return "/admin/findPw";
	}

	@RequestMapping(value = "/amdinFindPw", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findPw(@ModelAttribute AdminBean adminBean, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();

		AdminDAO dao = sqlSessionTemplate.getMapper(AdminDAO.class);
		AdminBean admin = dao.findPw(adminBean);

		if (admin == null) {
			map.put("url", "/amdinFindPw");
			map.put("error", false);
		} else {
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}

			adminBean.setA_Pw(pw);

			Properties prop = System.getProperties();
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.port", "587");

			Authenticator auth = new MailAuth();

			Session session = Session.getDefaultInstance(prop, auth);

			MimeMessage msg = new MimeMessage(session);

			try {
				msg.setSentDate(new Date());

				msg.setFrom(new InternetAddress("alsdk9458@gmail.com", "EVERYFARM"));
				InternetAddress to = new InternetAddress(adminBean.getA_Email());
				msg.setRecipient(Message.RecipientType.TO, to);
				msg.setSubject("EVERYFARM", "UTF-8");
				msg.setText("안녕하세요 EVERY FARM 관리자님." + "\n\n" + adminBean.getA_Id() + "관리자님의 임시 비밀번호는 "
						+ adminBean.getA_Pw() + "입니다." + "\n해당 비밀번호로 로그인 후 반드시 비밀번호 변경을 해주시기 바랍니다." + "\n감사합니다.",
						"UTF-8");

				Transport.send(msg);

				String encryPassword = UserPw.encrypt(adminBean.getA_Pw());
				adminBean.setA_Pw(encryPassword);

				dao.upPw(adminBean);

			} catch (AddressException ae) {
				System.out.println("AddressException : " + ae.getMessage());
			} catch (MessagingException me) {
				System.out.println("MessagingException : " + me.getMessage());
			} catch (UnsupportedEncodingException e) {
				System.out.println("UnsupportedEncodingException : " + e.getMessage());
			}

			map.put("url", "/adminLogin");
			map.put("error", true);
		}
		return map;
	}
	
}
