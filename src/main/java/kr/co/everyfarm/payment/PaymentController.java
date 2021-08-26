package kr.co.everyfarm.payment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

import kr.co.everyfarm.basket.BasketBean;
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

		System.out.println(basketbean.getBasketbeanList().get(0).getB_Seed() + "작물"); //

		MemberDAO userdao = sqlSessionTemplate.getMapper(MemberDAO.class);
		PaymentBean paymentbean = new PaymentBean();
		String id = basketbean.getBasketbeanList().get(0).getB_Id();
		MemberBean getinfo1 = userdao.userInfo(id);

		System.out.println(id); //
		model.addAttribute("Member", getinfo1);
		model.addAttribute("memBasketModel", basketbean);
		model.addAttribute("payment", paymentbean);
		System.out.println("--페이먼트인포끝--"); //

		return "payment/payment";
	}

	@RequestMapping(value = "/paycomplete")  
	   public String payInsert(Model model, HttpSession session) {
		  System.out.println("-----페이컴플릿 시작-----");
	      PaymentDAO paydao = sqlSessionTemplate.getMapper(PaymentDAO.class);
	      MemberBean member = (MemberBean)session.getAttribute("member");
	      String m_id = member.getM_Id();
	      System.out.println(m_id);
	      String returnUrl = "";
	      int n = 0;
	      
	      for(int i = 0; i < payInformationSave.size(); i++) {
	         PaymentBean insertPayBean = new PaymentBean();
	         insertPayBean.setPay_No(payInformationSave.get(i).getPay_No());
	         insertPayBean.setPay_Id(m_id);
	         insertPayBean.setPay_Land(payInformationSave.get(i).getPay_Land());
	         insertPayBean.setPay_Seed(payInformationSave.get(i).getPay_Seed());
	         insertPayBean.setPay_Totalprice(payInformationSave.get(i).getPay_Totalprice());
	         insertPayBean.setPay_Method("kakaopay");
	         insertPayBean.setPay_Deliverymemo(payInformationSave.get(i).getPay_Deliverymemo());
	         insertPayBean.setPay_Address(payInformationSave.get(i).getPay_Address());
	         n += paydao.payinsert(insertPayBean);
	         System.out.println(insertPayBean);
	      }
	      if(n>0) {
	         returnUrl = "payment/complete";
	      }
	      
	      payInformationSave.clear();
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
	         
	      PaymentDAO paydao = sqlSessionTemplate.getMapper(PaymentDAO.class);
	      payInformationSave.clear();
	      int totalprice=0;
	      for(int i = 0; i < PaymentBean.getPaymentbeanList().size(); i++) {
	         payInformationSave.add(PaymentBean.getPaymentbeanList().get(i));
	         int price = PaymentBean.getPaymentbeanList().get(i).getPay_Totalprice();
	         totalprice += (price + 3000);
	      }
	      	System.out.println(totalprice);
	      	model.addAttribute("totalprice", totalprice);
	      System.out.println("payInformationSave" + payInformationSave);
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
		
		MemberBean member = (MemberBean)session.getAttribute("member");
		String m_id = member.getM_Id();
		session.setAttribute("name", "maria");                // 이거 두개 임시
		String temp=(String)session.getAttribute("name");     // 이거 두개 임시
		List<PaymentBean> farmerpaymentlist = dao.farmerpaylist(temp); // temp 대신 m_id
		System.out.println(m_id);
		//List<PaymentBean> paymentlist = dao.farmerpaylistserachpageingcount(pagebeen);
		//int selecttotalindex = paymentlist.size();
		//pagebeen.setTableindex(selecttotalindex);
		
		//model.addAttribute("pagebeen", pagebeen);
		model.addAttribute("paymentlist", farmerpaymentlist);
		return "payment/farmerPaymentList";
	}
	
	@RequestMapping(value = "/adminPayListDelete/{Orderno}")
	public String adminPayListDelete(@PathVariable int Orderno, Model model) {
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		int payListDelete = dao.paydelete(Orderno);
		System.out.println(payListDelete);
		return "redirect:/adminPaymentList";
	}
	
	@RequestMapping(value = "/farmerPayListDelete/{Orderno}")
	public String farmerPayListDelete(@PathVariable int Orderno, Model model) {
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		int payListDelete = dao.paydelete(Orderno);
		System.out.println(payListDelete);
		return "redirect:/farmerPaymentList";
	}

	@RequestMapping(value = "/adminPaymentListDetail", method = RequestMethod.GET)
	public String test4() {
		return "payment/adminPaymentListDetail";
	}

	@RequestMapping(value = "/failed")
	public String kakaoPayfailed() {
		return "payment/failed";
	}


	@RequestMapping(value = "/myPayList")
	public String getMyPayList(Model model, PaymentBean PayBean) {
		PaymentDAO payDAO = sqlSessionTemplate.getMapper(PaymentDAO.class);

		List<PaymentBean> myPay = payDAO.mypaylist();
		model.addAttribute("mypay", myPay);
		return "user/myPayList";

	}
	
	@RequestMapping(value = "/modal/modal_view")
	public String modelPopup(PaymentBean paymentbean, Model model) {
		
		PaymentDAO payDAO = sqlSessionTemplate.getMapper(PaymentDAO.class);
		
		model.addAttribute("searchData", payDAO.getSearchData(paymentbean));
		
		return "/payment/viewResult";
	}
	
}
