package kr.co.everyfarm.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/QnAList")
	public String getQnAList(Model model) {
		QnADao dao = sqlSessionTemplate.getMapper(QnADao.class);
		List<QnABean> list = dao.list();
		model.addAttribute("QnAList", list);
		return "product/QnAList";
	}
	
	@RequestMapping(value = "/PaymentInfo")
	public String getPaymentInfo(Model model) {
		PaymentDao dao = sqlSessionTemplate.getMapper(PaymentDao.class);
		List<PaymentBean> list = dao.list();
		model.addAttribute("PaymentInfo", list);
		return "product/payment";
	}
	
	@RequestMapping(value = "/BpaymentInfo", method = RequestMethod.GET)
	public String test() {
		return "product/bpayment";
	}

	@RequestMapping(value = "/PaymentInfo", method = RequestMethod.GET)
	public String test1() {
		return "product/payment";
	}
	
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String test2() {
		return "product/complete";
	}
	
	@RequestMapping(value = "/magShoppingList", method = RequestMethod.GET)
	public String test3() {
		return "product/magShoppingList";
	}
	
	@RequestMapping(value = "/magShoppingListDetail", method = RequestMethod.GET)
	public String test4() {
		return "product/magShoppingListDetail";
	}
}
