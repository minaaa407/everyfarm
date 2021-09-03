package kr.co.everyfarm.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;

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
	
	
	@RequestMapping(value = "/qnamylist")
	public String getQnAMylist(PagingBean vo, Model model, HttpServletRequest request
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int total = dao.countMyqna(member);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingBean(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setF_Id(member.getM_Id());
		model.addAttribute("paging", vo);
		dao.rownum();
		List<QnABean> productMylist = dao.productMylist(vo);
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
	
	

	
	

		 
		 

	

	
	
	
	@RequestMapping(value = "/qnainsert", method = RequestMethod.POST)
	public String getQnApdInsert( @ModelAttribute("qna") @Valid QnABean qna, BindingResult result, 
			@RequestParam(value = "img", required = false) MultipartFile img, Model model, 
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
		qna.setQ_Img(img.getOriginalFilename());
		
		
		int pno = qna.getQ_Pno();
		String title = dao.productTitle(pno);
		String pid = dao.productId(pno);
		qna.setQ_Ptitle(title);
		qna.setQ_Pid(pid);
		int n = dao.insert(qna);
		int qnomax = dao.qnomax();
		String path = "D:\\EveryFarm\\.metadata\\.plugins\\org.eclipse.wst.server.core\\"
				+ "tmp0\\wtpwebapps\\everyfarm\\resources\\upload\\qna\\" + qnomax + "\\";
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath = servletContext.getRealPath("/resource");
		realPath = "D:\\EveryFarm\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\everyfarm\\resource";
		String mPath = "\\src\\main\\webapp\\resources\\upload\\qna\\" + qnomax + "\\";
		int aa = realPath.indexOf("\\.");
		String pre = realPath.substring(0, aa);
		String savePath = pre + "\\everyfarm" + mPath;
		path = savePath;

		File Folder = new File(path);
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}

		String safeFile="";
		String originFileName="";
		long fileSize = 0;

	
			originFileName = img.getOriginalFilename(); // 원본 파일 명
			fileSize = img.getSize(); // 파일 사이즈
			safeFile = path + originFileName;
			try {
			if (fileSize > 10) { /* 100 */
					img.transferTo(new File(safeFile));
				}

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		

		
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
	



	
	
	@RequestMapping(value = "/searchqna")
	public String getQnASearch(PagingBean vo, @RequestParam String searchBox, @RequestParam String searchText, 
			@RequestParam(required=false) String searchAnswer, @RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage, QnABean qna, Model model, HttpServletRequest request) {
			
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int total = 0;
		if(searchAnswer.equals("o")) {
			qna.setQ_Answer(true);
		} else if(searchAnswer.equals("x")) {
			qna.setQ_Answer(false);
		}
		qna.setQ_Content(searchText);
		if(searchBox.equals("all")) {
			List<QnABean> qnalist = dao.searchall(qna);
			total = qnalist.size();
		}else if(searchBox.equals("pno")){
			List<QnABean> qnalist = dao.searchpno(qna);
			total = qnalist.size();
		}else if(searchBox.equals("ptitle")){
			List<QnABean> qnalist = dao.searchptitle(qna);
			total = qnalist.size();
		}else if(searchBox.equals("content")){
			List<QnABean> qnalist = dao.searchcontent(qna);
			total = qnalist.size();
		}else if(searchBox.equals("id")){
			List<QnABean> qnalist = dao.searchId(qna);
			total = qnalist.size();
		}
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		vo = new PagingBean(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setQ_Ptitle(searchBox);
		vo.setQ_Content(searchText);
		if(searchAnswer.equals("o") || searchAnswer.equals("true")) {
			vo.setQ_Answer(true);
		} else if(searchAnswer.equals("x") || searchAnswer.equals("false")) {
			vo.setQ_Answer(false);
		}

		if(searchBox.equals("all")) {
			dao.rownum();
			List<QnABean> qnalist = dao.searchAllPaging(vo);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("pno")){
			dao.rownum();
			List<QnABean> qnalist = dao.searchPnoPaging(vo);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("ptitle")){
			dao.rownum();
			List<QnABean> qnalist = dao.searchPtitlePaging(vo);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("content")){
			dao.rownum();
			List<QnABean> qnalist = dao.searchContentPaging(vo);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("id")){
			dao.rownum();
			List<QnABean> qnalist = dao.searchIdPaging(vo);
			model.addAttribute("productQlist", qnalist);
		}
		model.addAttribute("paging", vo);
		return "board/qnalist";
	}
	
	@RequestMapping(value = "/farmerQnasearch")
	public String getQnAfarmerSearch(PagingBean vo, @RequestParam String searchBox, @RequestParam String searchText, 
			@RequestParam(required=false) String searchAnswer, @RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage, QnABean qna, Model model, HttpServletRequest request) {
		System.out.println("1");
		FarmerBean farmer  = (FarmerBean) request.getSession().getAttribute("farmer");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int total = 0;
		if(searchAnswer.equals("o")) {
			qna.setQ_Answer(true);
		} else if(searchAnswer.equals("x")) {
			qna.setQ_Answer(false);
		}
		qna.setQ_Content(searchText);
		qna.setQ_Pid(farmer.getF_Id());
		if(searchBox.equals("all")) {
			List<QnABean> qnalist = dao.searchallfarmer(qna);
			total = qnalist.size();
		}else if(searchBox.equals("pno")){
			List<QnABean> qnalist = dao.searchpnofarmer(qna);
			total = qnalist.size();
		}else if(searchBox.equals("ptitle")){
			List<QnABean> qnalist = dao.searchptitlefarmer(qna);
			total = qnalist.size();
		}else if(searchBox.equals("content")){
			List<QnABean> qnalist = dao.searchcontentfarmer(qna);
			total = qnalist.size();
		}else if(searchBox.equals("id")){
			List<QnABean> qnalist = dao.searchIdfarmer(qna);
			total = qnalist.size();
		}
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		vo = new PagingBean(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setQ_Ptitle(searchBox);
		vo.setQ_Content(searchText);
		vo.setF_Id(farmer.getF_Id());
		if(searchAnswer.equals("o") || searchAnswer.equals("true")) {
			vo.setQ_Answer(true);
		} else if(searchAnswer.equals("x") || searchAnswer.equals("false")) {
			vo.setQ_Answer(false);
		}

		if(searchBox.equals("all")) {
			dao.rownum();
			List<QnABean> qnalist = dao.searchAllPagingfarmer(vo);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("pno")){
			dao.rownum();
			List<QnABean> qnalist = dao.searchPnoPagingfarmer(vo);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("ptitle")){
			dao.rownum();
			List<QnABean> qnalist = dao.searchPtitlePagingfarmer(vo);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("content")){
			dao.rownum();
			List<QnABean> qnalist = dao.searchContentPagingfarmer(vo);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("id")){
			dao.rownum();
			List<QnABean> qnalist = dao.searchIdPagingfarmer(vo);
			model.addAttribute("productQlist", qnalist);
		}
		model.addAttribute("paging", vo);
		return "board/qnaFarmerList";
	}
	
	@RequestMapping(value = "/adminQnasearch")
	public String getQnAadminSearch(PagingBean vo, @RequestParam String searchBox, @RequestParam String searchText, 
			@RequestParam(required=false) String searchAnswer, @RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage, QnABean qna, Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int total = 0;
		if(searchAnswer.equals("o")) {
			qna.setQ_Answer(true);
		} else if(searchAnswer.equals("x")) {
			qna.setQ_Answer(false);
		}
		qna.setQ_Content(searchText);
		if(searchBox.equals("all")) {
			List<QnABean> qnalist = dao.searchall(qna);
			total = qnalist.size();
		}else if(searchBox.equals("pno")){
			List<QnABean> qnalist = dao.searchpno(qna);
			total = qnalist.size();
		}else if(searchBox.equals("ptitle")){
			List<QnABean> qnalist = dao.searchptitle(qna);
			total = qnalist.size();
		}else if(searchBox.equals("content")){
			List<QnABean> qnalist = dao.searchcontent(qna);
			total = qnalist.size();
		}else if(searchBox.equals("id")){
			List<QnABean> qnalist = dao.searchId(qna);
			total = qnalist.size();
		}
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		
		vo = new PagingBean(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setQ_Ptitle(searchBox);
		vo.setQ_Content(searchText);
		if(searchAnswer.equals("o") || searchAnswer.equals("true")) {
			vo.setQ_Answer(true);
		} else if(searchAnswer.equals("x") || searchAnswer.equals("false")) {
			vo.setQ_Answer(false);
		}

		if(searchBox.equals("all")) {
			dao.rownum();
			List<QnABean> qnalist = dao.searchAllPaging(vo);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("pno")){
			dao.rownum();
			List<QnABean> qnalist = dao.searchPnoPaging(vo);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("ptitle")){
			dao.rownum();
			List<QnABean> qnalist = dao.searchPtitlePaging(vo);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("content")){
			dao.rownum();
			List<QnABean> qnalist = dao.searchContentPaging(vo);
			model.addAttribute("productQlist", qnalist);
		}else if(searchBox.equals("id")){
			dao.rownum();
			List<QnABean> qnalist = dao.searchIdPaging(vo);
			model.addAttribute("productQlist", qnalist);
		}
		model.addAttribute("paging", vo);
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
	
//	@RequestMapping(value = "/qnalist")
//	public String boardfeeList(PagingBean vo, Model model, HttpServletRequest request
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
	
	@RequestMapping(value = "/farmerQnaList")
	public String getQnAfarmerList(PagingBean vo, Model model, HttpServletRequest request
		, @RequestParam(value="nowPage", required=false)String nowPage
		, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		FarmerBean farmer  = (FarmerBean) request.getSession().getAttribute("farmer");
		
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		

		int total = dao.countfarmerQnaList(farmer);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingBean(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setF_Id(farmer.getF_Id());
		model.addAttribute("paging", vo);
		
		dao.rownum();
		
//		List<QnABean> pnoList = dao.productByfarmer(vo);
//		List<QnABean> productQlist = dao.productQlistFarmer(pnoList);
		List<QnABean> productQlist = dao.productQlistFarmer(vo);
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
	public String getQnAadminlist(PagingBean vo, Model model, HttpServletRequest request
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
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
		List<QnABean> productQlist = dao.selectBoard(vo);
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
	
	

