package kr.co.everyfarm.user;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.Authenticator.RequestorType;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import kr.co.everyfarm.board.Paging;
import kr.co.everyfarm.board.ReviewBean;
import kr.co.everyfarm.board.ReviewDAO;
import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.farmer.FarmerDAO;
import kr.co.everyfarm.payment.PaymentBean;
import kr.co.everyfarm.payment.PaymentDAO;
import kr.co.everyfarm.product.ProductBean;
import kr.co.everyfarm.product.ProductDao;

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
	public String home(Model model, ProductBean product, FarmerBean farmerBean, ReviewBean review, PaymentBean pay) {
		
		

		ProductDao prodao = sqlSessionTemplate.getMapper(ProductDao.class);
		List<ProductBean> proView = prodao.viewList();
		model.addAttribute("proView", proView);

		ReviewDAO revdao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		List<ReviewBean> revView = revdao.reviewList();
		model.addAttribute("revView", revView);

		PaymentDAO paydao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		List<PaymentBean> payView = paydao.seedList();
		model.addAttribute("payView", payView);

		FarmerDAO farDAO = sqlSessionTemplate.getMapper(FarmerDAO.class);
		List<PaymentBean> farView = farDAO.forbestItem();
		String no1 = farView.get(0).getP_Id();
		int Pay_no1 = farView.get(0).getPay_No(); // 1 ???
		int Pay_no2 = farView.get(1).getPay_No(); // 2 ???
		int Pay_no3 = farView.get(2).getPay_No(); // 3 ???
		model.addAttribute("farView1", farDAO.bestItem(Pay_no1));
		model.addAttribute("farView2", farDAO.bestItem(Pay_no2));
		model.addAttribute("farView3", farDAO.bestItem(Pay_no3));
		
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

		System.out.println("?????????:" + memberBean.getM_Pw());
		String encryPassword = UserPw.encrypt(memberBean.getM_Pw());
		memberBean.setM_Pw(encryPassword);
		System.out.println("?????????:" + memberBean.getM_Pw());

		MemberBean member = memberDAO.mlogin(memberBean);

		if (member != null) {
			session.setAttribute("member", member);
			return "redirect:/home";
		} else {
			return "redirect:/login";
		}
	}

	// ????????? ?????????
	@RequestMapping(value = "/user/callback", method = RequestMethod.GET)
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			MemberBean memberBean) throws IOException, ParseException {
		System.out.println("????????? callback session : " + session);
		System.out.println("????????? callback state : " + state);
		System.out.println("????????? callback code : " + code);

		OAuth2AccessToken oauthToken;

		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		System.out.println("oauthToken??? : " + oauthToken);
		// 1. ????????? ????????? ????????? ????????????.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String????????? json?????????

		// 2. String????????? apiResult??? json????????? ??????
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);

		// 3. ????????? ??????
		// Top?????? ?????? _response ??????
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response??? nickname??? ??????
		String id = (String) response_obj.get("email");
		String name = (String) response_obj.get("name");
		String mobile = (String) response_obj.get("mobile");
		String bDay = (String) response_obj.get("birthday");
		String bYear = (String) response_obj.get("birthyear");
		String birth = bYear + "-" + bDay;
		mobile = mobile.replace("-", "");

		System.out.println("????????? ID : " + id);
		System.out.println("?????? : " + name);
		System.out.println("?????????" + mobile);

		if (response_obj.get("id") != null) {
			// 4.?????? ????????? ???????????? ??????
			System.out.println("4??? ??????");
			session.setAttribute("m_Id", id); // ?????? ??????
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

		System.out.println("?????????:" + memberBean.getM_Pw());
		String encryPassword = UserPw.encrypt(memberBean.getM_Pw());
		memberBean.setM_Pw(encryPassword);
		System.out.println("?????????:" + memberBean.getM_Pw());

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
			msg.setText("??????????????? EVERY FARM??? ?????????????????? ???????????????." + "\n\n????????? ??????????????? " + e_Num + "?????????."
					+ "\n?????? ??????????????? ???????????? ???????????? ?????????????????????." + "\n???????????????.", "UTF-8");

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
			return "fail"; // ?????? ???????????? ??????
		} else {
			return "success"; // ?????? ????????? x
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
				msg.setText("??????????????? EVERY FARM??? ?????????????????? ???????????????." + "\n\n" + memberBean.getM_Id() + "???????????? ?????? ??????????????? "
						+ memberBean.getM_Pw() + "?????????." + "\n?????? ??????????????? ????????? ??? ????????? ???????????? ????????? ???????????? ????????????." + "\n???????????????.",
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

		return "redirect:/home";
	}

	@RequestMapping(value = "/klogout", method = RequestMethod.GET)
	public String klogout(HttpSession session, MemberBean memberBean) {

		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("m_Id");

		return "redirect:/home";
	}

	@RequestMapping(value = "/nlogout", method = RequestMethod.GET)
	public String nlogout(HttpSession session, MemberBean memberBean) {

		session.removeAttribute(apiResult);
		session.invalidate();

		return "redirect:/home";
	}

	@RequestMapping(value = "/mypage")
	public String myInfo(PaymentBean paymentBean, HttpSession session,Paging paging,Model model) {
		PaymentDAO payDAO = sqlSessionTemplate.getMapper(PaymentDAO.class);
		MemberBean mBean = (MemberBean) session.getAttribute("member");
		String m_Id = mBean.getM_Id();
		paging.setM_Id(m_Id);
		
		PaymentBean forDel = payDAO.mypaylist(paging);
		SimpleDateFormat test = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		cal.add(Calendar.YEAR, -1);
		if(forDel == null) {
			model.addAttribute("payDay", test.format(cal.getTime()));
			
		}else if (forDel != null) {
			model.addAttribute("payDay",test.format(forDel.getPay_Date()));
		}
		
		model.addAttribute("now", test.format(now));
		return "user/myPage";
	}

	@RequestMapping(value = "/myInfoUpdate")
	public String myInfoChange(MemberBean memberbean, HttpSession session, HttpServletRequest request) {

		memberbean.setM_Addr(request.getParameter("Addr2") + ", " + request.getParameter("Addr3")
				+ request.getParameter("Addr4") + "(" + request.getParameter("Addr1") + ")");

		String encryPassword = UserPw.encrypt(memberbean.getM_Pw());
		memberbean.setM_Pw(encryPassword);

		MemberDAO memDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		memDao.mUpdate(memberbean);

		return "redirect:/home";
	}

	@RequestMapping(value = "/myInfoDelete", method = RequestMethod.POST)
	public String myDelete(MemberBean memberbean, HttpSession session) {
		MemberDAO memDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		
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

		return "redirect:/mypage";
	}

	@RequestMapping(value = "/myInfoAddrUpdate")
	public String myInfoChange2(MemberBean memberbean, HttpSession session, HttpServletRequest request) {

		memberbean.setM_Addr(request.getParameter("Addr2") + ", " + request.getParameter("Addr3")
				+ request.getParameter("Addr4") + "(" + request.getParameter("Addr1") + ")");

		MemberDAO memDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		memDao.mAddrUpdate(memberbean);
		MemberBean oldmember = (MemberBean)session.getAttribute("member");
		oldmember.setM_Addr(memberbean.getM_Addr());
		session.setAttribute("member",oldmember);

		return "redirect:/mypage";
	}

	@RequestMapping(value = "/myInfoNameUpdate")
	public String myInfoChange3(MemberBean memberbean, HttpSession session, HttpServletRequest request) {

		MemberDAO memDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		memberbean.setM_Name(request.getParameter("m_Name"));
		memDao.mNameUpdate(memberbean);
		MemberBean oldmember = (MemberBean)session.getAttribute("member");
		oldmember.setM_Name(memberbean.getM_Name());
		session.setAttribute("member",oldmember);

		return "redirect:/mypage";
	}
	
	@RequestMapping(value = "/myInfoTelUpdate")
	public String myInfoTel(MemberBean memberBean, HttpSession session, HttpServletRequest request) {
		MemberDAO memDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		memberBean.setM_Tel(request.getParameter("m_Tel"));
		MemberBean oldmember = (MemberBean)session.getAttribute("member");
		oldmember.setM_Tel(memberBean.getM_Tel());
		session.setAttribute("member",oldmember);
		
		memDao.mTelUp(memberBean);
		return "redirect:/mypage";
	}

}
