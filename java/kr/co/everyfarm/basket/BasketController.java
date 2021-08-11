package kr.co.everyfarm.basket;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.everyfarm.user.MemberBean;

@Controller
public class BasketController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping("/basket")
	public String getBasketList(Model model, HttpServletRequest request) {
		
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		BasketDAO dao = sqlSessionTemplate.getMapper(BasketDAO.class);
		List<BasketBean> basketList = dao.listAll(member);
		model.addAttribute("basketList", basketList);
		System.out.println(basketList);
	
		return "payment/basket";
	}
	
	
	
}
