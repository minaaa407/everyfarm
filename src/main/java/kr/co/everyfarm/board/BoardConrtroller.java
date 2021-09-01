package kr.co.everyfarm.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.user.MemberBean;


@Controller
public class BoardConrtroller {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/qnalist/{var}")
	public String getQnAList(@PathVariable("var") String var, Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
	
		if(var.equals("product")) {
			List<QnABean> productQlist = dao.productQlist();
			model.addAttribute("productQlist", productQlist);
		}else if(var.equals("admin")){
			List<QnAadminBean> adminQlist = dao.adminQlist();
			model.addAttribute("adminQlist", adminQlist);
		}
		
		return "board/qnalist";
	}
	
	@RequestMapping(value = "/myQnA")
	public String getQnAMylist2(Model model, HttpServletRequest request, HttpSession session) {

		MemberBean member = (MemberBean) session.getAttribute("member");
		String m_Id = member.getM_Id();
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> myQnAFar = dao.myQnAtoFar(m_Id);
		model.addAttribute("qnaToFar", myQnAFar);
		return "user/myQnA";
	}

	
//	@RequestMapping(value = "/qnalist")
//	public String getQnAList(Model model, HttpServletRequest request) {
//		
//		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
//		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
//		List<QnABean> qnalist = dao.list();
//		model.addAttribute("qnalist", qnalist);
//		return "board/qnalist";
//	}
	
	@RequestMapping(value = "/qnamylist/{var}")
	public String getQnAMylist(@PathVariable("var") String var, Model model, HttpServletRequest request) {
		
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		
		if(var.equals("product")) {
			List<QnABean> productMylist = dao.productMylist(member);
			System.out.println("productMylist" + productMylist);
			model.addAttribute("productQlist", productMylist);
		}else if(var.equals("admin")){
			List<QnAadminBean> adminMylist = dao.adminMylist(member);
			System.out.println("adminMylist : "+adminMylist);
			model.addAttribute("adminQlist", adminMylist);
		}
		return "board/qnalist";
	}
	
	
	@RequestMapping("/qnawrite/{var}")
	public String getQnAWrite(@PathVariable("var") String var, Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		String returnUrl = "";
		
		if(var.equals("product")) {
//			List<String> pnoList = dao.pnoList();
//			List<String> titleList = dao.titleList();
			List<QnABean> pnoTitleList = dao.productPnoTitleList();
			model.addAttribute("pnoTitleList", pnoTitleList);
			returnUrl = "board/qnawrite";
		} else if(var.equals("admin")) {
			returnUrl = "board/qnaAdminWrite";
		}
		
		return returnUrl;
	}
	
	

	
	
//	@RequestMapping("/qnawrite/{var}")
//	public String getQnAWrite(Model model, HttpServletRequest request) {
//		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
//		return "board/qnawrite";
//	}

//	import org.hibernate.validator.constraints.NotEmpty; @NotEmpty(message="필수 입력 항목입니다.")
/*	@RequestMapping(value = "/qnainsert", method = RequestMethod.POST)
	@ResponseBody
	public String getQnAInsert(@ModelAttribute @Valid QnABean qna, Model model, HttpServletRequest request, HttpServletResponse response,
			BindingResult result) throws IOException {
		if(result.hasErrors()) {
			return "board/qnawrite";
		}
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("BoardConrtroller insert : "+qna.getQ_Title());
		System.out.println("BoardConrtroller insert : "+qna.getQ_Id());
		
//		MultipartFile img = qna.getQ_Img();
//		if(!img.isEmpty()) {
//			String fileName = img.getOriginalFilename();
//			img.transferTo(new File("D:/upload/" + fileName));
//		}
		
		int n = dao.insert(qna);
		if(n>0) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글이 등록되었습니다.'); location.href='/qnalist';</script>");
			out.close();
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글 등록에 실패하였습니다.'); location.href='/qnalist';</script>");
			out.close();
		}
		return "redirect:/qnalist";
		 
		 
	}*/
	

	
	
	
	@RequestMapping(value = "/qnaPdinsert", method = RequestMethod.POST)
	@ResponseBody
	public String getQnApdInsert(@ModelAttribute @Valid QnABean qna, Model model, HttpServletRequest request, HttpServletResponse response,
			BindingResult result) throws IOException {
//		if(result.hasErrors()) {
//			return "board/qnawrite";
//		}
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("BoardConrtroller insert : "+qna.getQ_Title());
		System.out.println("BoardConrtroller insert : "+qna.getQ_Id());
		
//		MultipartFile img = qna.getQ_Img();
//		if(!img.isEmpty()) {
//			String fileName = img.getOriginalFilename();
//			img.transferTo(new File("D:/upload/" + fileName));
//		}
		int pno = qna.getQ_Pno();
		String title = dao.productTitle(pno);
		qna.setQ_Ptitle(title);
		int n = dao.insert(qna);
		
		if(n>0) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글이 등록되었습니다.'); location.href='/qnalist/product';</script>");
			out.close();
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글 등록에 실패하였습니다.'); history.back(); </script>"); // 되나 확인하기
			out.close();
			out.close();
		}
		return "redirect:/qnalist/product";
		 
		 
	}
	

	@RequestMapping(value = "/qnaAdinsert", method = RequestMethod.POST)
	@ResponseBody
	public String getQnAadInsert(QnAadminBean qna, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
//		if(result.hasErrors()) {
//			return "board/qnawrite";
//		}
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		response.setContentType("text/html;charset=UTF-8");
		
//		MultipartFile img = qna.getQ_Img();
//		if(!img.isEmpty()) {
//			String fileName = img.getOriginalFilename();
//			img.transferTo(new File("D:/upload/" + fileName));
//		}
		
		int n = dao.insertAdmin(qna);
		System.out.println("qna : "+qna);
		
		if(n>0) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글이 등록되었습니다.'); location.href='/qnalist/admin';</script>");
			out.close();
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글 등록에 실패하였습니다.'); history.back(); </script>"); // 되나 확인하기
			out.close();
		}
		return "redirect:/qnalist/admin";
		 
		 
	}
	
	
	
	@RequestMapping({ "/qnamodify/{no}" }) /* , "/qnamodify/my/{no}" */
	public String getQnAModify(@PathVariable int no, Model model, HttpServletRequest request) {
//	@RequestMapping(value = "/qnamodify")
//	public String getQnAModify(@RequestParam int no, Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> qnamodifyrecord = dao.modifyrecord(no);
		List<QnABean> pnoTitleList = dao.productPnoTitleList();
		model.addAttribute("qnamodifyrecord", qnamodifyrecord);
		model.addAttribute("pnoTitleList", pnoTitleList);
		request.setAttribute("qnamodifyrecord", qnamodifyrecord);
		request.setAttribute("pnoTitleList", pnoTitleList);
	
		System.out.println("BoardController qnamodifyrecord : " + qnamodifyrecord);
	
		/* request.setAttribute("qnamodifyrecord", qnamodifyrecord); */
		return "board/qnawrite";
	}
	
	
	@RequestMapping({ "/qnaAdmodify/{no}" }) /* , "/qnamodify/my/{no}" */
	public String getQnAadModify(@PathVariable int no, Model model, HttpServletRequest request) {
//	@RequestMapping(value = "/qnamodify")
//	public String getQnAModify(@RequestParam int no, Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnAadminBean> modifyAdrecord = dao.modifyAdrecord(no);
		model.addAttribute("modifyAdrecord", modifyAdrecord);
	
		System.out.println("BoardController qnamodifyrecord : " + modifyAdrecord);
	
		/* request.setAttribute("qnamodifyrecord", qnamodifyrecord); */
		return "board/qnaAdminWrite";
	}
	
		
	
	@RequestMapping(value = "/qnaupdate")
	@ResponseBody
	public void getQnAUpdate(@ModelAttribute QnABean qna, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		response.setContentType("text/html;charset=UTF-8");
		
		int pno = qna.getQ_Pno();
		String title = dao.productTitle(pno);
		qna.setQ_Ptitle(title);
		
		
		int qnaupdate = dao.update(qna);
		if(qnaupdate>0) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글이 수정되었습니다.'); location.href='/qnalist/product';</script>");
			out.close();
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글 수정에 실패하였습니다.'); location.href='/qnalist/product';</script>");
			out.close();
		}
	}
	
	@RequestMapping(value = "/qnaAdupdate")
	@ResponseBody
	public void getQnAadUpdate(@ModelAttribute QnAadminBean qna, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		response.setContentType("text/html;charset=UTF-8");
		int qnaAdupdate = dao.updateAdmin(qna);
		if(qnaAdupdate>0) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글이 수정되었습니다.'); location.href='/qnalist/admin';</script>");
			out.close();
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글 수정에 실패하였습니다.'); location.href='/qnalist/admin';</script>");
			out.close();
		}
	}
	
	
		
	@RequestMapping({ "/qnadelete/{no}" }) /* , "/qnadelete/my/{no}" */
	public String getQnADelete(@PathVariable int no, Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int qnadelete = dao.delete(no);
		String referer = request.getHeader("Referer");
		if(referer.contains("search")) {
			return "redirect:/qnalist/product"; 
		}else {
			return "redirect:"+ referer;
		}
	}
	
	@RequestMapping({ "/qnaAddelete/{no}" }) /* , "/qnadelete/my/{no}" */
	public String getQnAadDelete(@PathVariable int no, Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int qnadelete = dao.deleteAdmin(no);
		String referer = request.getHeader("Referer");
		if(referer.contains("search")) {
			return "redirect:/qnalist/admin"; 
		}else {
			return "redirect:"+ referer;
		}
	}
	

	
	
	@RequestMapping(value = "/qnawriteadmin")
	public String getQnAadminWrite(@ModelAttribute QnABean qna, Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int adminwrite = dao.adminWrite(qna);
		String referer = request.getHeader("Referer");
		if(referer.contains("search")) {
			return "redirect:/qnalistadmin";
		}else {
			return "redirect:"+ referer;
		}
	}
	
	@RequestMapping(value = "/qnaWriteUpdateAdmin")
	public String getQnAadminWriteUpdate(@ModelAttribute QnABean qna, Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int adminwriteupdate = dao.adminWrite(qna);
		String referer = request.getHeader("Referer");
		if(referer.contains("search")) {
			return "redirect:/qnalistadmin"; 
		}else {
			return "redirect:"+ referer;
		}
	}
	
	@RequestMapping(value = "/qnawriteOadmin")
	public String getQnAWriteO(Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> qnalistadmin = dao.adminWriteO();
		model.addAttribute("qnalistadmin", qnalistadmin);
		return "board/qnaAdminList";
	}
	
	@RequestMapping(value = "/qnawriteXadmin")
	public String getQnAWriteX(Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> qnalistadmin = dao.adminWriteX();
		model.addAttribute("qnalistadmin", qnalistadmin);
		return "board/qnaAdminList";
	}
	
//	@RequestMapping(value = "/searchqna")
//	public String getQnASearch(@RequestParam String searchBox, @RequestParam String searchText, @RequestParam String searchAnswer,
//			QnABean qna, Model model, HttpServletRequest request) {
//		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
//		qna.setQ_Content(searchText);
//		if(searchBox.equals("all")) {
//			List<QnABean> qnalist = dao.searchall(qna);
//			model.addAttribute("qnalist", qnalist);
//		}else if(searchBox.equals("id")){
//			List<QnABean> qnalist = dao.searchId(qna);
//			model.addAttribute("qnalist", qnalist);
//		}else {
//			qna.setQ_About(searchBox);
//			List<QnABean> qnalist = dao.searchEach(qna);
//			model.addAttribute("qnalist", qnalist); 
//		}
//		return "board/qnalist";
//	}
//	
//	@RequestMapping(value = "/searchadminqna")
//	public String getQnASearchAdmin(@RequestParam String searchBox, @RequestParam String searchText, 
//			QnABean qna, Model model, HttpServletRequest request) {
//		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
//		qna.setQ_Content(searchText);
//		if(searchBox.equals("all")) {
//			List<QnABean> qnalistadmin = dao.searchall(qna);
//			model.addAttribute("qnalistadmin", qnalistadmin);
//		}else if(searchBox.equals("id")){
//			List<QnABean> qnalistadmin = dao.searchId(qna);
//			model.addAttribute("qnalistadmin", qnalistadmin);
//		}else {
//			qna.setQ_About(searchBox);
//			List<QnABean> qnalistadmin = dao.searchEach(qna);
//			model.addAttribute("qnalistadmin", qnalistadmin);
//		}
//		return "board/qnaAdmin";
//	}
//		
//		
		
////farmer
	
	@RequestMapping(value = "/farmerQnaList")
	public String getQnAfarmerList(Model model, HttpServletRequest request) {
		FarmerBean farmer  = (FarmerBean) request.getSession().getAttribute("farmer");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		
		System.out.println("1" + farmer.getF_Id());
		List<QnABean> pnoList = dao.productByfarmer(farmer);
		
		System.out.println("pnoList : " +pnoList);
		
		List<QnABean> productQlist = dao.productQlistFarmer(pnoList);
		System.out.println("productQlist" + productQlist);
		model.addAttribute("productQlist", productQlist);

		return "board/qnaFarmerList";
	}
	
	
	@RequestMapping(value = "/farmerQnaWrite")
	public String getQFarmerWrite(@ModelAttribute QnABean qna, Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		System.out.println("!!! : "+qna.getQ_Pid());
		int farmerWrite = dao.farmerWrite(qna);
		String referer = request.getHeader("Referer");
		if(referer.contains("search")) {
			return "redirect:/farmerQnaList";
		}else {
			return "redirect:"+ referer;
		}
	}
	
	@RequestMapping(value = "/farmerQnaWriteUpdate")
	public String getQnFarmerWriteUpdate(@ModelAttribute QnABean qna, Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int adminwriteupdate = dao.farmerWrite(qna);
		String referer = request.getHeader("Referer");
		if(referer.contains("search")) {
			return "redirect:/farmerQnaList"; 
		}else {
			return "redirect:"+ referer;
		}
	}
	
	

//// admin

//	@RequestMapping(value = "/adminQnaList/{var}")
//	public String getQnAList(@PathVariable("var") String var, Model model, HttpServletRequest request) {
//		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
//		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
//	
//		if(var.equals("product")) {
//			List<QnABean> productQlist = dao.productQlist();
//			model.addAttribute("productQlist", productQlist);
//		}else if(var.equals("admin")){
//			List<QnAadminBean> adminQlist = dao.adminQlist();
//			model.addAttribute("adminQlist", adminQlist);
//		}
//		
//		return "board/qnalist";
//	}
	
	@RequestMapping(value = "/adminQnaList/{var}")
	public String getQnAadminlist(@PathVariable("var") String var, Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		
		if(var.equals("product")) {
			List<QnABean> productQlist = dao.productQlist();
			model.addAttribute("productQlist", productQlist);
		}else if(var.equals("admin")){
			List<QnAadminBean> adminQlist = dao.adminQlist();
			model.addAttribute("adminQlist", adminQlist);
		}
		
		return "board/qnaAdminList";
	}
	
}		
		
/*		//글 등록
		@RequestMapping("/insertBoard.do")
		public String insertBoard(BoardVO vo) throws IOException {
			MultipartFile uploadFile = vo.getUploadFile();
			if(!uploadFile.isEmpty()) {
				String fileName = uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File("D:/upload/" + fileName));
			}
			boardService.insertBoard(vo);
			return "getBoardList.do";
		}
		
		
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> qnalist = dao.list();
		List<QnABean> qnamylist = dao.mylist(member);
		model.addAttribute("qnalist", qnalist);
		model.addAttribute("qnamylist", qnamylist);
		return "board/qnalist";
	}*/
	
	

