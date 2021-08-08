package kr.co.everyfarm.payment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.everyfarm.product.Product;
import kr.co.everyfarm.product.ProductDao;
import kr.co.everyfarm.qna.QnABean;
import kr.co.everyfarm.qna.QnADao;
import kr.co.everyfarm.user.MemberVO;
import kr.co.everyfarm.user.UserDAO;

@Controller
public class PaymentController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/QnAList")
	public String getQnAList(Model model) {
		System.out.println("컨트롤러");
		QnADao dao = sqlSessionTemplate.getMapper(QnADao.class);
		List<QnABean> list = dao.list();
		model.addAttribute("QnAList", list);
		return "product/QnAList";
	}
	
	@RequestMapping(value ="/PaymentInfo")
	public String getPaymentInfo(Model model) {
		UserDAO userdao = sqlSessionTemplate.getMapper(UserDAO.class);
		ProductDao productdao = sqlSessionTemplate.getMapper(ProductDao.class);
		
		System.out.println("gkgkgk");
		MemberVO getinfo1 = userdao.userInfo("mina@naver.com");
		Product getinfo2 = productdao.productinfo("1");
		System.out.println(getinfo1.toString());
		System.out.println(getinfo2.toString());
		
		model.addAttribute("Member", getinfo1);
		model.addAttribute("Product", getinfo2);
		return "product/payment";
	}
	
	@RequestMapping(value = "/BpaymentInfo", method = RequestMethod.GET)
	public String getBpaymentInfo(Model model) {
		ProductDao productdao = sqlSessionTemplate.getMapper(ProductDao.class);
		Product getinfo2 = productdao.productinfo("1");
		model.addAttribute("Product", getinfo2);
		return "product/bpayment";
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
