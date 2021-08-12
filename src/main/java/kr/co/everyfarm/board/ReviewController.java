package kr.co.everyfarm.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReviewController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@RequestMapping("/reviewList")
	public String getReviewList(Model model) {
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		List<ReviewBean> list = dao.list();
		model.addAttribute("revList", list);
		return "board/reviewList";
		
	}
	@RequestMapping("/reviewWrite")
	public String getReviewWrite(HttpSession session) {
		return "board/reviewWrite";
	}
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public String Reviewinsert(ReviewBean reviewBean){
	ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
	int n = dao.insert(reviewBean);
	return "redirect:/reviewList";
	}
	
	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.GET)
	public String reviewUpdate(ReviewBean reviewBean,Model model) {
		ReviewDAO revDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		ReviewBean revVO = revDAO.revDetail(reviewBean);
		model.addAttribute("revList", revVO);
		
		return "board/reviewUpdate";
	}
	
	
	@RequestMapping(value = "/reviewUpdate1", method = RequestMethod.POST)
	public String reviewUpdatePOST(ReviewBean reviewBean) {
		ReviewDAO revDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		 revDAO.revUpdate(reviewBean);
		 
			
		return "redirect:/reviewList";
	}
	@RequestMapping(value = "reviewDelete")
	public String reviewDelete(ReviewBean reviewBean) {
		ReviewDAO revDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		 revDAO.revDelete(reviewBean);
		 
			
		return "redirect:/reviewList";
	}
	
	@RequestMapping("/reviewDetail")
	public String reviewDetail(ReviewBean reviewBean,Model model) {
		
		ReviewDAO revDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		revDAO.ReadCount(reviewBean);
		ReviewBean revVO = revDAO.revDetail(reviewBean);
		model.addAttribute("revList", revVO);
		
		return "board/reviewDetail";
	}
	
	
}
