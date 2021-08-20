package kr.co.everyfarm.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import kr.co.everyfarm.basket.BasketBean;
import kr.co.everyfarm.product.ProductDao;
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
	}

	
	@RequestMapping(value = "/paycomplete", method = RequestMethod.POST) 
	public String payInsert(Model model, @ModelAttribute("payment") PaymentBean paymentbean) {
		
		System.out.println("--컴플릿시작--");
		
		PaymentDAO paydao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		ProductDao productdao = sqlSessionTemplate.getMapper(ProductDao.class);
		
			List<PaymentBean> paylist = paymentbean.getPaymentbeanList();
			int Land = 0;
//			// System.out.println(paylist.get(0)+"pay");  // 확인용
//				PaymentBean insertbean = paymentbean.getPaymentbeanList().get(0);
//				System.out.println("인서트빈값" + insertbean);
//				Land = paymentbean.getPaymentbeanList().get(0).getPay_Land();
//				System.out.println("랜드값" + Land);
//				insertbean.setPay_Id(paymentbean.getPay_Id());
//				insertbean.setPay_Address(paymentbean.getPay_Address());
//				insertbean.setPay_Deliverymemo(paymentbean.getPay_Deliverymemo());
//				insertbean.setPay_Method(paymentbean.getPay_Method());
//				insertbean.setPay_Totalprice(paymentbean.getPay_Totalprice());
//				paydao.payinsert(insertbean);
//				landtotal += Land;
			for (int i=0; i<paylist.size(); i++) {
				PaymentBean insertbean = paymentbean.getPaymentbeanList().get(i);
				
				Land = paymentbean.getPaymentbeanList().get(i).getPay_Land();
				
				// 구매한 평수 프로덕트에 업데이트
				int P_Id=paymentbean.getPaymentbeanList().get(i).getPay_No();
				int AvailableLand=productdao.onelist(P_Id).getP_Landavailable();
				int FinalAvailableLand=AvailableLand-Land;
				
				insertbean.setPay_Id(paymentbean.getPay_Id());
				insertbean.setPay_Address(paymentbean.getPay_Address());
				insertbean.setPay_Deliverymemo(paymentbean.getPay_Deliverymemo());
				insertbean.setPay_Method(paymentbean.getPay_Method());
				insertbean.setPay_Totalprice(paymentbean.getPay_Totalprice());
				paydao.payinsert(insertbean);
				// Land2 = insertbean.setPay_Land(paymentbean.getPay_Land());
				paydao.landupdate(FinalAvailableLand, P_Id);
				
			}
				System.out.println("--컴플릿끝--");
				 
				 return "redirect:/complete";
        }
	
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
	
	@RequestMapping(value = "/adminPaymentListDetail", method = RequestMethod.GET)
	public String test4() {
		return "payment/adminPaymentListDetail";
	}
	
	@RequestMapping(value = "/kakao")
	public String kakaoPayTest() {
		return "payment/formtest";
	}
	
	

	@RequestMapping(value = "/pay")
	public String kakaoPay(Model model, @ModelAttribute("payment") PaymentBean paymentbean, HttpServletRequest request) {
			
		PaymentDAO paydao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		
		List<PaymentBean> paylist = paymentbean.getPaymentbeanList();
		int landtotal = 0;
		int Land = 0;
		int Land2 = 0;
		// System.out.println(paylist.get(0)+"pay");  // 확인용
			PaymentBean insertbean = paymentbean.getPaymentbeanList().get(0);
			System.out.println("인서트빈값" + insertbean);
			Land = paymentbean.getPaymentbeanList().get(0).getPay_Land();
			System.out.println("랜드값" + Land);
			insertbean.setPay_Id(paymentbean.getPay_Id());
			insertbean.setPay_Address(paymentbean.getPay_Address());
			insertbean.setPay_Deliverymemo(paymentbean.getPay_Deliverymemo());
			insertbean.setPay_Method(paymentbean.getPay_Method());
			insertbean.setPay_Totalprice(paymentbean.getPay_Totalprice());
			landtotal += Land;
			
			request.setAttribute("insertbean", insertbean);
		
		return "payment/test1";
	}
	
}
