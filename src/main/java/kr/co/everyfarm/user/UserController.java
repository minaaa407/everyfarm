package kr.co.everyfarm.user;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private KakaoAPI kakao;

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
	
	@RequestMapping(value = "/kakao_login", method = RequestMethod.GET)
	@ResponseBody
	public String klogin(MemberBean memberBean, Model model, HttpServletRequest request, @RequestParam("code") String code) {
		System.out.println("kakaologin:: get");
		
		HttpSession session = request.getSession();
		model.addAttribute("memberBean", memberBean);
		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
		
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> kakaoInfo = kakao.getUserInfo(access_Token);
		
		if(kakaoInfo.get("email") != null) {
			session.setAttribute("loginPI", "kakao");
			session.setAttribute("m_Id", kakaoInfo.get("email"));
			session.setAttribute("m_Name", kakaoInfo.get("nickname"));
			session.setAttribute("access_Token", access_Token);
		}

		MemberBean member = userDAO.mlogin(memberBean);

		if (member != null) {
			session.setAttribute("member", member);
			return "redirect:/home";
		} else {
			return "redirect:/sign";
		}
	}

	/*
	 * @RequestMapping(value = "/google_login", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String loginMemberByGoogle(MemberBean memberBean,
	 * FarmerBean farmerBean, HttpServletRequest request, HttpSession session,
	 * RedirectAttributes rttr) {
	 * 
	 * UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class); MemberBean mem
	 * = userDAO.loginMemberByGoogle(memberBean); String mvo_ajaxid =
	 * memberBean.getM_Id();
	 * 
	 * if (mem == null) { // 아이디가 DB에 존재하지 않는 경우 // 구글 회원가입
	 * userDAO.joinMemberByGoogle(memberBean);
	 * 
	 * // 구글 로그인 mem = userDAO.loginMemberByGoogle(memberBean);
	 * session.setAttribute("m_Id", mem.getM_Id()); rttr.addFlashAttribute("mbean",
	 * mem); }
	 * 
	 * if (mvo_ajaxid.equals(mem.getM_Id())) { // 아이디가 DB에 존재하는 경우 // 구글 로그인
	 * userDAO.loginMemberByGoogle(memberBean); session.setAttribute("m_Id",
	 * mem.getM_Id()); rttr.addFlashAttribute("mbean", mem); } else {// 아이디가 DB에
	 * 존재하지 않는 경우 // 구글 회원가입 userDAO.joinMemberByGoogle(memberBean);
	 * 
	 * // 구글 로그인 mem = userDAO.loginMemberByGoogle(memberBean);
	 * session.setAttribute("m_Id", mem.getM_Id()); rttr.addFlashAttribute("mbean",
	 * mem); }
	 * 
	 * return "redirect:/home"; }
	 */

	@RequestMapping(value = "/sign", method = RequestMethod.GET)
	public String sign(Model model) {
		model.addAttribute("memberBean", new MemberBean());
		return "user/signUp";
	}

	@RequestMapping(value = "/sign", method = RequestMethod.POST)
	public String sign(@Valid MemberBean memberBean, BindingResult bindingResult, HttpServletRequest request) {

		memberBean.setM_Addr(request.getParameter("Addr2") + request.getParameter("Addr3")
				+ request.getParameter("Addr4") + "(" + request.getParameter("Addr1") + ")");

		System.out.println("첫번째:" + memberBean.getM_Pw());
		String encryPassword = UserPw.encrypt(memberBean.getM_Pw());
		memberBean.setM_Pw(encryPassword);
		System.out.println("두번째:" + memberBean.getM_Pw());

		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
		userDAO.mjoin(memberBean);

		if (bindingResult.hasErrors()) {
			return "user/signUp";
		}

		return "home/home";
	}

	@RequestMapping(value = "/checkMail", method = RequestMethod.POST, produces = "application/json;")
	@ResponseBody
	public Map<String, Object> checkMail(MemberBean memberBean, HttpServletRequest request) {

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
			InternetAddress to = new InternetAddress(memberBean.getM_Id());
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

	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(MemberBean memberBean) {

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		int result = dao.checkId(memberBean);

		if (result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success"; // 중복 아이디 x
		}
	}

	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() {
		return "/user/findId";
	}

	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findId(@ModelAttribute MemberBean memberBean) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		MemberBean mem = dao.findId(memberBean);

		System.out.println(mem);
		
		if (mem == null) {
			map.put("url", "/findId");
			map.put("error", false);
		} else {
			map.put("url", "/login");
			map.put("memId", mem.getM_Id());
			map.put("error", true);
		}
		
		return map;
	}

	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPw() {
		return "/user/findPw";
	}

	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findPw(@ModelAttribute MemberBean memberBean, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		MemberBean mem = dao.findPw(memberBean);

		if (mem == null) {
			map.put("url", "findPw");
			map.put("error", false);
		} else {
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}

			memberBean.setM_Pw(pw);

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
				InternetAddress to = new InternetAddress(memberBean.getM_Id());
				msg.setRecipient(Message.RecipientType.TO, to);
				msg.setSubject("EVERYFARM", "UTF-8");
				msg.setText("안녕하세요 EVERY FARM에 방문해주셔서 감사합니다." + "\n\n" + memberBean.getM_Id() + "고객님의 임시 비밀번호는 "
						+ memberBean.getM_Pw() + "입니다." + "\n해당 비밀번호로 로그인 후 반드시 비밀번호 변경을 해주시기 바랍니다." + "\n감사합니다.",
						"UTF-8");

				Transport.send(msg);
				
				String encryPassword = UserPw.encrypt(memberBean.getM_Pw());
				memberBean.setM_Pw(encryPassword);
				
				dao.upPw(memberBean);

			} catch (AddressException ae) {
				System.out.println("AddressException : " + ae.getMessage());
			} catch (MessagingException me) {
				System.out.println("MessagingException : " + me.getMessage());
			} catch (UnsupportedEncodingException e) {
				System.out.println("UnsupportedEncodingException : " + e.getMessage());
			}

			map.put("url", "/login");
			map.put("error", true);
		}
		return map;
	}

	@RequestMapping(value = "/updatePw", method = RequestMethod.POST)
	public String upPw(@RequestParam(value = "upId", defaultValue = "", required = false) String Id,
			MemberBean memberBean) {
		memberBean.setM_Id(Id);
		System.out.println(memberBean);
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		dao.upPw(memberBean);

		return "user/loginForm";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "home/home";
	}

	@RequestMapping(value = "/mypage")
	public String myInfo() {
		return "user/myPage";
	}

	@RequestMapping(value = "/myInfoUpdate")
	public String myInfoChange(MemberBean memberbean, HttpSession session, HttpServletRequest request) {

		memberbean.setM_Addr(request.getParameter("Addr2") + request.getParameter("Addr3")
				+ request.getParameter("Addr4") + "(" + request.getParameter("Addr1") + ")");

		UserDAO memDao = sqlSessionTemplate.getMapper(UserDAO.class);
		memDao.mUpdate(memberbean);
		System.out.println(memberbean);

		session.invalidate();
		return "redirect:/home";
	}

	@RequestMapping(value = "/myInfoDelete")
	public String myDelete(MemberBean memberbean, HttpSession session) {

		UserDAO memDao = sqlSessionTemplate.getMapper(UserDAO.class);
		System.out.println(memberbean.getM_Id());
		memDao.mDelete(memberbean);

		session.invalidate();
		return "redirect:/home";
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
