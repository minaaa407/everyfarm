package kr.co.everyfarm.farmer;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.stream.Collectors;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.everyfarm.board.PageMaker;
import kr.co.everyfarm.board.Paging;
import kr.co.everyfarm.board.ReviewBean;
import kr.co.everyfarm.payment.PaymentBean;
import kr.co.everyfarm.product.ProductDao;
import kr.co.everyfarm.product.ProductqnaBean;
import kr.co.everyfarm.user.EmailBean;
import kr.co.everyfarm.user.MailAuth;
import kr.co.everyfarm.user.UserPw;

@Controller
public class FarmerController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@RequestMapping(value = "/farmer", method = RequestMethod.GET)
	public String farmer(Model model, FarmerBean farmerBean, HttpServletRequest request, HttpServletResponse response) {
		  HttpSession session = request.getSession();
	      FarmerDAO farmerDAO = sqlSessionTemplate.getMapper(FarmerDAO.class);
	      FarmerBean farmer = (FarmerBean) session.getAttribute("farmer");
	      

	      /* ?????? ??????. ??????????????? Model ??????????????? */
	      List<String> seedList = Arrays.asList(new String[] { "??????", "?????????", "???", "??????", "??????", "??????", "??????", "?????????", "??????",
	            "??????", "??????", "???", "??????", "???", "??????" });
	      List<PaymentBean> pno = farmerDAO.searchPno(farmer);
	      PaymentBean search = new PaymentBean();
	      PaymentBean oneSeedSum = new PaymentBean();
	      List<PaymentBean> totalSeedSum = new ArrayList<PaymentBean>();
	      String seed = "";
	      int seedSum = 0;

	      for (int i = 0; i < seedList.size(); i++) {
	         for (int j = 0; j < pno.size(); j++) {
	            search.setPay_Seed(seedList.get(i));
	            search.setPay_No(pno.get(j).getPay_No());
	            oneSeedSum = farmerDAO.seedSum(search);
	            seedSum += oneSeedSum.getPay_Land();
	            if (!(oneSeedSum.getPay_Land() == 0)) {
	               seed = oneSeedSum.getPay_Seed();
	            }
	         }
	         oneSeedSum.setPay_Seed('"' + seed + '"');
	         oneSeedSum.setPay_Land(seedSum);
	         totalSeedSum.add(oneSeedSum);
	         seed = "";
	         seedSum = 0;
	      }

	      totalSeedSum = totalSeedSum.stream().sorted(Comparator.comparing(PaymentBean::getPay_Land).reversed())
	            .collect(Collectors.toList());
	      List<String> seedName = new ArrayList<String>();
	      List<Integer> seedSumTotal = new ArrayList<Integer>();

	      for (int i = 0; i < seedList.size(); i++) {
	         seedName.add(totalSeedSum.get(i).getPay_Seed());
	         seedSumTotal.add(totalSeedSum.get(i).getPay_Land());
	      }
		 //?????? ??????
		    ProductDao productdao = sqlSessionTemplate.getMapper(ProductDao.class);
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);	
		    String farmerid = farmer.getF_Id();
		    String[] months = {"January","february","march","april","may","june","july"
		    		,"august","september","october","november","december"};
			int[] payment = new int[12];
			int[] payment1 = new int[12];
			int[] payment2 = new int[12];
		    for(int i =0; i < months.length; i++) {
			    HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("farmerid", farmerid);
				map.put("Month", months[i]);
				map.put("year", year);
				payment[i] = productdao.productpaymentchart(map);
		    }
		    model.addAttribute("payment",payment);
		    
		    for(int i =0; i < months.length; i++) {
			    HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("farmerid", farmerid);
				map.put("Month", months[i]);
				map.put("year", year-1);
				payment1[i] = productdao.productpaymentchart(map);
		    }
		    model.addAttribute("payment1pre",payment1);
		    
		    for(int i =0; i < months.length; i++) {
			    HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("farmerid", farmerid);
				map.put("Month", months[i]);
				map.put("year", year-2);
				payment2[i] = productdao.productpaymentchart(map);
		    }
		    model.addAttribute("payment2pre",payment2);
		    model.addAttribute("seedName", seedName);
			model.addAttribute("seedSumTotal", seedSumTotal);
		
		return "farmer/farmer";
	}

	@RequestMapping(value = "/farmerLogin", method = RequestMethod.GET)
	public String flogin() {
		return "farmer/FmLogin";
	}

	@RequestMapping(value = "/farmerLogin", method = RequestMethod.POST)
	public String flogin(Model model, FarmerBean farmerBean, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		  HttpSession session = request.getSession();
	      FarmerDAO farmerDAO = sqlSessionTemplate.getMapper(FarmerDAO.class);

	      System.out.println("?????????:" + farmerBean.getF_Pw());
	      String encryPassword = UserPw.encrypt(farmerBean.getF_Pw());
	      farmerBean.setF_Pw(encryPassword);
	      System.out.println("?????????:" + farmerBean.getF_Pw());

	      FarmerBean farmer = farmerDAO.flogin(farmerBean);

		if (farmer != null) {
			if (farmer.getF_Sign().equals("N")) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('???????????? ?????? ????????? ??????????????????. ????????? ??????????????????.'); history.back();</script>");
				out.flush();
				return null;
			} else {
				session.setAttribute("farmer", farmer);
				return "redirect:/farmer";
			}
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('????????? ?????? ??????????????? ???????????? ????????????. ?????? ??????????????????.'); history.back();</script>");
			out.flush();
			return null;
		}
	}

	@RequestMapping(value = "/farmerSign", method = RequestMethod.GET)
	public String sign(Model model) {
		model.addAttribute("farmerBean", new FarmerBean());
		return "farmer/signUp";
	}

	@RequestMapping(value = "/farmerSign", method = RequestMethod.POST)
	public String sign(FarmerBean farmerBean, @RequestParam(value = "f_Auth2", required = false) MultipartFile file,
			HttpServletRequest request) {

		farmerBean.setF_Sign("N");
		farmerBean.setF_Addr(request.getParameter("Addr2") + request.getParameter("Addr3")
				+ request.getParameter("Addr4") + "(" + request.getParameter("Addr1") + ")");

		System.out.println("?????????:" + farmerBean.getF_Pw());
		String encryPassword = UserPw.encrypt(farmerBean.getF_Pw());
		farmerBean.setF_Pw(encryPassword);
		System.out.println("?????????:" + farmerBean.getF_Pw());
		System.out.println(file.getOriginalFilename() + "?????? ??????");
		farmerBean.setF_Auth(file.getOriginalFilename());

		FarmerDAO farmerDAO = sqlSessionTemplate.getMapper(FarmerDAO.class);
		farmerDAO.fjoin(farmerBean);

		String fId = farmerBean.getF_Id();

		HttpSession session = request.getSession();
		String root_path = session.getServletContext().getRealPath("/");

		String path = root_path + "resources/upload/farmer/" + fId + "/";
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath = servletContext.getRealPath("/resources");

		String savePath = realPath + "/upload/farmer/" + fId + "/";
		path = savePath;

		Cookie[] cookie = request.getCookies();
		for (int i = 0; i < cookie.length; i++) {
			cookie[i].setMaxAge(0);
		}

		File Folder = new File(path);
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // ?????? ???????????????.
				System.out.println("farmer ????????? ?????????????????????.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			System.out.println("?????? ????????? ???????????? ????????????.");
		}
		String safeFile;
		String originFileName;
		long fileSize;
		originFileName = file.getOriginalFilename(); // ?????? ?????? ???
		fileSize = file.getSize(); // ?????? ?????????
		safeFile = path + originFileName;
		System.out.println(safeFile + "?????? ?????? ??????.");
		try {
			// ab[i].transferTo(new File(safeFile));
			if (fileSize > 100) {
				file.transferTo(new File(safeFile));
			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "farmer/FmLogin";
	}

	@RequestMapping(value = "/farmerCheckMail", method = RequestMethod.POST, produces = "application/json;")
	@ResponseBody
	public Map<String, Object> farmerCheckMail(FarmerBean farmerBean, HttpServletRequest request, EmailBean emailBean) {

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

		String e_Id = farmerBean.getF_Id();

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
			FarmerDAO dao = sqlSessionTemplate.getMapper(FarmerDAO.class);
			dao.mail(emailBean);

			map.put("error", true);

		} catch (AddressException ae) {
			map.put("error", false);
		} catch (MessagingException me) {
			map.put("error", false);
		} catch (UnsupportedEncodingException e) {
			map.put("error", false);
		}
		return map;
	}

	@RequestMapping(value = "/farmerMailNum", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mailNumber(EmailBean emailBean, FarmerBean farmerBean) {

		Map<String, Object> map = new HashMap<String, Object>();

		String e_Id = farmerBean.getF_Id();
		int e_Num = emailBean.getE_Num();

		try {
			FarmerDAO dao = sqlSessionTemplate.getMapper(FarmerDAO.class);
			emailBean = new EmailBean(e_Id, e_Num);
			dao.mailNumber(emailBean);
			map.put("error", true);
		} catch (Exception e) {
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
			return "fail"; // ?????? ???????????? ??????
		} else {
			return "success"; // ?????? ????????? x
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
				msg.setText("??????????????? EVERY FARM??? ?????????????????? ???????????????." + "\n\n" + farmerBean.getF_Id() + "???????????? ?????? ??????????????? "
						+ farmerBean.getF_Pw() + "?????????." + "\n?????? ??????????????? ????????? ??? ????????? ???????????? ????????? ???????????? ????????????." + "\n???????????????.",
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
		return "redirect:/farmerLogin";
	}

	@RequestMapping(value = "/farmerMypage")
	public String farmer(Model model, HttpSession session, Paging paging) {
		FarmerBean farmer = (FarmerBean) session.getAttribute("farmer");
		String f_Id = farmer.getF_Id();

		FarmerDAO fDAO = sqlSessionTemplate.getMapper(FarmerDAO.class);
		paging.setF_Id(f_Id);

		PaymentBean myCus = fDAO.fDelDate(paging);
		SimpleDateFormat test = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		System.out.println(test.format(myCus.getPay_Date()));
		System.out.println(test.format(now));
		if (myCus == null) {
			model.addAttribute("myCus",test.format(now));
		}else if (myCus != null ){
			model.addAttribute("myCus", test.format(myCus.getPay_Date()));
			model.addAttribute("nowMonth",test.format(now));
		}
		return "farmer/myPage";
	}

	@RequestMapping(value = "/myCustomer")
	public String myCus(PaymentBean paymentBean, Model model, HttpSession session, FarmerBean farmerBean,
			Paging paging) {

		FarmerBean farmer = (FarmerBean) session.getAttribute("farmer");
		String f_Id = farmer.getF_Id();

		FarmerDAO fDAO = sqlSessionTemplate.getMapper(FarmerDAO.class);
		paging.setF_Id(f_Id);

		int total = fDAO.myOrderCount(paging);
		List<PaymentBean> myCus = fDAO.paging(paging);

		PageMaker pageMake = new PageMaker(paging, total);

		model.addAttribute("myCus", myCus);
		model.addAttribute("pageMaker", pageMake);

		return "farmer/myCustomer";
	}

	@RequestMapping(value = "/farmerReply") // ?????? ??????
	public String getMyCont1(Model model, HttpSession session) {

		FarmerBean fBean = (FarmerBean) session.getAttribute("farmer");
		String f_Id = fBean.getF_Id();

		FarmerDAO dao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		List<ReviewBean> list = dao.myReply(f_Id);
		model.addAttribute("repList", list);

		return "farmer/myReply";
	}

	@RequestMapping(value = "/farmerProcutCont") // ?????? ??????
	public String getMyCont2(Model model, HttpSession session) {

		FarmerBean fBean = (FarmerBean) session.getAttribute("farmer");
		String f_Id = fBean.getF_Id();

		FarmerDAO dao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		List<ProductqnaBean> pList = dao.myProdcutReply(f_Id);
		model.addAttribute("productReply", pList);

		return "farmer/myProductReply";
	}

	@RequestMapping(value = "/farmerDelete")
	public String myDelete(FarmerBean farmerbean, HttpSession session) {
		FarmerDAO dao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		FarmerBean fBean = (FarmerBean) session.getAttribute("farmer");
		String f_Id = fBean.getF_Id();		
		dao.fDelete(f_Id);

		session.invalidate();
		return "redirect:/farmer";
	}

	@RequestMapping(value = "/farmerPwdUpdate")
	public String farmerChange1(FarmerBean farmerBean, HttpSession session, HttpServletRequest request) {

		String encryPassword = UserPw.encrypt(farmerBean.getF_Pw());
		farmerBean.setF_Pw(encryPassword);

		FarmerDAO Dao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		Dao.upPwFar(farmerBean);

		return "redirect:/farmerMypage";
	}

	@RequestMapping(value = "/farmerAddrUpdate")
	public String farmerChange2(FarmerBean farmerBean, HttpSession session, HttpServletRequest request) {

		farmerBean.setF_Addr(request.getParameter("Addr2") + request.getParameter("Addr3")
				+ request.getParameter("Addr4") + "(" + request.getParameter("Addr1") + ")");

		FarmerDAO memDao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		memDao.upAddr(farmerBean);
		FarmerBean fBean = (FarmerBean) session.getAttribute("farmer");
		fBean.setF_Addr(farmerBean.getF_Addr());
		session.setAttribute("farmer", fBean);
		
		return "redirect:/farmerMypage";
	}

	@RequestMapping(value = "/farmerInfoNameUpdate")
	public String farmerChange3(FarmerBean farmerBean, HttpSession session, HttpServletRequest request) {

		FarmerDAO memDao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		memDao.upName(farmerBean);
		FarmerBean fBean = (FarmerBean) session.getAttribute("farmer");
		fBean.setF_Name(farmerBean.getF_Name());
		session.setAttribute("farmer", fBean);
		
		return "redirect:/farmerMypage";
	}

	@RequestMapping(value = "/farmerInfoTelUpdate")
	public String myInfoChange4(FarmerBean farmerBean, HttpSession session, HttpServletRequest request) {

		FarmerDAO memDao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		memDao.upTel(farmerBean);
		FarmerBean fBean = (FarmerBean) session.getAttribute("farmer");
		fBean.setF_Tel(farmerBean.getF_Tel());
		session.setAttribute("farmer", fBean);
		return "redirect:/farmerMypage";
	}

}
