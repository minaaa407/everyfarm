package kr.co.everyfarm.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@RequestMapping("/reviewList")
	public String getReviewList(Model model) {
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		List<ReviewVO> list = dao.list();
		model.addAttribute("revList", list);
		return "board/reviewList";
		
	}
	@RequestMapping("/reviewWrite")
	public String getReviewWrite(HttpSession session) {
		
		
		return "board/reviewWrite";
	}
	@RequestMapping("/reviewInsert")
	public String Reviewinsert(ReviewVO vo){
	ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
	int n = dao.insert(vo);
	return "redirect:/reviewList";
	}
	
	
}
