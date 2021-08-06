package kr.co.everyfarm.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping("/basket")
	public String getBasketList(Model model) {
		BasketDAO dao = sqlSessionTemplate.getMapper(BasketDAO.class);
		List<BasketBean> basketList = dao.list();
		model.addAttribute("basketList", basketList);
		return "product/basket";
	}
	
	@RequestMapping(value = "/qnalist")
	public String getQnAList(Model model) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> qnalist = dao.list();
		model.addAttribute("qnalist", qnalist);
		return "product/qnalist";
	}
	
	@RequestMapping("/qnawrite")
	public String getQnAWrite() {
		return "product/qnawrite"; // redirect 쓰면 오류남
	}
	
}
