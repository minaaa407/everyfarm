package kr.co.everyfarm.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnAController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/QnAList")
	public String getQnAList(Model model) {
		QnADao dao = sqlSessionTemplate.getMapper(QnADao.class);
		List<QnABean> list = dao.list();
		model.addAttribute("QnAList", list);
		return "product/QnAList";
	}
}
