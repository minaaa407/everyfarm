package kr.co.everyfarm.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
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
import org.springframework.web.multipart.MultipartFile;

import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.user.MemberBean;


@Controller
public class BoardConrtroller {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
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
		List<QnABean> productQlist = dao.selectBoard(vo);
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
		
		HttpSession session = request.getSession();
	    String root_path = session.getServletContext().getRealPath("/");
		
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		response.setContentType("text/html;charset=UTF-8");
		if(result.hasErrors()){
			List<QnABean> pnoTitleList = dao.productPnoTitleList();
			model.addAttribute("pnoTitleList", pnoTitleList);
			return "board/qnawrite";
		}
		
		String returnUrl = "";
		
		qna.setQ_Img(img.getOriginalFilename());
		
		int pno = qna.getQ_Pno();
		String title = dao.productTitle(pno);
		String pid = dao.productId(pno);
		qna.setQ_Ptitle(title);
		qna.setQ_Pid(pid);
		int n = dao.insert(qna);
		int qnomax = dao.qnomax();
		
		String path = root_path + "resources/upload/qna/" + qnomax + "/";
	    ServletContext servletContext = request.getSession().getServletContext();
	    String realPath = servletContext.getRealPath("/resources");
	    String savePath = realPath + "/upload/qna/" + qnomax + "/";
	    path = savePath;
		
	    
	    File Folder = new File(path);
	      if (!Folder.exists()) {
	         try {
	            Folder.mkdir(); // 폴더 생성합니다.
	         } catch (Exception e) {
	            e.getStackTrace();
	         }
	      } else {
	      }

	    String safeFile;
	    String originFileName;
	    long fileSize = 0;

	 
	    originFileName =  img.getOriginalFilename(); // 원본 파일 명
	    fileSize = img.getSize(); // 파일 사이즈
	    safeFile = path + originFileName;
	      
	    try {
	       if (fileSize > 10) {
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

		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> qnamodifyrecord = dao.modifyrecord(no);
		List<QnABean> pnoTitleList = dao.productPnoTitleList();
		model.addAttribute("qnamodifyrecord", qnamodifyrecord);
		model.addAttribute("pnoTitleList", pnoTitleList);
		request.setAttribute("qnamodifyrecord", qnamodifyrecord);
		request.setAttribute("pnoTitleList", pnoTitleList);
	
		return "board/qnawrite";
	}
	
	
	
	
	@RequestMapping(value = "/qnaupdate")
	public void getQnAUpdate(@ModelAttribute("qna") @Valid QnABean qna, BindingResult result, 
			@RequestParam(value = "img", required = false) MultipartFile img, Model model, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
	    String root_path = session.getServletContext().getRealPath("/");
		
		if(img.isEmpty() == false) {
			qna.setQ_Img(img.getOriginalFilename());
		}
		
		int pno = qna.getQ_Pno();
		String title = dao.productTitle(pno);
		String pid = dao.productId(pno);
		qna.setQ_Ptitle(title);
		qna.setQ_Pid(pid);
		int qnaupdate = dao.update(qna);
		       
		if(img.isEmpty() == false) {
			System.out.println("false");
			int qno = qna.getQ_No();
	
			String path = root_path + "resources/upload/qna/" + qno + "/";
		    ServletContext servletContext = request.getSession().getServletContext();
		    String realPath = servletContext.getRealPath("/resources");
		    String savePath = realPath + "/upload/qna/" + qno + "/";
		    path = savePath;
			
		    Cookie[] cookie = request.getCookies();
		    for (int i = 0; i < cookie.length; i++) {
		       cookie[i].setMaxAge(0);
		    }
	
			String safeFile="";
			String originFileName="";
			long fileSize = 0;

			originFileName = img.getOriginalFilename(); // 원본 파일 명
			fileSize = img.getSize(); // 파일 사이즈
		    safeFile = path + originFileName;
			File oldfile = new File(safeFile);

			try {

				if (fileSize > 10) {
					if (oldfile.exists()) {
						oldfile.delete();
						
					    File Folder = new File(path);
					      if (!Folder.exists()) {
					         try {
					            Folder.mkdir(); // 폴더 생성합니다.
					         } catch (Exception e) {
					            e.getStackTrace();
					         }
					      } else {
					      }
			        }
			        img.transferTo(new File(safeFile));
			        model.addAttribute("safeFile", safeFile);
			    }

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
			    e.printStackTrace();
			}
		}
		
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
		

		List<QnABean> productQlist = dao.productQlistFarmer(vo);
		model.addAttribute("productQlist", productQlist);

		return "board/qnaFarmerList";
	}
	
	
	@RequestMapping(value = "/farmerQnaWrite")
	public String getQFarmerWrite(@ModelAttribute QnABean qna, Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
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
	
		return "board/qnaAdminWrite";
	}
	

	
	
	@RequestMapping(value = "/adminMemQnaupdate")
	public void getQnAadminMemUpdate(@ModelAttribute("qna") @Valid QnABean qna, BindingResult result, 
			@RequestParam(value = "img", required = false) MultipartFile img, Model model, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		response.setContentType("text/html;charset=UTF-8");
		String returnUrl = "";
		HttpSession session = request.getSession();
	    String root_path = session.getServletContext().getRealPath("/");
		
		if(img.isEmpty() == false) {
			qna.setQ_Img(img.getOriginalFilename());
			}
		int qnaupdate = dao.updateAdmin(qna);
		
		if(img.isEmpty() == false) {
			
			System.out.println("false");
			int qno = qna.getQ_No();
	
			String path = root_path + "resources/upload/qna/" + qno + "/";
		    ServletContext servletContext = request.getSession().getServletContext();
		    String realPath = servletContext.getRealPath("/resources");
		    String savePath = realPath + "/upload/qna/" + qno + "/";
		    path = savePath;
			
		    Cookie[] cookie = request.getCookies();
		    for (int i = 0; i < cookie.length; i++) {
		       cookie[i].setMaxAge(0);
		    }
	
			String safeFile="";
			String originFileName="";
			long fileSize = 0;

			originFileName = img.getOriginalFilename(); // 원본 파일 명
			fileSize = img.getSize(); // 파일 사이즈
		    safeFile = path + originFileName;
			File oldfile = new File(safeFile);

			try {

				if (fileSize > 10) {
					if (oldfile.exists()) {
						oldfile.delete();
						
					    File Folder = new File(path);
					      if (!Folder.exists()) {
					         try {
					            Folder.mkdir(); // 폴더 생성합니다.
					         } catch (Exception e) {
					            e.getStackTrace();
					         }
					      } else {
					      }
			        }
			        img.transferTo(new File(safeFile));
			        model.addAttribute("safeFile", safeFile);
			    }

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
			    e.printStackTrace();
			}
		
		}
		
		
		if(qnaupdate>0) {
			PrintWriter out = response.getWriter();
			out.println("<script>location.href='/adminQnaList';</script>");
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
		
	

