package kr.co.everyfarm.farmer;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

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
import javax.validation.Valid;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.everyfarm.user.MailAuth;
import kr.co.everyfarm.user.UserPw;

@Controller
public class FarmerController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/farmer", method = RequestMethod.GET)
	public String farmer() {
		return "farmer/farmer";
	}

	@RequestMapping(value = "/farmerLogin", method = RequestMethod.GET)
	public String flogin() {
		System.out.println("login:: get");
		return "farmer/FmLogin";
	}

	@RequestMapping(value = "/farmerLogin", method = RequestMethod.POST)
	public String flogin(FarmerBean farmerBean, HttpServletRequest request) {
		System.out.println("login:: post");

		HttpSession session = request.getSession();
		FarmerDAO farmerDAO = sqlSessionTemplate.getMapper(FarmerDAO.class);

		System.out.println("첫번째:" + farmerBean.getF_Pw());
		String encryPassword = UserPw.encrypt(farmerBean.getF_Pw());
		farmerBean.setF_Pw(encryPassword);
		System.out.println("두번째:" + farmerBean.getF_Pw());

		FarmerBean farmer = farmerDAO.flogin(farmerBean);

		if (farmer != null) {
			session.setAttribute("farmer", farmer);
			return "redirect:/farmer";
		} else {
			return "redirect:/farmerLogin";
		}
	}
	
	@RequestMapping(value = "/farmerSign", method = RequestMethod.GET)
	public String sign(Model model) {
		model.addAttribute("farmerBean", new FarmerBean());
		return "user/signUp";
	}

	@RequestMapping(value = "/farmerSign", method = RequestMethod.POST)
	public String sign(@Valid FarmerBean farmerBean, BindingResult bindingResult, HttpServletRequest request) {

		farmerBean.setF_Addr(request.getParameter("Addr2") + request.getParameter("Addr3")
				+ request.getParameter("Addr4") + "(" + request.getParameter("Addr1") + ")");

		System.out.println("첫번째:" + farmerBean.getF_Pw());
		String encryPassword = UserPw.encrypt(farmerBean.getF_Pw());
		farmerBean.setF_Pw(encryPassword);
		System.out.println("두번째:" + farmerBean.getF_Pw());

		FarmerDAO farmerDAO = sqlSessionTemplate.getMapper(FarmerDAO.class);
		farmerDAO.fjoin(farmerBean);

		if (bindingResult.hasErrors()) {
			return "farmer/signUp";
		}
		return "farmer/farmer";
	}

	@RequestMapping(value = "/farmerCheckMail", method = RequestMethod.POST, produces = "application/json;")
	@ResponseBody
	public Map<String, Object> checkMail(FarmerBean farmerBean, HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();

		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");

		Random random = new Random();
		int mailNum = random.nextInt(999999);

		Authenticator auth = new MailAuth();

		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage msg = new MimeMessage(session);

		try {
			msg.setSentDate(new Date());

			msg.setFrom(new InternetAddress("alsdk9458@gmail.com", "EVERYFARM"));
			InternetAddress to = new InternetAddress(farmerBean.getF_Id());
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("EVERYFARM", "UTF-8");
			msg.setText("안녕하세요 EVERY FARM에 방문해주셔서 감사합니다." + "\n\n이메일 인증번호는 " + mailNum + "입니다."
					+ "\n해당 인증번호를 인증번호 확인란에 기입해주십시오." + "\n감사합니다.", "UTF-8");

			Transport.send(msg);

			map.put("error", true);

		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
			map.put("error", false);
		} catch (MessagingException me) {
			System.out.println("MessagingException : " + me.getMessage());
			map.put("error", false);
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
			map.put("error", false);
		}
		return map;
	}

	@RequestMapping(value = "/farmerCheckId", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(FarmerBean farmerBean) {

		FarmerDAO dao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		int result = dao.checkId(farmerBean);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	}

	@RequestMapping(value = "/farmerFindId", method = RequestMethod.GET)
	public String findId() {
		return "/farmer/findId";
	}

	@RequestMapping(value = "/farmerFindId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findId(@ModelAttribute FarmerBean farmerBean) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		FarmerDAO dao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		FarmerBean farm = dao.findId(farmerBean);

		if (farm == null) {
			map.put("url", "/farmerFindId");
			map.put("error", false);
		} else {
			map.put("url", "/farmerLogin");
			map.put("farmId", farm.getF_Id());
			map.put("error", true);
		}
		return map;
	}

	@RequestMapping(value = "/farmerFindPw", method = RequestMethod.GET)
	public String findPw() {
		return "/farmer/findPw";
	}

	@RequestMapping(value = "/farmerFindPw", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findPw(@ModelAttribute FarmerBean farmerBean, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		FarmerDAO dao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		FarmerBean farm = dao.findPw(farmerBean);

		if (farm == null) {
			map.put("url", "/farmerFindPw");
			map.put("error", false);
		} else {
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}

			farmerBean.setF_Pw(pw);

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
				InternetAddress to = new InternetAddress(farmerBean.getF_Id());
				msg.setRecipient(Message.RecipientType.TO, to);
				msg.setSubject("EVERYFARM", "UTF-8");
				msg.setText("안녕하세요 EVERY FARM에 방문해주셔서 감사합니다." + "\n\n" + farmerBean.getF_Id() + "고객님의 임시 비밀번호는 "
						+ farmerBean.getF_Pw() + "입니다." + "\n해당 비밀번호로 로그인 후 반드시 비밀번호 변경을 해주시기 바랍니다." + "\n감사합니다.",
						"UTF-8");

				Transport.send(msg);
				
				String encryPassword = UserPw.encrypt(farmerBean.getF_Pw());
				farmerBean.setF_Pw(encryPassword);
				
				dao.upPw(farmerBean);

			} catch (AddressException ae) {
				System.out.println("AddressException : " + ae.getMessage());
			} catch (MessagingException me) {
				System.out.println("MessagingException : " + me.getMessage());
			} catch (UnsupportedEncodingException e) {
				System.out.println("UnsupportedEncodingException : " + e.getMessage());
			}

			map.put("url", "/farmerLogin");
			map.put("error", true);
		}
		return map;
	}

	@RequestMapping(value = "/farmerUpdatePw", method = RequestMethod.POST)
	public String upPw(@RequestParam(value = "upId", defaultValue = "", required = false) String Id,
			FarmerBean farmerBean) {
		farmerBean.setF_Id(Id);
		FarmerDAO dao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		dao.upPw(farmerBean);

		return "farmer/FmLogin";
	}

	@RequestMapping(value = "/farmerLogout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();
		return "farmer/farmer";
	}

	@RequestMapping(value = "/farmerMypage")
	public String myInfo() {
		return "farmer/myPage";
	}

	@RequestMapping(value = "/farmerMyInfoUpdate")
	public String myInfoChange(FarmerBean farmerbean, HttpSession session, HttpServletRequest request) {

		farmerbean.setF_Addr(request.getParameter("Addr2") + request.getParameter("Addr3")
				+ request.getParameter("Addr4") + "(" + request.getParameter("Addr1") + ")");

		FarmerDAO dao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		dao.fUpdate(farmerbean);
		session.invalidate();
		return "redirect:/farmer";
	}

	@RequestMapping(value = "/farmerMyInfoDelete")
	public String myDelete(FarmerBean farmerbean, HttpSession session) {

		FarmerDAO dao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		dao.fDelete(farmerbean);

		session.invalidate();
		return "redirect:/farmerHome";
	}
	
	@RequestMapping(value = "/contact")
	public String contact() {
		return "board/contact";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.POST)
	public String contact(FarmerBean farmerBean) {
		return "board/contact";
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
