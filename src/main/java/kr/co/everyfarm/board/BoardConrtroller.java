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
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.user.MemberBean;


@Controller
public class BoardConrtroller {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@RequestMapping(value = "/a")
	public String geta(Model model, HttpServletRequest request) {
		return "board/a";
	}
	
//	@RequestMapping(value = "/qnalist")
//	public String getQnAList(Model model, HttpServletRequest request) {
//		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
//		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
//		List<QnABean> productQlist = dao.productQlist();
//		model.addAttribute("productQlist", productQlist);
//		return "board/qnalist";
//	}
	
	@RequestMapping(value = "/qnalist")
	public String boardList(PagingBean vo, Model model, HttpServletRequest request
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		
		
		int total = dao.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingBean(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		/* model.addAttribute("viewAll", boardService.selectBoard(vo)); */
		List<QnABean> productQlist = dao.selectBoard(vo);
		System.out.println("productQlist : " + productQlist);
		model.addAttribute("productQlist", productQlist);
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
	
	@RequestMapping(value = "/qnamylist")
	public String getQnAMylist( Model model, HttpServletRequest request) {
		
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
	
		List<QnABean> productMylist = dao.productMylist(member);
		System.out.println("productMylist" + productMylist);
		model.addAttribute("productQlist", productMylist);
	
	
		return "board/qnalist";
	}
	
	
	@RequestMapping("/qnawrite")
	public String getQnAWrite(Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> pnoTitleList = dao.productPnoTitleList();
		model.addAttribute("pnoTitleList", pnoTitleList);
		model.addAttribute("qna", new QnABean());
		return "board/qnawrite";
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
	

	
	
	
	@RequestMapping(value = "/qnainsert", method = RequestMethod.POST)
	public String getQnApdInsert( @ModelAttribute("qna") @Valid QnABean qna, BindingResult result, Model model, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		response.setContentType("text/html;charset=UTF-8");
		if(result.hasErrors()){
			List<QnABean> pnoTitleList = dao.productPnoTitleList();
			model.addAttribute("pnoTitleList", pnoTitleList);
			return "board/qnawrite";
		}
		System.out.println("BoardConrtroller insert : "+qna.getQ_Title());
		System.out.println("BoardConrtroller insert : "+qna.getQ_Id());
		String returnUrl = "";
		
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
			returnUrl = "redirect:/qnalist";
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글이 등록되었습니다.'); location.href='/qnalist';</script>");
			out.close();
		}else {
			returnUrl = "redirect:/qnawrite";
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글 등록에 실패하였습니다.'); history.back(); </script>"); // 되나 확인하기
			out.close();
		}
		
		return returnUrl;		 
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
	
	
	
	
	@RequestMapping(value = "/qnaupdate")
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
			out.println("<script>alert('글이 수정되었습니다.'); location.href='/qnalist';</script>");
			out.close();
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글 수정에 실패하였습니다.'); location.href='/qnalist';</script>");
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
			return "redirect:/qnalist"; 
		}else {
			return "redirect:"+ referer;
		}
	}
	



	
	
//	@RequestMapping(value = "/qnawriteadmin")
//	public String getQnAadminWrite(@ModelAttribute QnABean qna, Model model, HttpServletRequest request) {
//		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
//		int adminwrite = dao.adminWrite(qna);
//		String referer = request.getHeader("Referer");
//		if(referer.contains("search")) {
//			return "redirect:/qnalistadmin";
//		}else {
//			return "redirect:"+ referer;
//		}
//	}
//	
//	@RequestMapping(value = "/qnaWriteUpdateAdmin")
//	public String getQnAadminWriteUpdate(@ModelAttribute QnABean qna, Model model, HttpServletRequest request) {
//		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
//		int adminwriteupdate = dao.adminWrite(qna);
//		String referer = request.getHeader("Referer");
//		if(referer.contains("search")) {
//			return "redirect:/qnalistadmin"; 
//		}else {
//			return "redirect:"+ referer;
//		}
//	}
//	
//	@RequestMapping(value = "/qnawriteOadmin")
//	public String getQnAWriteO(Model model, HttpServletRequest request) {
//		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
//		List<QnABean> qnalistadmin = dao.adminWriteO();
//		model.addAttribute("qnalistadmin", qnalistadmin);
//		return "board/qnaAdminList";
//	}
//	
//	@RequestMapping(value = "/qnawriteXadmin")
//	public String getQnAWriteX(Model model, HttpServletRequest request) {
//		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
//		List<QnABean> qnalistadmin = dao.adminWriteX();
//		model.addAttribute("qnalistadmin", qnalistadmin);
//		return "board/qnaAdminList";
//	}
	
	
//	@RequestMapping(value = "/qnalist")
//	public String boardddList(PagingBean vo, Model model, HttpServletRequest request
//			, @RequestParam(value="nowPage", required=false)String nowPage
//			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
//		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
//		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
//		
//		
//		int total = dao.countBoard();
//		if (nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "10";
//		} else if (nowPage == null) {
//			nowPage = "1";
//		} else if (cntPerPage == null) { 
//			cntPerPage = "10";
//		}
//		vo = new PagingBean(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//		model.addAttribute("paging", vo);
//		/* model.addAttribute("viewAll", boardService.selectBoard(vo)); */
//		List<QnABean> productQlist = dao.selectBoard(vo);
//		System.out.println("productQlist : " + productQlist);
//		model.addAttribute("productQlist", productQlist);
//		return "board/qnalist";
//	}
	
	@RequestMapping(value = "/searchqna")
	public String getQnASearch(PagingBean vo, @RequestParam String searchBox, @RequestParam String searchText, 
			@RequestParam String searchAnswer, @RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage, QnABean qna, Model model, HttpServletRequest request) {
			
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int total = dao.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingBean(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		
		
		qna.setQ_Content(searchText);
		if(searchAnswer.equals("o")) {
			qna.setQ_Answer(true);
		} else if(searchAnswer.equals("x")) {
			qna.setQ_Answer(false);
		}
		if(searchBox.equals("all")) {
			List<QnABean> qnalist = dao.searchall(qna);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("pno")){
			List<QnABean> qnalist = dao.searchpno(qna);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("ptitle")){
			List<QnABean> qnalist = dao.searchptitle(qna);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("content")){
			List<QnABean> qnalist = dao.searchcontent(qna);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("id")){
			List<QnABean> qnalist = dao.searchId(qna);
			model.addAttribute("productQlist", qnalist);
		}
		return "board/qnalist";
	}
	
	@RequestMapping(value = "/farmerQnasearch")
	public String getQnAfarmerSearch(@RequestParam String searchBox, @RequestParam String searchText, @RequestParam String searchAnswer,
			QnABean qna, Model model, HttpServletRequest request) {
			
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		qna.setQ_Content(searchText);
		if(searchAnswer.equals("o")) {
			qna.setQ_Answer(true);
		} else if(searchAnswer.equals("x")) {
			qna.setQ_Answer(false);
		}
		if(searchBox.equals("all")) {
			List<QnABean> qnalist = dao.searchall(qna);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("pno")){
			List<QnABean> qnalist = dao.searchpno(qna);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("ptitle")){
			List<QnABean> qnalist = dao.searchptitle(qna);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("content")){
			List<QnABean> qnalist = dao.searchcontent(qna);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("id")){
			List<QnABean> qnalist = dao.searchId(qna);
			model.addAttribute("productQlist", qnalist);
		}
		return "board/qnaFarmerList";
	}
	
	@RequestMapping(value = "/adminQnasearch")
	public String getQnAadminSearch(@RequestParam String searchBox, @RequestParam String searchText, @RequestParam String searchAnswer,
			QnABean qna, Model model, HttpServletRequest request) {
			
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		qna.setQ_Content(searchText);
		if(searchAnswer.equals("o")) {
			qna.setQ_Answer(true);
		} else if(searchAnswer.equals("x")) {
			qna.setQ_Answer(false);
		}
		if(searchBox.equals("all")) {
			List<QnABean> qnalist = dao.searchall(qna);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("pno")){
			List<QnABean> qnalist = dao.searchpno(qna);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("ptitle")){
			List<QnABean> qnalist = dao.searchptitle(qna);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("content")){
			List<QnABean> qnalist = dao.searchcontent(qna);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("id")){
			List<QnABean> qnalist = dao.searchId(qna);
			model.addAttribute("productQlist", qnalist);
		}
		return "board/qnaAdminList";
	}
	
//	@RequestMapping(value = "/searchqna/{var}")
//	public String getQnASearch(@PathVariable("var") String var, @RequestParam String searchBox, @RequestParam String searchText, @RequestParam String searchAnswer,
//			QnABean qna, Model model, HttpServletRequest request) {
//		
//		String returnUrl = "";
//		if(var.equals("member")) {
//			returnUrl = "board/qnalist";
//		} else if (var.equals("farmer")) {
//			returnUrl = "board/farmerQnaList";
//		} else if (var.equals("admin")) {
//			returnUrl = "board/adminQnaList";
//		}
//		
//		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
//		qna.setQ_Content(searchText);
//		if(searchAnswer.equals("o")) {
//			qna.setQ_Answer(true);
//		} else if(searchAnswer.equals("x")) {
//			qna.setQ_Answer(false);
//		}
//		if(searchBox.equals("all")) {
//			List<QnABean> qnalist = dao.searchall(qna);
//			model.addAttribute("productQlist", qnalist);
//		}else if(searchBox.equals("pno")){
//			List<QnABean> qnalist = dao.searchpno(qna);
//			model.addAttribute("productQlist", qnalist);
//		}else if(searchBox.equals("ptitle")){
//			List<QnABean> qnalist = dao.searchptitle(qna);
//			model.addAttribute("productQlist", qnalist);
//		}else if(searchBox.equals("content")){
//			List<QnABean> qnalist = dao.searchcontent(qna);
//			model.addAttribute("productQlist", qnalist);
//		}else if(searchBox.equals("id")){
//			List<QnABean> qnalist = dao.searchId(qna);
//			model.addAttribute("productQlist", qnalist);
//		}
//		return returnUrl;
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
	
	@RequestMapping(value = "/adminQnaList")
	public String getQnAadminlist(Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> productQlist = dao.productQlist();
		model.addAttribute("productQlist", productQlist);
		return "board/qnaAdminList";
	}
	
	@RequestMapping({ "/adminMemQnaModify/{no}" }) /* , "/qnamodify/my/{no}" */
	public String getQnAadminMemModify(@PathVariable int no, Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> qnamodifyrecord = dao.modifyrecord(no);
		List<QnABean> pnoTitleList = dao.productPnoTitleList();
		model.addAttribute("qnamodifyrecord", qnamodifyrecord);
		model.addAttribute("pnoTitleList", pnoTitleList);
		request.setAttribute("qnamodifyrecord", qnamodifyrecord);
		request.setAttribute("pnoTitleList", pnoTitleList);
	
		System.out.println("BoardController qnamodifyrecord : " + qnamodifyrecord);
	
		/* request.setAttribute("qnamodifyrecord", qnamodifyrecord); */
		return "board/qnaAdminWrite";
	}
	
	@RequestMapping(value = "/adminMemQnaupdate")
	public void getQnAadminMemUpdate(@ModelAttribute QnABean qna, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		response.setContentType("text/html;charset=UTF-8");
		
		int pno = qna.getQ_Pno();
		String title = dao.productTitle(pno);
		qna.setQ_Ptitle(title);
		
		
		int qnaupdate = dao.update(qna);
		if(qnaupdate>0) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글이 수정되었습니다.'); location.href='/adminQnaList';</script>");
			out.close();
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글 수정에 실패하였습니다.'); location.href='/adminQnaList';</script>");
			out.close();
		}
	}
	
	@RequestMapping(value = "/adminFarmerQnaUpdate")
	public String getQnadminFarmerWriteUpdate(@ModelAttribute QnABean qna, Model model, HttpServletRequest request) {
		
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int adminwriteupdate = dao.farmerWrite(qna);
		String referer = request.getHeader("Referer");
		if(referer.contains("search")) {
			return "redirect:/adminQnaList"; 
		}else {
			return "redirect:"+ referer;
		}
	}
	
	@RequestMapping({ "/adminQnadelete/{no}" }) /* , "/qnadelete/my/{no}" */
	public String getQnAadminDelete(@PathVariable int no, Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int qnadelete = dao.delete(no);
		String referer = request.getHeader("Referer");
		if(referer.contains("search")) {
			return "redirect:/qnalist"; 
		}else {
			return "redirect:"+ referer;
		}
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
	
	

