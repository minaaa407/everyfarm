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

import kr.co.everyfarm.product.ProductBean;
import kr.co.everyfarm.product.ProductDao;
import kr.co.everyfarm.user.MemberBean;
import kr.co.everyfarm.user.UserDAO;

@Controller
public class PaymentController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	@RequestMapping(value ="/PaymentInfo")
	public String getPaymentInfo(Model model) {
		UserDAO userdao = sqlSessionTemplate.getMapper(UserDAO.class);
		ProductDao productdao = sqlSessionTemplate.getMapper(ProductDao.class);
		PaymentBean paymentbean = new PaymentBean();
		System.out.println("gkgkgk");
		MemberBean getinfo1 = userdao.userInfo("mina@naver.com");
		ProductBean getinfo2 = productdao.productinfo(1);
		System.out.println(getinfo1.toString());
		System.out.println(getinfo2.toString());
		
		model.addAttribute("Member", getinfo1);
		model.addAttribute("Product", getinfo2);
		model.addAttribute("payment", paymentbean);
		System.out.println("gkgkgk");
		return "payment/payment";
	}
	
	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public String payInsert(Model model, @ModelAttribute("payment") PaymentBean payment) {
		System.out.println(payment.toString());
		PaymentDAO paydao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		int payinsert = paydao.insert(payment);
		// model.addAttribute("pay", payinsert);
		System.out.println(payinsert + "페이인서트");
		return "redirect:/complete";
	}
	
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String test1() {
		return "payment/complete";
	}
	
	
	@RequestMapping(value = "/BpaymentInfo", method = RequestMethod.GET)
	public String getBpaymentInfo(Model model) {
		ProductDao productdao = sqlSessionTemplate.getMapper(ProductDao.class);
		ProductBean getinfo2 = productdao.productinfo(1);
		model.addAttribute("Product", getinfo2);
		return "payment/bpayment";
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
	
	@RequestMapping(value = "/adminBpayListDelete/{Orderno}")
	public String adminBpayListDelete(@PathVariable int Orderno, Model model) {
		PaymentDAO dao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		int bpayListDelete = dao.bpaydelete(Orderno);
		System.out.println(bpayListDelete);
		return "redirect:/adminPaymentList";
	}
	
	@RequestMapping(value = "/adminPaymentListDetail", method = RequestMethod.GET)
	public String test4() {
		return "payment/magShoppingListDetail";
	}
}
