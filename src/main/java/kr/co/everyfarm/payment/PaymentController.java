package kr.co.everyfarm.payment;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.everyfarm.basket.BasketBean;
import kr.co.everyfarm.product.ProductBean;
import kr.co.everyfarm.product.ProductDao;
import kr.co.everyfarm.user.MemberBean;
import kr.co.everyfarm.user.UserDAO;

@Controller
public class PaymentController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	@RequestMapping(value ="/PaymentInfo")
	public String getPaymentInfo(Model model, @ModelAttribute ("memBasketModel") BasketBean basketbean) {
		UserDAO userdao = sqlSessionTemplate.getMapper(UserDAO.class);
		ProductDao productdao = sqlSessionTemplate.getMapper(ProductDao.class);
		String id = basketbean.getBasketbeanList().get(0).getB_Id();
		System.out.println("gkgkgk");
		MemberBean getinfo1 = userdao.userInfo("mina@naver.com");
		ProductBean getinfo2 = productdao.productinfo("1");
		System.out.println(getinfo1.toString());
		System.out.println(getinfo2.toString());
		
		model.addAttribute("Member", getinfo1);
		model.addAttribute("Product", getinfo2);
		System.out.println("gkgkgk");
		return "payment/payment";
	}
	
//	@RequestMapping(value = "/complete", method = RequestMethod.POST)
//	public String payInsert(@RequestParam String pay_orderno, Model model, PaymentBean pay) {
//		PaymentDAO paydao = sqlSessionTemplate.getMapper(PaymentDAO.class);
//		int payinsert = paydao.insert(pay);
//		model.addAttribute("pay", payinsert);
//		System.out.println("인서트");
//		return "redirect:/payment/complete";
//	}
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String test1() {
		return "payment/complete";
	}
	
	 
	
	
	
	@RequestMapping(value = "/BpaymentInfo", method = RequestMethod.GET)
	public String getBpaymentInfo(Model model) {
		ProductDao productdao = sqlSessionTemplate.getMapper(ProductDao.class);
		ProductBean getinfo2 = productdao.productinfo("1");
		model.addAttribute("Product", getinfo2);
		return "payment/bpayment";
	}


	
	
	@RequestMapping(value = "/magShoppingList", method = RequestMethod.GET)
	public String test3() {
		return "payment/magShoppingList";
	}
	
	@RequestMapping(value = "/magShoppingListDetail", method = RequestMethod.GET)
	public String test4() {
		return "payment/magShoppingListDetail";
	}
}
