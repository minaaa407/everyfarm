package kr.co.everyfarm.board;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value = "/myReview")
	public String getReviewMyList(Model model,HttpServletRequest req,ReviewBean reviewBean,
			@RequestParam(value = "m_Id", defaultValue = "", required = false) String Id) {
		reviewBean.setRev_Id(Id);
		System.out.println(Id);
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		List<ReviewBean> list = dao.mylist();
		model.addAttribute("revList", list);
		return "user/myReview";
		
	}
	
	/*
	 * @RequestMapping(value = "/summer_image", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public void summer_image(MultipartFile file, HttpServletRequest
	 * request, HttpServletResponse response) throws Exception {
	 * response.setContentType("text/html;charset=utf-8"); String save_folder =
	 * "C:\\test\\"; PrintWriter out = response.getWriter(); String file_name =
	 * file.getOriginalFilename(); String server_file_name = fileDBName(file_name,
	 * save_folder); System.out.println("server file : " + server_file_name);
	 * file.transferTo(new File(save_folder + server_file_name));
	 * out.println("resources/upload"+server_file_name); out.close(); } private
	 * String fileDBName(String fileName, String saveFolder) { Calendar c =
	 * Calendar.getInstance(); int year = c.get(Calendar.YEAR); int month =
	 * c.get(Calendar.MONTH); int date = c.get(Calendar.DATE);
	 * 
	 * String homedir = saveFolder + year + "-" + month + "-" + date;
	 * System.out.println(homedir); File path1 = new File(homedir); if
	 * (!(path1.exists())) { path1.mkdir(); } Random r = new Random(); int random =
	 * r.nextInt(10000000);
	 * 
	 * int index = fileName.lastIndexOf(".");
	 * 
	 * String fileExtension = fileName.substring(index + 1);
	 * System.out.println("fileExtension = " + fileExtension);
	 * 
	 * String refileName = "bbs" + year + month + date + random + "." +
	 * fileExtension; System.out.println("refileName = " + refileName);
	 * 
	 * String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
	 * System.out.println("fileDBName = " + fileDBName);
	 * 
	 * return fileDBName; }
	 */
	
	
	
	
	
	
	
	
	
}
