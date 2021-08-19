package kr.co.everyfarm.payment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.everyfarm.basket.BasketBean;
import kr.co.everyfarm.user.MemberBean;
import kr.co.everyfarm.user.UserDAO;

@Controller
public class PaymentController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	 
	@RequestMapping(value ="/PaymentInfo")
	public String getPaymentInfo_Product(Model model, @ModelAttribute ("basketbean") BasketBean basketbean) {
		System.out.println("--페이먼트인포시작--"); //
		
		// land 0값 제거 list
		List<BasketBean> list = basketbean.getBasketbeanList();
		int j = list.size();
	      for(int i =0; i<j; i++) {
	         if(list.get(i).getB_Land()<=0) {
	            list.remove(i);
	            j--;
	            i--;
	         }
	      }
	      basketbean.setBasketbeanList(list);
	      
		System.out.println(basketbean.getBasketbeanList().get(0).getB_Seed() + "작물"); //
		
		UserDAO userdao = sqlSessionTemplate.getMapper(UserDAO.class);
		PaymentBean paymentbean = new PaymentBean();
		String id = basketbean.getBasketbeanList().get(0).getB_Id();  
		MemberBean getinfo1 = userdao.userInfo(id);
		
		System.out.println(id); //
		model.addAttribute("Member", getinfo1);
		model.addAttribute("memBasketModel",basketbean);
		model.addAttribute("payment", paymentbean);
		System.out.println("--페이먼트인포끝--"); //
		
		return "payment/payment";
		// 장바구니에서받아올때 productdao.productinfo(memBasket); // 장바구니와 바로결제 if문으로 
	}

	
	@RequestMapping(value = "/paycomplete", method = RequestMethod.POST)
	public String payInsert(Model model, @ModelAttribute("payment") PaymentBean paymentbean) {
		
		System.out.println("--컴플릿시작--");
		
		PaymentDAO paydao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		
			List<PaymentBean> paylist = paymentbean.getPaymentbeanList();
			int landtotal = 0;
			int Land = 0;
			int Land2 = 0;
			// System.out.println(paylist.get(0)+"pay");  // 확인용
			for (int i=0; i<paylist.size(); i++) {
				PaymentBean insertbean = paymentbean.getPaymentbeanList().get(i);
				System.out.println("인서트빈값" + insertbean);
				Land = paymentbean.getPaymentbeanList().get(i).getPay_Land();
				System.out.println("랜드값" + Land);
				insertbean.setPay_Id(paymentbean.getPay_Id());
				insertbean.setPay_Address(paymentbean.getPay_Address());
				insertbean.setPay_Deliverymemo(paymentbean.getPay_Deliverymemo());
				insertbean.setPay_Method(paymentbean.getPay_Method());
				insertbean.setPay_Totalprice(paymentbean.getPay_Totalprice());
				paydao.payinsert(insertbean);
				// Land2 = insertbean.setPay_Land(paymentbean.getPay_Land());
				landtotal += Land;
			}
				System.out.println("결제총 땅수  " + landtotal);
				PaymentBean insertbean = paymentbean.getPaymentbeanList().get(0);
				System.out.println(insertbean);
				
//				for (int i=0; i<paylist.size(); i++) {
//					int getproductno = insertbean.getPay_No();
//					System.out.println("상품 번호  " + getproductno);
//					
//					int land = paydao.getinfo(getproductno);
//					System.out.println("상품번호로 가져온 사용가능땅수  " + land);
//					
//					int availableland = land - landtotal;
//					System.out.println("사용가능 땅수 - 결제총 땅수  " + availableland);
//					
//					int availableLandUpdate = paydao.landupdate(paymentbean);  
//					System.out.println("업데이트된 땅수" + availableLandUpdate);
//					
//					insertbean.setPay_Id(paymentbean.getPay_Id());
//					insertbean.setPay_Address(paymentbean.getPay_Address());
//					insertbean.setPay_Deliverymemo(paymentbean.getPay_Deliverymemo());
//					insertbean.setPay_Method(paymentbean.getPay_Method());
//					insertbean.setPay_Totalprice(paymentbean.getPay_Totalprice());
//					insertbean.setPay_Land(availableLandUpdate);
//					paydao.landupdate(insertbean);
//				}
				
				System.out.println("--컴플릿끝--");
				 
            return "redirect:/complete";
        }
		// int proupdate = prodao.update(payment);   프로덕트 어베일러블 -평수 시키기
	
	
//	@RequestMapping(value = "/bpaycomplete", method = RequestMethod.POST)
//	public String payInsert(Model model, @ModelAttribute("bpayment") BpaymentBean bpaymentbean) {
//		
//		System.out.println("--컴플릿시작--");
//		
//		PaymentDAO paydao = sqlSessionTemplate.getMapper(PaymentDAO.class);
//			
//			List<BpaymentBean> bpaylist = bpaymentbean.getBpaymentbeanList();
//			
//			// System.out.println(bpaylist.size()+"bpaysize");  // 확인용
//			
//			for (int i=0; i<bpaylist.size(); i++) {
//				BpaymentBean insertbean = bpaymentbean.getBpaymentbeanList().get(i);
//				insertbean.setBpay_Name(bpaymentbean.getBpay_Name());
//				insertbean.setBpay_Pw(bpaymentbean.getBpay_Pw());
//				insertbean.setBpay_Tel(bpaymentbean.getBpay_Tel());
//				insertbean.setBpay_Address(bpaymentbean.getBpay_Address());
//				insertbean.setBpay_Email(bpaymentbean.getBpay_Email());
//				insertbean.setBpay_Deliverymemo(bpaymentbean.getBpay_Deliverymemo());
//				insertbean.setBpay_Method(bpaymentbean.getBpay_Method());
//				insertbean.setBpay_Totalprice(bpaymentbean.getBpay_Totalprice());
//				paydao.bpayinsert(insertbean);
//				// model.addAttribute("pay", payinsert);
//			}
//			System.out.println("--컴플릿끝--");
//			
//			return "redirect:/complete";
//		}
//		// int proupdate = prodao.update(payment);   프로덕트 어베일러블 -평수 시키기
	
	
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String test1() {
		return "payment/complete";
	}
	
	

	
	@RequestMapping(value = "/adminPaymentList")
	public String adminPaymentList(Model model) {
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		List<PaymentBean> paymentlist = dao.paylist();
		List<BpaymentBean> bpaymentlist = dao.bpaylist();
		model.addAttribute("paymentlist", paymentlist);
		model.addAttribute("bpaymentlist", bpaymentlist);
		return "payment/adminPaymentList";
	}
	
	@RequestMapping(value = "/adminPayListDelete/{Orderno}")
	public String adminPayListDelete(@PathVariable int Orderno, Model model) {
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		int payListDelete = dao.paydelete(Orderno);
		System.out.println(payListDelete);
		return "redirect:/adminPaymentList";
	}
	
//	@RequestMapping(value = "/adminBpayListDelete/{Orderno}")
//	public String adminBpayListDelete(@PathVariable int Orderno, Model model) {
//		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
//		int bpayListDelete = dao.bpaydelete(Orderno);
//		System.out.println(bpayListDelete);
//		return "redirect:/adminPaymentList";
//	}
	
	@RequestMapping(value = "/adminPaymentListDetail", method = RequestMethod.GET)
	public String test4() {
		return "payment/magShoppingListDetail";
	}
	
	@RequestMapping(value = "/kakao")
	public String kakaoPayTest() {
		return "payment/formtest";
	}

	@RequestMapping(value = "/kakao1")
	public String kakaoPayTest1() {
		return "payment/test1";
	}
	
}
