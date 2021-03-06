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
import kr.co.everyfarm.product.ProductBean;
import kr.co.everyfarm.user.MemberBean;

@Controller
public class ReviewController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@RequestMapping(value = "/reviewList")
	public String getReviewList(Model model, ReviewBean reviewBean, Paging paging) {
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);

		int total = dao.revCount(paging);
		PageMaker pageMake = new PageMaker(paging, total);
		model.addAttribute("total", total);
		model.addAttribute("revList", dao.paging(paging));
		model.addAttribute("pageMaker", pageMake);
		return "board/reviewList";
	}

	@RequestMapping("/reviewWrite")
	public String getReviewWrite(HttpSession session, PaymentBean paymentbean, Model model, FarmerBean farmerBean) {
		MemberBean member = (MemberBean) session.getAttribute("member");
		String m_Id = member.getM_Id();

		ReviewDAO rdao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		List<PaymentBean> myPay = rdao.selectpaymentreview(m_Id);//?????? ??????.
		List<ProductBean> myProductList = rdao.selectproductreview(m_Id);
		
		
		
		
		
		System.out.println(myPay + "??? ??????");
		//???????????? for ??? ?????? ???????????? ???????????????. 
		
		model.addAttribute("myPayList", myPay);//mypay?????? ???????????? ???????????????. ?????? ?????? ?????? ???????????????. ????????? ????????? ???????????? ???????????????.
		model.addAttribute("myProductList", myProductList);
		return "board/reviewWrite";
	}

	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public String Reviewinsert(ReviewBean reviewBean, @RequestParam("rev_Rate") Float rev_Rate,
			@RequestParam("pay_No") Float pay_No, FarmerBean farmerBean) {
		int pay_orderno = reviewBean.getRev_ProNum();
		FarmerDAO fdao = sqlSessionTemplate.getMapper(FarmerDAO.class);
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		pay_No = (float)(dao.productno(pay_orderno));
		Map<Float, Object> map = new HashMap<Float, Object>();
		map.put(rev_Rate, rev_Rate);
		map.put(pay_No, Math.round(pay_No));
		fdao.myRate(farmerBean);
		int n = dao.insert(reviewBean);
		return "redirect:/reviewList";
	}

	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String Replyinsert(ReviewReplyBean reviewReplyBean) {
		ReviewDAO rdao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		rdao.replyInsert(reviewReplyBean);

		return "redirect:/reviewDetail?rev_No=" + reviewReplyBean.getRev_No();
	}

	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.GET)
	public String reviewUpdate(ReviewBean reviewBean, Model model) {
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

	@RequestMapping(value = "/reviewDelete")
	public String reviewDelete(ReviewBean reviewBean) {
		ReviewDAO revDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		revDAO.revDelete(reviewBean);

		return "redirect:/reviewList";
	}

	@RequestMapping("/reviewDetail")
	public String reviewDetail(ReviewBean reviewBean, ReviewReplyBean reviewReplyBean, Model model,
			@RequestParam("rev_No") int rev_No) {
		ReviewDAO revDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		revDAO.ReadCount(reviewBean);
		List<ReviewReplyBean> list = revDAO.reply(rev_No);
		ReviewBean revVO = revDAO.revDetail(reviewBean);
		
		String name = revVO.getRev_Name().replaceAll("(?<=.{1}).",	"*");
		revVO.setRev_Name(name);
		model.addAttribute("repList", list);
		model.addAttribute("revList", revVO);

		return "board/reviewDetail";
	}

	@RequestMapping(value = "/myReview")
	public String getReviewMyList(Model model, HttpServletRequest req, ReviewBean reviewBea, HttpSession session) {

		MemberBean mBean = (MemberBean) session.getAttribute("member");
		String m_Id = mBean.getM_Id();

		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		List<ReviewBean> list = dao.mylist(m_Id);
		model.addAttribute("revList", list);
		return "user/myReview";
	}
	

	@RequestMapping(value = "/myReviewList")
	public String getReviewMyList2(Model model, HttpServletRequest req, ReviewBean reviewBea, HttpSession session,Paging paging) {

		MemberBean mBean = (MemberBean) session.getAttribute("member");
		String m_Id = mBean.getM_Id();
		paging.setM_Id(m_Id);

		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		int total = dao.revCount(paging);
		PageMaker pageMake = new PageMaker(paging, total);
		model.addAttribute("total", total);
		model.addAttribute("revList", dao.mypaging(paging));
		model.addAttribute("pageMaker", pageMake);
		
		return "board/myReviewList";

	}

	@RequestMapping(value = "/myQnA")
	public String getQnAMylist2(Model model, HttpServletRequest request, HttpSession session) {

		MemberBean member = (MemberBean) session.getAttribute("member");
		String m_Id = member.getM_Id();
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		List<QnABean> myQnAFar = dao.myQnAtoFar(m_Id);
		model.addAttribute("qnaToFar", myQnAFar);
		return "user/myQnA";
	}

	@RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request, ReviewBean review) {
		JsonObject jsonObject = new JsonObject();

		// String fileRoot =
		// "D:\\final\\everyfarm\\WebContent\\resources\\upload\\review\\"; // ??????????????? ??????

		// ??????????????? ??????
		String contextRoot = new HttpServletRequestWrapper(request).getSession().getServletContext().getRealPath("/");

		String fileRoot = contextRoot + "resources/upload/review/";

		String originalFileName = multipartFile.getOriginalFilename(); // ???????????? ?????????
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // ?????? ?????????
		String savedFileName = UUID.randomUUID() + extension; // ????????? ?????? ??? ????????????

		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // ?????? ??????
			jsonObject.addProperty("url", "/resources/upload/review/" + savedFileName);
			// jsonObject.addProperty("url",
			// "/everyfarm/WebContent/resources/upload/review/" + savedFileName); //
			// contextroot + resources + ????????? ?????? ?????????
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // ????????? ?????? ??????
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		 String a = jsonObject.toString();
		return a;
	}
	
	@RequestMapping(value = "/adminReviewList")
	public String getReviewListforAdmin(Model model, ReviewBean reviewBean, Paging paging) {
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);

		int total = dao.revCount(paging);
		PageMaker pageMake = new PageMaker(paging, total);
		model.addAttribute("total", total);
		model.addAttribute("revList", dao.paging(paging));
		model.addAttribute("pageMaker", pageMake);
		return "admin/adminReviewList";
	}
	@RequestMapping(value = "/adminReviewUpdate", method = RequestMethod.GET)
	public String getReviewUpdate(ReviewBean reviewBean, Model model,@RequestParam("rev_No") int rev_No) {
		ReviewDAO revDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		ReviewBean revVO = revDAO.revDetail(reviewBean);
		List<ReviewReplyBean> list = revDAO.reply(rev_No);
		model.addAttribute("rep",list);
		model.addAttribute("revList", revVO);
		return "admin/adminReviewUpdate";
	}
	
	@RequestMapping(value = "/adminReviewDelete" , method = RequestMethod.POST)
	public String getReviewDelete(ReviewBean reviewBean, Model model) {
		ReviewDAO revDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		revDAO.adminDel(reviewBean);
		
		return "redirect:/adminReviewList";
	}
	
	@RequestMapping(value = "/adminReviewDetail")
	public String getReviewDetail1(ReviewBean reviewBean, Model model,@RequestParam("rev_No") int rev_No) {
		ReviewDAO revDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		ReviewBean revVO = revDAO.revDetail(reviewBean);
		List<ReviewReplyBean> list = revDAO.reply(rev_No);
		model.addAttribute("repList",list);
		model.addAttribute("revList", revVO);
		
		return "admin/adminReviewDetail";
	}
	
	@RequestMapping(value = "/farmerReviewList")
	public String getReviewListforFarmer(Model model, ReviewBean reviewBean, Paging paging, HttpSession session) {
		FarmerBean proB = (FarmerBean) session.getAttribute("farmer");
		String p_Id = proB.getF_Id();
		paging.setP_Id(p_Id);
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("re", flist);
		
		int total = dao.farmerReviewscount(p_Id);
		PageMaker pageMake = new PageMaker(paging, total);
		model.addAttribute("total", total);
		model.addAttribute("revList", dao.farmerReviews(paging));
		model.addAttribute("pageMaker", pageMake);
		return "farmer/farmerMyReviewList";
	}
	
	@RequestMapping(value = "/farmerReviewDetail")
	public String getReviewDetail2(ReviewBean reviewBean, Model model,@RequestParam("rev_No") int rev_No) {
		ReviewDAO revDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		ReviewBean revVO = revDAO.revDetail(reviewBean);
		List<ReviewReplyBean> list = revDAO.reply(rev_No);
		System.out.println(list);
		model.addAttribute("repList",list);
		model.addAttribute("revList", revVO);
		
		return "farmer/farmerReviewDetail";
	}
	
	
	@RequestMapping(value = "/farmerReplyWrite", method = RequestMethod.POST)
	public String Replyinsert1(ReviewReplyBean reviewReplyBean) {
		ReviewDAO rdao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		rdao.replyInsert(reviewReplyBean);

		return "redirect:/farmerReviewDetail?rev_No=" + reviewReplyBean.getRev_No();
	}
}
