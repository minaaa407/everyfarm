package kr.co.everyfarm.user;

import java.io.IOException;
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

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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

import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class UserController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private KakaoAPI kakao;

	@Autowired
	private NaverLoginBO naverLoginBO;

	private String apiResult = null;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "home/home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String mlogin(Model model) {
		return "user/loginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String mlogin(MemberBean memberBean, HttpServletRequest request) {
		System.out.println("login:: post");

		HttpSession session = request.getSession();
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);

		System.out.println("첫번째:" + memberBean.getM_Pw());
		String encryPassword = UserPw.encrypt(memberBean.getM_Pw());
		memberBean.setM_Pw(encryPassword);
		System.out.println("두번째:" + memberBean.getM_Pw());

		MemberBean member = memberDAO.mlogin(memberBean);

		if (member != null) {
			session.setAttribute("member", member);
			return "redirect:/home";
		} else {
			return "redirect:/login";
		}
	}

	// 네이버 로그인
	@RequestMapping(value = "/user/callback", method = RequestMethod.GET)
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			MemberBean memberBean) throws IOException, ParseException {
		System.out.println("여기는 callback session : " + session);
		System.out.println("여기는 callback state : " + state);
		System.out.println("여기는 callback code : " + code);

		OAuth2AccessToken oauthToken;

		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		System.out.println("oauthToken쪽 : " + oauthToken);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String id = (String) response_obj.get("email");
		String name = (String) response_obj.get("name");
		String mobile = (String) response_obj.get("mobile");
		String bDay = (String) response_obj.get("birthday");
		String bYear = (String) response_obj.get("birthyear");
		String birth = bYear + "-" + bDay;
		mobile = mobile.replace("-", "");

		System.out.println("네이버 ID : " + id);
		System.out.println("이름 : " + name);
		System.out.println("모바일" + mobile);

		if (response_obj.get("id") != null) {
			// 4.파싱 닉네임 세션으로 저장
			System.out.println("4번 주석");
			session.setAttribute("m_Id", id); // 세션 생성
			session.setAttribute("m_Name", name);
			session.setAttribute("m_Tel", mobile);
			session.setAttribute("m_Birth", birth);

			model.addAttribute("result", apiResult);
			String m_Id = (String) session.getAttribute("m_Id");

			memberBean = dao.slogin(m_Id);
			model.addAttribute("memberBean", memberBean);

			if (memberBean == null) {
				return "redirect:/naverJoin";
			} else {
				session.setAttribute("member", memberBean);
				return "redirect:/home";
			}
		} else {
			return "/login";
		}
	}

	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String klogin(MemberBean memberBean, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam("code") String code) {

		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);

		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);

		if (userInfo.get("email") != null) {

			session.setAttribute("m_Id", userInfo.get("email"));
			session.setAttribute("m_Name", userInfo.get("nickname"));
			session.setAttribute("access_Token", access_Token);

			String m_Id = (String) session.getAttribute("m_Id");

			memberBean = dao.slogin(m_Id);
			model.addAttribute("memberBean", memberBean);

			if (memberBean == null) {
				return "redirect:/kakaoJoin";
			} else {
				session.setAttribute("member", memberBean);
				return "redirect:/home";
			}
		} else {
			return "user/loginForm";
		}
	}

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

		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		memberDAO.mjoin(memberBean);

		if (bindingResult.hasErrors()) {
			return "user/signUp";
		}
		return "home/home";
	}

	@RequestMapping(value = "/kakaoJoin", method = RequestMethod.GET)
	public String kakaoJoin(MemberBean memberBean, Model model, HttpSession session) {
		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);

		memberBean.setM_Id((String) session.getAttribute("m_Id"));
		memberBean.setM_Name((String) session.getAttribute("m_Name"));

		dao.kakaoJoin(memberBean);
		model.addAttribute(memberBean);
		session.setAttribute("member", memberBean);

		return "redirect:/home";
	}

	@RequestMapping(value = "/naverJoin", method = RequestMethod.GET)
	public String naverJoin(MemberBean member, Model model, HttpSession session) {

		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);

		member.setM_Id((String) session.getAttribute("m_Id"));
		member.setM_Name((String) session.getAttribute("m_Name"));
		member.setM_Tel((String) session.getAttribute("m_Tel"));
		member.setM_Birth((String) session.getAttribute("m_Birth"));

		dao.naverJoin(member);
		model.addAttribute(member);
		session.setAttribute("member", member);

		return "redirect:/home";

	}

	@RequestMapping(value = "/checkMail", method = RequestMethod.POST, produces = "application/json;")
	@ResponseBody
	public Map<String, Object> checkMail(MemberBean memberBean, HttpServletRequest request, EmailBean emailBean) {

		Map<String, Object> map = new HashMap<String, Object>();

		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.port", "587");

		Random random = new Random();
		int e_Num = random.nextInt(999999);

		Authenticator auth = new MailAuth();
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);

		String e_Id = memberBean.getM_Id();

		try {
			msg.setSentDate(new Date());

			msg.setFrom(new InternetAddress("alsdk9458@gmail.com", "EVERYFARM"));
			InternetAddress to = new InternetAddress(e_Id);
			msg.setRecipient(Message.RecipientType.TO, to);
			msg.setSubject("EVERYFARM", "UTF-8");
			msg.setText("안녕하세요 EVERY FARM에 방문해주셔서 감사합니다." + "\n\n이메일 인증번호는 " + e_Num + "입니다."
					+ "\n해당 인증번호를 인증번호 확인란에 기입해주십시오." + "\n감사합니다.", "UTF-8");

			Transport.send(msg);

			emailBean = new EmailBean(e_Id, e_Num);
			MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
			dao.mail(emailBean);

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

	@RequestMapping(value = "/mailNum", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mailNumber(EmailBean emailBean, MemberBean memberBean) {

		Map<String, Object> map = new HashMap<String, Object>();

		String e_Id = memberBean.getM_Id();
		int e_Num = emailBean.getE_Num();

		try {
			MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
			emailBean = new EmailBean(e_Id, e_Num);
			dao.mailNumber(emailBean);
			map.put("error", true);
		} catch (Exception e) {
			map.put("error", false);
		}
		return map;
	}

	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	@ResponseBody
	public String checkId(MemberBean memberBean) {

		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
		int result = dao.checkId(memberBean.getM_Id());

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

		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
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

		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
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
		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
		dao.upPw(memberBean);

		return "user/loginForm";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, MemberBean memberBean) {

		session.invalidate();
		
		return "home/home";
	}

	@RequestMapping(value = "/klogout", method = RequestMethod.GET)
	public String klogout(HttpSession session, MemberBean memberBean) {

		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("m_Id");

		return "home/home";
	}

	@RequestMapping(value = "/nlogout", method = RequestMethod.GET)
	public String nlogout(HttpSession session, MemberBean memberBean) {

		session.removeAttribute(apiResult);
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

		String encryPassword = UserPw.encrypt(memberbean.getM_Pw());
		memberbean.setM_Pw(encryPassword);

		MemberDAO memDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		memDao.mUpdate(memberbean);
		System.out.println(memberbean);

		session.invalidate();
		return "redirect:/home";
	}

	@RequestMapping(value = "/myInfoDelete")
	public String myDelete(MemberBean memberbean, HttpSession session) {

		MemberDAO memDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		System.out.println(memberbean.getM_Id());
		memDao.mDelete(memberbean);

		session.invalidate();
		return "redirect:/home";
	}

	@RequestMapping(value = "/myInfoPwdUpdate")
	public String myInfoChange1(MemberBean memberbean, HttpSession session, HttpServletRequest request) {

		String encryPassword = UserPw.encrypt(memberbean.getM_Pw());
		memberbean.setM_Pw(encryPassword);

		MemberDAO memDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		memDao.mPwdUp(memberbean);
		System.out.println(memberbean);

		session.invalidate();
		return "redirect:/home";
	}

	@RequestMapping(value = "/myInfoAddrUpdate")
	public String myInfoChange2(MemberBean memberbean, HttpSession session, HttpServletRequest request) {

		memberbean.setM_Addr(request.getParameter("Addr2") + request.getParameter("Addr3")
				+ request.getParameter("Addr4") + "(" + request.getParameter("Addr1") + ")");

		MemberDAO memDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		memDao.mAddrUpdate(memberbean);
		System.out.println(memberbean);

		session.invalidate();
		return "redirect:/home";
	}

	@RequestMapping(value = "/myInfoNameUpdate")
	public String myInfoChange3(MemberBean memberbean, HttpSession session, HttpServletRequest request) {

		MemberDAO memDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		memDao.mNameUpdate(memberbean);
		System.out.println(memberbean);

		session.invalidate();
		return "redirect:/home";
	}

}
