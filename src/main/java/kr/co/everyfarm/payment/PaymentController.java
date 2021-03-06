package kr.co.everyfarm.payment;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.everyfarm.admin.AdminBean;
import kr.co.everyfarm.basket.BasketBean;
import kr.co.everyfarm.board.Paging;
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
	      int totalprice=0;
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
	         totalprice += payInformationSave.get(i).getPay_Totalprice();
	         System.out.println(totalprice);
	      }
	      model.addAttribute("paymentlist", paymentlist);
	      
	      if(n>0) {
	         returnUrl = "payment/complete";
	      }
	      
	   // 결제 성공시 관련정보 이메일전송 
	      System.out.println("----메일전송시작----");
	      Properties prop = System.getProperties();
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.port", "587");

			System.out.println(5);
			Authenticator auth = new MailAuth();

			Session session1 = Session.getDefaultInstance(prop, auth);

			MimeMessage msg = new MimeMessage(session1);
			
			System.out.println(6);
			
			String pay_Email = payInformationSave.get(0).getPay_Email();
			System.out.println(pay_Email);
			String pay_Name = payInformationSave.get(0).getPay_Name();
			System.out.println(pay_Name);
			String pay_Seed = payInformationSave.get(0).getPay_Seed();
			System.out.println(pay_Seed);
			int pay_Land = payInformationSave.get(0).getPay_Land();
			System.out.println(pay_Land);
			
			try {
				System.out.println(7);
				msg.setSentDate(new Date());

				msg.setFrom(new InternetAddress("alsdk9458@gmail.com", "EVERYFARM"));
				InternetAddress to = new InternetAddress(pay_Email);
				msg.setRecipient(Message.RecipientType.TO, to);
				msg.setSubject(pay_Name + "회원님, EVERY FARM 결제가 완료 되었습니다.", "UTF-8");
				msg.setContent("안녕하세요. EVERY FARM 입니다. <br>"
						+ pay_Name + " 회원님의 결제내역입니다.<br>" 
						+ "회원님이 주문한 농작물은 " + pay_Seed + "이며 주문한 땅평수는 1평입니다.<br>" 
						+ "회원님의 결제금액은 총" + totalprice + "원 입니다.<br>" 
						+ "감사합니다."
						+ "<!DOCTYPE html>" 
						+ "<html>"
						+ "<head>"
						+ "<meta charset=\"UTF-8\">"
						+ "</head>"
						+ "<body>"
						+ "<table border='1' role='table'>"
						+ "<thead role='rowgroup'>"
						+ "<tr class='center' role='row'>"
						+ "<th role='columnheader'>이미지</th>"
						+ "</tr>"
						+ "</thead>"
						+ "</table>"
						+ "</body>"
						+ "</html>"
						, "text/html; charset=UTF-8");
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
	      System.out.println("----메일전송끝----");
	      
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
	         System.out.println("여기 : "+PaymentBean.getPaymentbeanList().get(i));
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

	@RequestMapping(value = "/adminPaymentList", method = RequestMethod.GET)
	public String adminPaymentList1(Model model, Criteria cri, HttpSession session) {
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
	      System.out.println("-----어드민페이먼트리스트 끝------");
		return "admin/adminPaymentList";
	}
	
	@RequestMapping(value = "/adminPaymentList", method = RequestMethod.POST)
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
	      System.out.println("-----어드민페이먼트리스트 끝------");
		return "admin/adminPaymentList";
	}

	
	@RequestMapping(value = "/farmerpaymentlist")
	public String farmerPaymentList(Model model, Criteria cri, HttpSession session) {
		System.out.println("-----파머페이먼트리스트 시작------");
		FarmerBean farmer = (FarmerBean)session.getAttribute("farmer");
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		String f_id = farmer.getF_Id();
		System.out.println(f_id);
		
		cri.setF_Id(f_id);
		// 현재 페이지에 해당하는 게시물을 조회해 옴
		List<PaymentBean> farmerpaymentlist = dao.farmerpaylist1(cri);
		// 모델에 추가
	    model.addAttribute("farmerpaymentlist", farmerpaymentlist);
	    // PageMaker 객체 생성
	    PageMaker pageMaker = new PageMaker(cri);
	    // 전체 게시물 수를 구함
	    int totalCount = dao.getPayFarmerCount(cri);
	    // pageMaker로 전달  
	    pageMaker.setTotalCount(totalCount);
	    // 모델에 추가
	    model.addAttribute("pageMaker", pageMaker);
	    
	    System.out.println("-----파머페이먼트리스트 끝------");
		return "farmer/farmerPaymentList";
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
	
	

	@RequestMapping(value = "/adminListDetail/{Orderno}", method = RequestMethod.GET)
	public String adminListDetail(@PathVariable int Orderno, Model model) {
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		System.out.println("Orderno = " + Orderno);
		PaymentBean payDetail = dao.paydetailadmin(Orderno); 
		System.out.println("payDetail = " + payDetail);
		
		model.addAttribute("payDetail", payDetail);
		
		return "admin/ListDetailadmin";
	}

	@RequestMapping(value = "/payfailed")
	public String kakaoPayfailed() {
		return "payment/failed";
	}


	@RequestMapping(value = "/myPayList")
	public String getMyPayList(Model model, PaymentBean PayBean,HttpSession session, Paging paging) {
		MemberBean mBean = (MemberBean) session.getAttribute("member");
		PaymentDAO payDAO = sqlSessionTemplate.getMapper(PaymentDAO.class);
		String m_Id = mBean.getM_Id();
		
		List<PaymentBean> mypay = payDAO.mypayListuser(m_Id);
		model.addAttribute("mypay", mypay);
		return "user/myPayList";
		
	}
	
	@RequestMapping(value = "/modal/modal_view")
	public String modelPopup(PaymentBean paymentbean, Model model) {
		
		PaymentDAO payDAO = sqlSessionTemplate.getMapper(PaymentDAO.class);
		
		model.addAttribute("searchData", payDAO.getSearchData(paymentbean));
		
		return "/payment/viewResult";
	}
	
}