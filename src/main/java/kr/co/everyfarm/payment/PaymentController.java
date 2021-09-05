package kr.co.everyfarm.payment;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
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
	public String adminPaymentList(Model model) {
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		
		List<PaymentBean> paymentlist = dao.paylist();
		//int selecttotalindex = paymentlist.size();
		//pagebeen.setTableindex(selecttotalindex);
		paymentlist = dao.paylist();
		
		// model.addAttribute("pagebeen", pagebeen);
		model.addAttribute("paymentlist", paymentlist);
		return "payment/adminPaymentList";
	}

	@RequestMapping(value = "/farmerPaymentList")
	public String farmerPaymentList(Model model, HttpSession session) {
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		
		FarmerBean farmer = (FarmerBean)session.getAttribute("farmer");
		String f_id = farmer.getF_Id();
//		session.setAttribute("name", "maria");                // 이거 두개 임시
//		String temp=(String)session.getAttribute("name");     // 이거 두개 임시
		List<PaymentBean> farmerpaymentlist = dao.farmerpaylist(f_id); // temp 대신 f_id
		System.out.println(f_id);
		//List<PaymentBean> paymentlist = dao.farmerpaylistserachpageingcount(pagebeen);
		//int selecttotalindex = paymentlist.size();
		//pagebeen.setTableindex(selecttotalindex);
		
		//model.addAttribute("pagebeen", pagebeen);
		model.addAttribute("paymentlist", farmerpaymentlist);
		return "payment/farmerPaymentList";
	}
	
	@RequestMapping(value = "/adminPayListDelete")
	public String adminPayListDelete(@RequestParam String[] payno, PaymentBean paymentbean, Model model, HttpServletRequest request) {
		System.out.println("---- 어드민페이리스트딜리트 시작-----");
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		
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
	
	@RequestMapping(value = "/FPLIST")
	public String FPLIST() {
		return "payment/FPLIST";
	}
	
	

}
