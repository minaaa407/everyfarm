package kr.co.everyfarm.board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.farmer.FarmerDAO;
import kr.co.everyfarm.payment.PaymentBean;
import kr.co.everyfarm.payment.PaymentDAO;
import kr.co.everyfarm.user.MemberBean;

@Controller
public class ReviewController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	@RequestMapping(value = "/reviewList")
	public String getReviewList(Model model, ReviewBean reviewBean,Paging paging) {
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);

		
		int total = dao.revCount(paging);
		PageMaker pageMake = new PageMaker(paging, total);
		model.addAttribute("total", total);
		model.addAttribute("revList", dao.paging(paging));
		model.addAttribute("pageMaker", pageMake);
		return "board/reviewList";
	}
	
	
	@RequestMapping("/reviewWrite")
	public String getReviewWrite(HttpSession session, PaymentBean paymentbean,Model model, FarmerBean farmerBean) {
		MemberBean member = (MemberBean) session.getAttribute("member");
		String m_Id = member.getM_Id();
		
		PaymentDAO pDao = sqlSessionTemplate.getMapper(PaymentDAO.class);
		List<PaymentBean> myPay = pDao.mypaylist(m_Id);
		model.addAttribute("myPayList", myPay);
		return "board/reviewWrite";
	}
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public String Reviewinsert(ReviewBean reviewBean,@RequestParam("rev_Rate")Float rev_Rate,@RequestParam("pay_No")Float pay_No,FarmerBean farmerBean){
	
	Map<Float, Object> map = new HashMap<Float, Object>();
	map.put(rev_Rate, rev_Rate);
	map.put(pay_No, Math.round(pay_No));
	FarmerDAO fdao = sqlSessionTemplate.getMapper(FarmerDAO.class);
	ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
	
	fdao.myRate(farmerBean);
	int n = dao.insert(reviewBean);
	return "redirect:/reviewList";
	}
	
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String Replyinsert(ReviewReplyBean reviewReplyBean) {
		ReviewDAO rdao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		rdao.replyInsert(reviewReplyBean);
		
		return "redirect:/reviewDetail?rev_No="+reviewReplyBean.getRev_No();
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
	public String reviewDetail(ReviewBean reviewBean,ReviewReplyBean reviewReplyBean,Model model,@RequestParam("rev_No") int rev_No) {
		ReviewDAO revDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		revDAO.ReadCount(reviewBean);
		
		List<ReviewReplyBean> list = revDAO.reply(rev_No);
		ReviewBean revVO = revDAO.revDetail(reviewBean);
		model.addAttribute("repList", list);
		model.addAttribute("revList", revVO);
		
		return "board/reviewDetail";
	}
	
	
	@RequestMapping(value = "/myReview")
	public String getReviewMyList(Model model,HttpServletRequest req,ReviewBean reviewBea,HttpSession session) {
		
		MemberBean mBean = (MemberBean) session.getAttribute("member");
		String m_Id = mBean.getM_Id();
		
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		List<ReviewBean> list = dao.mylist(m_Id);
		model.addAttribute("revList", list);
		return "user/myReview";
		
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request, ReviewBean review)  {
		JsonObject jsonObject = new JsonObject();
		
		 //String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getSession().getServletContext().getRealPath("/");
		
		String fileRoot = contextRoot+"resources/upload/review/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/upload/review/" + savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}


	
	
	
	
	
	
	
	
}
