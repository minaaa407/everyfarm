package kr.co.everyfarm.payment;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.everyfarm.admin.AdminBean;
import kr.co.everyfarm.basket.BasketBean;
import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.user.MailAuth;
import kr.co.everyfarm.user.MemberBean;
import kr.co.everyfarm.user.MemberDAO;

@Controller
public class PaymentController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	List<PaymentBean> payInformationSave  = new ArrayList<PaymentBean>();
	
	@RequestMapping(value = "/PaymentInfo")
	public String getPaymentInfo_Product(Model model, @ModelAttribute("basketbean") BasketBean basketbean) {
		System.out.println("--페이먼트인포시작--"); //

		// land 0값 제거 list
		List<BasketBean> list = basketbean.getBasketbeanList();
		int j = list.size();
		for (int i = 0; i < j; i++) {
			if (list.get(i).getB_Land() <= 0) {
				list.remove(i);
				j--;
				i--;
			}
		}
		basketbean.setBasketbeanList(list);
		System.out.println("현재 list size" + list.size());
		System.out.println(basketbean.getBasketbeanList().get(0).getB_Seed() + "작물"); //

		MemberDAO userdao = sqlSessionTemplate.getMapper(MemberDAO.class);
		PaymentBean paymentbean = new PaymentBean();
		String id = basketbean.getBasketbeanList().get(0).getB_Id();
		MemberBean getinfo1 = userdao.userInfo(id);

		System.out.println(getinfo1.getM_Id()+"너 id 임"); //
		model.addAttribute("Member", getinfo1);
		model.addAttribute("memBasketModel", basketbean);
		model.addAttribute("payment", paymentbean);
		
		for (int i = 0; i < j; i++) {
			System.out.println("넘겨주는 바스켓 데이터" + basketbean.getBasketbeanList().get(i));
		}
		System.out.println("--페이먼트인포끝--"); //

		return "payment/payment";
	}

	@RequestMapping("/paymentdelete")
	public String paymentDelete(@RequestParam String[] pno, @ModelAttribute("basketbean") BasketBean basketbean, Model model, HttpServletRequest request) {
		
		List<BasketBean> list = basketbean.getBasketbeanList();
		int j = list.size();
		
		System.out.println("현재 list size" + list.size());
		
		model.addAttribute("memBasketModel", basketbean);
		
		for (int i = 0; i < j; i++) {
			System.out.println("넘겨주는 바스켓 데이터" + basketbean.getBasketbeanList().get(i));
		}
		System.out.println("--페이먼트딜리트 끝--"); //
		
		return "payment/payment";
	}
	
	
	// 결제 성공시 관련정보 이메일전송 
		@RequestMapping(value = "/sendmessage2")
		@ResponseBody
		public Map<String, Object> sendmessage(@RequestParam String pay_Name, @RequestParam String pay_Email,
				@RequestParam String pay_Totalprice, @RequestParam String pay_Orderno) {
			Map<String, Object> map = new HashMap<String, Object>();
			System.out.println(1);
			System.out.println(pay_Name + " " + pay_Email + " " + pay_Totalprice + " " + pay_Orderno);
			PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
			List<PaymentBean> pay = dao.sendmessage(1111);
			System.out.println(2);
	
			if (pay == null) {    // 페이값이 비어있으면
				System.out.println("메일전송 실패");
				map.put("error", false);   // 맵에다가 error 값 false
				System.out.println(3);
			} else {
				System.out.println(4);
	
				Properties prop = System.getProperties();
				prop.put("mail.smtp.starttls.enable", "true");
				prop.put("mail.smtp.host", "smtp.gmail.com");
				prop.put("mail.smtp.auth", "true");
				prop.put("mail.smtp.port", "587");
	
				System.out.println(5);
				Authenticator auth = new MailAuth();
	
				Session session = Session.getDefaultInstance(prop, auth);
	
				MimeMessage msg = new MimeMessage(session);
				
//				String payname = paymentbean.getPay_Name();
//				String payemail = paymentbean.getPay_Email();
//				int totalprice = paymentbean.getPay_Totalprice();
//				String price =  Integer.toString(totalprice);
				System.out.println(6);
				try {
					System.out.println(7);
					msg.setSentDate(new Date());
	
					msg.setFrom(new InternetAddress("alsdk9458@gmail.com", "EVERYFARM"));
					InternetAddress to = new InternetAddress(pay_Email);
					msg.setRecipient(Message.RecipientType.TO, to);
					msg.setSubject(pay_Name + "고객님, EVERY FARM 결제가 완료 되었습니다.", "UTF-8");
					msg.setText("안녕하세요, " + pay_Name + " 님의 결제내역입니다." + "\n\n" + pay_Name + "고객님의 결제금액은 "
							+ pay_Totalprice + "입니다." + "\n감사합니다.", "UTF-8");
					System.out.println(8);
	
					Transport.send(msg);
	
					System.out.println(9);
				} catch (AddressException ae) {
					System.out.println("AddressException : " + ae.getMessage());
					System.out.println(10);
				} catch (MessagingException me) {
					System.out.println("MessagingException : " + me.getMessage());
					System.out.println(11);
				} catch (UnsupportedEncodingException e) {
					System.out.println("UnsupportedEncodingException : " + e.getMessage());
					System.out.println(12);
				}
	
				System.out.println(13);
				map.put("error", true);
				System.out.println("paycomplete  payInformationSave : " + payInformationSave);
				payInformationSave.clear();
				System.out.println("paycomplete  payInformationSave : " + payInformationSave);
			}
			return map;
		}
	
	@RequestMapping(value = "/paycomplete")  
	   public String payInsert(Model model, HttpSession session, @ModelAttribute PaymentBean paymentbean) {
		  System.out.println("-----페이컴플릿 시작-----");
	      PaymentDAO paydao = sqlSessionTemplate.getMapper(PaymentDAO.class);
	      MemberBean member = (MemberBean)session.getAttribute("member");
	      String m_id = member.getM_Id();
	      System.out.println(m_id);
	      String returnUrl = "";
	      int n = 0;
	      
	      List<PaymentBean> paymentlist = paydao.paylist();
	      paymentlist = paydao.paylist();
		  
	      for(int i = 0; i < payInformationSave.size(); i++) {
	         PaymentBean insertPayBean = new PaymentBean();
	         
	         insertPayBean.setPay_No(payInformationSave.get(i).getPay_No());
	         insertPayBean.setPay_Id(m_id);
	         insertPayBean.setPay_Land(payInformationSave.get(i).getPay_Land());
	         insertPayBean.setPay_Seed(payInformationSave.get(i).getPay_Seed());
	         insertPayBean.setPay_Totalprice(payInformationSave.get(i).getPay_Totalprice());
	         insertPayBean.setPay_Deliverymemo(payInformationSave.get(i).getPay_Deliverymemo());
	         insertPayBean.setPay_Address(payInformationSave.get(i).getPay_Address());
	         insertPayBean.setPay_Name(payInformationSave.get(i).getPay_Name());
	         insertPayBean.setPay_Tel(payInformationSave.get(i).getPay_Tel());
	         insertPayBean.setPay_Email(payInformationSave.get(i).getPay_Email());
	         n += paydao.payinsert(insertPayBean);
	         System.out.println(insertPayBean);
	      }
	      model.addAttribute("paymentlist", paymentlist);
	      System.out.println(paymentlist);
	      if(n>0) {
	         returnUrl = "payment/complete";
	      }
	      
	      System.out.println("paycomplete  payInformationSave : " + payInformationSave);
	      System.out.println("-----페이컴플릿 끝-----");
	      return returnUrl;
	     }
	   
	   @RequestMapping(value = "/payfail")  
	   public String payFail(Model model) { 
	      payInformationSave.clear();
	      System.out.println("payfail  payInformationSave : " + payInformationSave);
	      
	      return "redirect:/home";
	   }
	
	
	   @RequestMapping(value = "/pay")
	   public String kakaoPay(Model model, @ModelAttribute("payment") PaymentBean PaymentBean) {
	         System.out.println("-----페이 시작------");
	      PaymentDAO paydao = sqlSessionTemplate.getMapper(PaymentDAO.class);
	      payInformationSave.clear();
	      int totalprice=0;
	      String payaddress = PaymentBean.getPaymentbeanList().get(0).getPay_Address();
	      String payname = PaymentBean.getPaymentbeanList().get(0).getPay_Name();
	      String paytel = PaymentBean.getPaymentbeanList().get(0).getPay_Tel();
	      String payemail = PaymentBean.getPaymentbeanList().get(0).getPay_Email();
	      String paydeliverymemo = PaymentBean.getPaymentbeanList().get(0).getPay_Deliverymemo();
	      
	      for(int i = 0; i < PaymentBean.getPaymentbeanList().size(); i++) {
	    	  PaymentBean.getPaymentbeanList().get(i).setPay_Address(payaddress);
	    	  PaymentBean.getPaymentbeanList().get(i).setPay_Name(payname);
	    	  PaymentBean.getPaymentbeanList().get(i).setPay_Tel(paytel);
	    	  PaymentBean.getPaymentbeanList().get(i).setPay_Email(payemail);
	    	  PaymentBean.getPaymentbeanList().get(i).setPay_Deliverymemo(paydeliverymemo);
	    	  
	    	  
	         payInformationSave.add(PaymentBean.getPaymentbeanList().get(i));
	         System.out.println(PaymentBean.getPaymentbeanList().get(i));
	         int price = PaymentBean.getPaymentbeanList().get(i).getPay_Totalprice();
	         totalprice += price;
	      }
	      	System.out.println(totalprice);
	      	System.out.println(payemail);
	      	System.out.println(payname);
	      	model.addAttribute("totalprice", totalprice);
	      	model.addAttribute("payemail", payemail);
	      	model.addAttribute("payname", payname);
	      	
	      System.out.println("payInformationSave2 = " + payInformationSave);
	      System.out.println("-----페이 끝------");
	      return "payment/test1";
	      
	   }

	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String test1() {
		return "payment/complete";
	}

	@RequestMapping(value = "/adminPaymentList")
	public String adminPaymentList(Model model, Criteria cri, HttpSession session) {
		System.out.println("-----어드민페이먼트리스트 시작------");
		AdminBean admin = (AdminBean) session.getAttribute("admin");
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		
		
		  // 현재 페이지에 해당하는 게시물을 조회해 옴
	      List<PaymentBean> paymentlist = dao.paylist1(cri);
	      // 모델에 추가
	      model.addAttribute("paymentlist", paymentlist);
	      // PageMaker 객체 생성
	      PageMaker pageMaker = new PageMaker(cri);
	      // 전체 게시물 수를 구함
	      int totalCount = dao.getPayTotalCount(cri);
	      // pageMaker로 전달
	      pageMaker.setTotalCount(totalCount);
	      // 모델에 추가
	      model.addAttribute("pageMaker", pageMaker);
	      System.out.println("페이리스트 = " + paymentlist.get(0));
		    System.out.println("페이리스트 = " + paymentlist.toString());
	      System.out.println("-----어드민페이먼트리스트 끝------");
		return "payment/adminPaymentList";
	}

	
	@RequestMapping(value = "/farmerpaymentlist")
	public String farmerPaymentList(Model model, Criteria cri, HttpSession session) {
		System.out.println("-----파머페이먼트리스트 시작------");
		FarmerBean farmer = (FarmerBean)session.getAttribute("farmer");
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		String f_id = farmer.getF_Id();
		System.out.println(f_id);
		
		// 현재 페이지에 해당하는 게시물을 조회해 옴
		List<PaymentBean> farmerpaymentlist = dao.farmerpaylist(f_id);
		// 모델에 추가
	    model.addAttribute("farmerpaymentlist", farmerpaymentlist);
	    // PageMaker 객체 생성
	    PageMaker pageMaker = new PageMaker(cri);
	    // 전체 게시물 수를 구함
	    int totalCount = dao.getPayTotalCount(cri);
	    // pageMaker로 전달  
	    pageMaker.setTotalCount(totalCount);
	    // 모델에 추가
	    model.addAttribute("pageMaker", pageMaker);
	    
	    System.out.println("파머리스트 = " + farmerpaymentlist.get(0));
	    System.out.println("파머리스트 = " + farmerpaymentlist.toString());
	    System.out.println("-----파머페이먼트리스트 끝------");
		return "payment/farmerPaymentList";
	}
	
	@RequestMapping(value = "/adminPayListDelete")
	public String adminPayListDelete(@RequestParam String[] payno, PaymentBean paymentbean, Model model, HttpServletRequest request) {
		System.out.println("---- 어드민페이리스트딜리트 시작-----");
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		System.out.println("payno = " + payno);
		
		for(int i=0 ; i<payno.length; i++) {
			System.out.println("payno = " + payno[i]);
		}
		
		List<String> deletelist = Arrays.asList(payno);
		System.out.println("deletelist = "+ deletelist);
		int delete = dao.paydelete(deletelist);
		
		System.out.println("delete = " + delete);
		System.out.println("---- 어드민페이리스트딜리트 끝-----");
		return "redirect:/adminPaymentList";
	}
	
	
//	@RequestMapping(value = "/farmerPayListDelete/{Orderno}")
//	public String farmerPayListDelete(@PathVariable int Orderno, Model model) {
//		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
//		int payListDelete = dao.paydelete(Orderno);
//		System.out.println(payListDelete);
//		return "redirect:/farmerPaymentList";
//	}

	@RequestMapping(value = "/adminPaymentListDetail", method = RequestMethod.GET)
	public String test4() {
		return "payment/adminPaymentListDetail";
	}

	@RequestMapping(value = "/payfailed")
	public String kakaoPayfailed() {
		return "payment/failed";
	}


	@RequestMapping(value = "/myPayList")
	public String getMyPayList(Model model, PaymentBean PayBean,HttpSession session) {
		MemberBean mBean = (MemberBean) session.getAttribute("member");
		PaymentDAO payDAO = sqlSessionTemplate.getMapper(PaymentDAO.class);
		String m_Id = mBean.getM_Id();
		
		List<PaymentBean> myPay = payDAO.mypaylist(m_Id);
		model.addAttribute("mypay", myPay);
		return "user/myPayList";

	}
	
	@RequestMapping(value = "/modal/modal_view")
	public String modelPopup(PaymentBean paymentbean, Model model) {
		
		PaymentDAO payDAO = sqlSessionTemplate.getMapper(PaymentDAO.class);
		
		model.addAttribute("searchData", payDAO.getSearchData(paymentbean));
		
		return "/payment/viewResult";
	}
	
	@RequestMapping(value = "/admin1", method = RequestMethod.GET)
	public String testlist(Model model, Criteria cri) {
		System.out.println("---- admin1 시작 ----");
		
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
		
        
        PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
        
        
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
		System.out.println("---- admin1 끝 ----");
		
		return "payment/test";
	}
	
	@RequestMapping(value = "/admin1", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changemonth(@RequestParam String selectmonth, Model model, HttpServletResponse response) {
		System.out.println("---- changemonth 시작 ----");
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("선택한 달 = " + selectmonth + "월");
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		
		if (selectmonth == null) {
			map.put("url", "test1");
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
}
