package kr.co.everyfarm.qna;

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
		System.out.println("컨트롤러");
		QnADAO qnadao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> list = qnadao.list();
		model.addAttribute("QnAList", list);
		return "product/QnAList";
	}
	
	
}
