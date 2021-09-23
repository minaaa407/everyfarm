package kr.co.everyfarm.admin;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.everyfarm.board.PageMaker;
import kr.co.everyfarm.board.Paging;
import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.farmer.FarmerDAO;
import kr.co.everyfarm.payment.PaymentDAO;
import kr.co.everyfarm.product.ProductDao;
import kr.co.everyfarm.user.MailAuth;
import kr.co.everyfarm.user.MemberBean;
import kr.co.everyfarm.user.MemberDAO;
import kr.co.everyfarm.user.UserPw;

@Controller
public class AdminController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	   public String admin(Model model, FarmerBean farmerBean, MemberBean memberBean) {
		  
		  PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
	      AdminDAO adDAO = sqlSessionTemplate.getMapper(AdminDAO.class);


		int mmonth = 0;
		int fmonth = 0;


	      List<Integer> mMonth = new ArrayList<Integer>();
	      List<Integer> fMonth = new ArrayList<Integer>();


		for (int i = 0; i < 12; i++) {
			mmonth = adDAO.mchart(i);
			
			mMonth.add(mmonth);
		}

	      System.out.println("---- 씨앗 차트 시작 ----");
	      
	      DecimalFormat dfmonth = new DecimalFormat("00");
			DecimalFormat dfyear = new DecimalFormat("0000"); 
	        Calendar cal = Calendar.getInstance();
	        String year  = dfyear.format(cal.get(Calendar.YEAR));
	        String date  = dfmonth.format(cal.get(Calendar.MONTH) + 1);
	        String monthago1  = dfmonth.format(cal.get(Calendar.MONTH));
	        String monthago2  = dfmonth.format(cal.get(Calendar.MONTH) - 1);
	        String monthago3  = dfmonth.format(cal.get(Calendar.MONTH) - 2);
	        String monthago4  = dfmonth.format(cal.get(Calendar.MONTH) - 3);
	        String monthago5  = dfmonth.format(cal.get(Calendar.MONTH) - 4);
	        String monthago6  = dfmonth.format(cal.get(Calendar.MONTH) - 5);
	        String monthago7  = dfmonth.format(cal.get(Calendar.MONTH) - 6);
	        String monthago8  = dfmonth.format(cal.get(Calendar.MONTH) - 7);
	        
	        
	        System.out.println("현재 년 = " + year);
	        System.out.println("현재 월 = " + date);
			System.out.println("1달 전 = " + monthago1);
			System.out.println("2달 전 = " + monthago2);
			System.out.println("3달 전 = " + monthago3);
			System.out.println("4달 전 = " + monthago4);
			System.out.println("5달 전 = " + monthago5);
			System.out.println("6달 전 = " + monthago6);
			System.out.println("7달 전 = " + monthago7);
			System.out.println("8달 전 = " + monthago8);
	        
			model.addAttribute("year",year);
			model.addAttribute("date",date);
			model.addAttribute("monthago1",monthago1);
			model.addAttribute("monthago2",monthago2);
			model.addAttribute("monthago3",monthago3);
			model.addAttribute("monthago4",monthago4);
			model.addAttribute("monthago5",monthago5);
			model.addAttribute("monthago6",monthago6);
			model.addAttribute("monthago7",monthago7);
			model.addAttribute("monthago8",monthago8);
			
			Integer countA = dao.countA(date); System.out.println(countA); int countAA = 0;
			if(countA != null) { countAA = dao.countA(date); }
			Integer countB = dao.countB(date); System.out.println(countB); int countBB = 0;
			if(countB != null) { countBB = dao.countB(date); }
			Integer countC = dao.countC(date); System.out.println(countC); int countCC = 0;
			if(countC != null) { countCC = dao.countC(date); }
			Integer countD = dao.countD(date); System.out.println(countD); int countDD = 0;
			if(countD != null) { countDD = dao.countD(date); }
			Integer countE = dao.countE(date); System.out.println(countE); int countEE = 0;
			if(countE != null) { countEE = dao.countE(date); }
			Integer countF = dao.countF(date); System.out.println(countF); int countFF = 0;
			if(countF != null) { countFF = dao.countF(date); }
			Integer countG = dao.countG(date); System.out.println(countG); int countGG = 0;
			if(countG != null) { countGG = dao.countG(date); }
			Integer countH = dao.countH(date); System.out.println(countH); int countHH = 0;
			if(countH != null) { countHH = dao.countH(date); }
			Integer countI = dao.countI(date); System.out.println(countI); int countII = 0;
			if(countI != null) { countII = dao.countI(date); }
			Integer countJ = dao.countJ(date); System.out.println(countJ); int countJJ = 0;
			if(countJ != null) { countJJ = dao.countJ(date); }
			Integer countK = dao.countK(date); System.out.println(countK); int countKK = 0; 
			if(countK != null) { countKK = dao.countK(date); }
			Integer countL = dao.countL(date); System.out.println(countL); int countLL = 0;
			if(countL != null) { countLL = dao.countL(date); }
			Integer countM = dao.countM(date); System.out.println(countM); int countMM = 0;
			if(countM != null) { countMM = dao.countM(date); }
			Integer countN = dao.countN(date); System.out.println(countN); int countNN = 0;
			if(countN != null) { countNN = dao.countN(date); }
			Integer countO = dao.countO(date); System.out.println(countO); int countOO = 0;
			if(countO != null) { countOO = dao.countO(date); }
			
	       
			int[] array = {countAA,countBB,countCC,countDD,countEE,
						   countFF,countGG,countHH,countII,countJJ,
						   countKK,countLL,countMM,countNN,countOO};	
			
			System.out.println("A = " + countAA);
			
			for (int i = 0; i < array.length; i++) {
				model.addAttribute("array0", array[0]);
				model.addAttribute("array1", array[1]);
				model.addAttribute("array2", array[2]);
				model.addAttribute("array3", array[3]);
				model.addAttribute("array4", array[4]);	
				model.addAttribute("array5", array[5]);	
				model.addAttribute("array6", array[6]);	
				model.addAttribute("array7", array[7]);	
				model.addAttribute("array8", array[8]);	
				model.addAttribute("array9", array[9]);	
				model.addAttribute("array10", array[10]);	
				model.addAttribute("array11", array[11]);	
				model.addAttribute("array12", array[12]);	
				model.addAttribute("array13", array[13]);	
				model.addAttribute("array14", array[14]);
				}
			System.out.println("---- 씨앗 차트 끝 ----");
			
		for (int j = 0; j < 12; j++) {
			fmonth = adDAO.fchart(j);
			fMonth.add(fmonth);
		}
		
		
		model.addAttribute("mMonth", mMonth);
		model.addAttribute("fMonth", fMonth);
		
		//상품 차트
	    ProductDao productdao = sqlSessionTemplate.getMapper(ProductDao.class);
		int year2 = cal.get(Calendar.YEAR);	
	    
	    String[] months = {"January","february","march","april","may","june","july"
	    		,"august","september","october","november","december"};
		int[] payment = new int[12];
		int[] payment1 = new int[12];
		int[] payment2 = new int[12];
	    for(int i =0; i < months.length; i++) {
		    HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("Month", months[i]);
			map.put("year", year2);
			payment[i] = productdao.adminproductpaymentchart(map);
	    }
	    model.addAttribute("payment",payment);
	    
	    for(int i =0; i < months.length; i++) {
		    HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("Month", months[i]);
			map.put("year", year2-1);
			payment1[i] = productdao.adminproductpaymentchart(map);
	    }
	    model.addAttribute("payment1pre",payment1);
	    
	    for(int i =0; i < months.length; i++) {
		    HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("Month", months[i]);
			map.put("year", year2-2);
			payment2[i] = productdao.adminproductpaymentchart(map);
	    }
	    model.addAttribute("payment2pre",payment2);
 
	    //상품차트
	
	      return "admin/admin";
	   }
	
	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changemonth(@RequestParam String selectmonth, Model model, HttpServletResponse response, FarmerBean farmerBean, MemberBean memberBean) {
		
		AdminDAO adDAO = sqlSessionTemplate.getMapper(AdminDAO.class);
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
	      int mmonth = 0;
	      int fmonth = 0;

	      List<Integer> mMonth = new ArrayList<Integer>();
	      List<Integer> fMonth = new ArrayList<Integer>();

	      for (int i = 0; i < 12; i++) {
	         mmonth = adDAO.mchart(i);
	         mMonth.add(mmonth);
	      }

	      for (int j = 0; j < 12; j++) {
	         fmonth = adDAO.fchart(j);
	         fMonth.add(fmonth);
	      }
	      model.addAttribute("mMonth", mMonth);
	      model.addAttribute("fMonth", fMonth);
	      
		System.out.println("---- changemonth 시작 ----");
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("선택한 달 = " + selectmonth + "월");
		
		
		if (selectmonth == null) {
			map.put("url", "admin");
			map.put("error", false);
		} else {
			
		model.addAttribute("selectmonth",selectmonth);
		
		Integer countA = dao.countA(selectmonth); System.out.println(countA); int countAA = 0;
		if(countA != null) { countAA = dao.countA(selectmonth); }
		Integer countB = dao.countB(selectmonth); System.out.println(countB); int countBB = 0;
		if(countB != null) { countBB = dao.countB(selectmonth); }
		Integer countC = dao.countC(selectmonth); System.out.println(countC); int countCC = 0;
		if(countC != null) { countCC = dao.countC(selectmonth); }
		Integer countD = dao.countD(selectmonth); System.out.println(countD); int countDD = 0;
		if(countD != null) { countDD = dao.countD(selectmonth); }
		Integer countE = dao.countE(selectmonth); System.out.println(countE); int countEE = 0;
		if(countE != null) { countEE = dao.countE(selectmonth); }
		Integer countF = dao.countF(selectmonth); System.out.println(countF); int countFF = 0;
		if(countF != null) { countFF = dao.countF(selectmonth); }
		Integer countG = dao.countG(selectmonth); System.out.println(countG); int countGG = 0;
		if(countG != null) { countGG = dao.countG(selectmonth); }
		Integer countH = dao.countH(selectmonth); System.out.println(countH); int countHH = 0;
		if(countH != null) { countHH = dao.countH(selectmonth); }
		Integer countI = dao.countI(selectmonth); System.out.println(countI); int countII = 0;
		if(countI != null) { countII = dao.countI(selectmonth); }
		Integer countJ = dao.countJ(selectmonth); System.out.println(countJ); int countJJ = 0;
		if(countJ != null) { countJJ = dao.countJ(selectmonth); }
		Integer countK = dao.countK(selectmonth); System.out.println(countK); int countKK = 0; 
		if(countK != null) { countKK = dao.countK(selectmonth); }
		Integer countL = dao.countL(selectmonth); System.out.println(countL); int countLL = 0;
		if(countL != null) { countLL = dao.countL(selectmonth); }
		Integer countM = dao.countM(selectmonth); System.out.println(countM); int countMM = 0;
		if(countM != null) { countMM = dao.countM(selectmonth); }
		Integer countN = dao.countN(selectmonth); System.out.println(countN); int countNN = 0;
		if(countN != null) { countNN = dao.countN(selectmonth); }
		Integer countO = dao.countO(selectmonth); System.out.println(countO); int countOO = 0;
		if(countO != null) { countOO = dao.countO(selectmonth); }
		
		int[] array = {countAA,countBB,countCC,countDD,countEE,
				   countFF,countGG,countHH,countII,countJJ,
				   countKK,countLL,countMM,countNN,countOO};	
	
	System.out.println("A = " + countA);
		
		map.put("sarray0", array[0]);
		map.put("sarray1", array[1]);
		map.put("sarray2", array[2]);
		map.put("sarray3", array[3]);
		map.put("sarray4", array[4]);
		map.put("sarray5", array[5]);
		map.put("sarray6", array[6]);
		map.put("sarray7", array[7]);
		map.put("sarray8", array[8]);
		map.put("sarray9", array[9]);
		map.put("sarray10", array[10]);
		map.put("sarray11", array[11]);
		map.put("sarray12", array[12]);
		map.put("sarray13", array[13]);
		map.put("sarray14", array[14]);
		map.put("error", true);
		System.out.println("---- changemonth 끝 ----");
		}
		return map;
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

	@RequestMapping(value = "/userList")
	public String mlist(Model model, Paging paging, MemberBean memberBean) {
		AdminDAO dao = sqlSessionTemplate.getMapper(AdminDAO.class);

		int total = dao.mCount(paging);

		PageMaker pageMake = new PageMaker(paging, total);
		model.addAttribute("member", dao.mlist(paging));
		model.addAttribute("pageMaker", pageMake);
		return "admin/userList";
	}

	@RequestMapping(value = "/farmerList", method = RequestMethod.GET)
	public String flist(Model model, Paging paging, FarmerBean farmerBean) {
		AdminDAO dao = sqlSessionTemplate.getMapper(AdminDAO.class);

		int total = dao.mCount(paging);

		PageMaker pageMake = new PageMaker(paging, total);
		model.addAttribute("farmer", dao.flist(paging));
		model.addAttribute("pageMaker", pageMake);
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

	@RequestMapping(value = "/farmerAdd", method = RequestMethod.GET)
	public String farmerAdd(Model model) {
		model.addAttribute("farmerBean", new FarmerBean());
		return "admin/farmerTest";
	}

	@RequestMapping(value = "/farmerAdd", method = RequestMethod.POST)
	public String farmerAdd(FarmerBean farmerBean, BindingResult bindingResult, HttpServletRequest request) {

		System.out.println("첫번째:" + farmerBean.getF_Pw());
		String encryPassword = UserPw.encrypt(farmerBean.getF_Pw());
		farmerBean.setF_Pw(encryPassword);
		System.out.println("두번째:" + farmerBean.getF_Pw());

		FarmerDAO farmerDAO = sqlSessionTemplate.getMapper(FarmerDAO.class);
		farmerDAO.farmerAdd(farmerBean);

		if (bindingResult.hasErrors()) {
			return "admin/farmerTest";
		}
		return "redirect:/farmerList";
	}

	@RequestMapping(value = "/userAdd", method = RequestMethod.GET)
	public String userAdd(Model model) {
		model.addAttribute("memberBean", new MemberBean());
		return "admin/userTest";
	}

	@RequestMapping(value = "/userAdd", method = RequestMethod.POST)
	public String userAdd(MemberBean memberBean, BindingResult bindingResult, HttpServletRequest request) {

		System.out.println("첫번째:" + memberBean.getM_Pw());
		String encryPassword = UserPw.encrypt(memberBean.getM_Pw());
		memberBean.setM_Pw(encryPassword);
		System.out.println("두번째:" + memberBean.getM_Pw());

		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		memberDAO.userAdd(memberBean);

		if (bindingResult.hasErrors()) {
			return "admin/userTest";
		}
		return "redirect:/userList";
	}

	@RequestMapping(value = "/userDelete")
	@ResponseBody
	public Map<String, Object> userDelete(MemberBean memberbean, @RequestParam(value = "checkArr[]") String checkArr) {

		Map<String, Object> map = new HashMap<String, Object>();
		MemberDAO memDao = sqlSessionTemplate.getMapper(MemberDAO.class);

		List<String> delete = Arrays.asList(checkArr);
		memDao.uDelete(delete);
		map.put("error", true);
		
		return map;
	}
	
	@RequestMapping(value = "/farmerD")
	@ResponseBody
	public Map<String, Object> farmerDelete(FarmerBean farmerbean, @RequestParam(value = "checkArr[]") String checkArr) {

		Map<String, Object> map = new HashMap<String, Object>();
		FarmerDAO farmDao = sqlSessionTemplate.getMapper(FarmerDAO.class);

		List<String> delete = Arrays.asList(checkArr);
		farmDao.fDel(delete);
		map.put("error", true);
		
		return map;
	}
	
	@RequestMapping(value = "/farmerY")
	@ResponseBody
	public Map<String, Object> farmerY(FarmerBean farmerBean, @RequestParam(value = "checkArr[]")String checkArr){
		
		Map<String, Object> map = new HashMap<String, Object>();
		AdminDAO farmDao = sqlSessionTemplate.getMapper(AdminDAO.class);
		
		List<String> yes = Arrays.asList(checkArr);
		farmDao.farmerY(yes);
		map.put("error", true);
		
		return map;
	}

}
