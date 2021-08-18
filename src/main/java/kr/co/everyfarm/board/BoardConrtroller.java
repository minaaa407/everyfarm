package kr.co.everyfarm.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.everyfarm.user.MemberBean;


@Controller
public class BoardConrtroller {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/qnalist")
	public String getQnAList(Model model, HttpServletRequest request) {
		
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> qnalist = dao.list();
		model.addAttribute("qnalist", qnalist);
		return "board/qnalist";
	}
	
	@RequestMapping(value = "/qnamylist")
	public String getQnAMylist(Model model, HttpServletRequest request) {
		
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> qnamylist = dao.mylist(member);
		model.addAttribute("qnamylist", qnamylist);
		return "board/qnalist";
	}
	
	@RequestMapping("/qnawrite")
	public String getQnAWrite(Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		return "board/qnawrite";
	}

//	import org.hibernate.validator.constraints.NotEmpty; @NotEmpty(message="필수 입력 항목입니다.")
	@RequestMapping(value = "/qnainsert", method = RequestMethod.POST)
	@ResponseBody
	public void getQnAInsert(@ModelAttribute QnABean qna, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
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
			out.flush();
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글 등록에 실패하였습니다.'); location.href='/qnalist';</script>");
			out.flush();
		}
	}
	
	
	@RequestMapping({"/qnamodify/{no}", "/qnamodify/my/{no}"})
	public String getQnAModify(@PathVariable int no, Model model, HttpServletRequest request) {
//	@RequestMapping(value = "/qnamodify")
//	public String getQnAModify(@RequestParam int no, Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> qnamodifyrecord = dao.modifyrecord(no);
		System.out.println("BoardController qnamodifyrecord : " + qnamodifyrecord);
		model.addAttribute("qnamodifyrecord", qnamodifyrecord);
		/* request.setAttribute("qnamodifyrecord", qnamodifyrecord); */
		return "board/qnawrite";
	}
		
	
	@RequestMapping(value = "/qnaupdate")
	@ResponseBody
	public void getQnAUpdate(@ModelAttribute QnABean qna, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		response.setContentType("text/html;charset=UTF-8");
		int qnaupdate = dao.update(qna);
		if(qnaupdate>0) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글이 수정되었습니다.'); location.href='/qnalist';</script>");
			out.flush();
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('글 수정에 실패하였습니다.'); location.href='/qnalist';</script>");
			out.flush();
		}
	}
		
	@RequestMapping({"/qnadelete/{no}", "/qnadelete/my/{no}"})
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
	
	@RequestMapping(value = "/qnalistadmin")
	public String getQnAadminlist(Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> qnalistadmin = dao.list();
		model.addAttribute("qnalistadmin", qnalistadmin);
		return "board/qnaAdmin";
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
		return "board/qnaAdmin";
	}
	
	@RequestMapping(value = "/qnawriteXadmin")
	public String getQnAWriteX(Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		List<QnABean> qnalistadmin = dao.adminWriteX();
		model.addAttribute("qnalistadmin", qnalistadmin);
		return "board/qnaAdmin";
	}
	
	@RequestMapping(value = "/searchqna")
	public String getQnASearch(@RequestParam String searchBox, @RequestParam String searchText, 
			QnABean qna, Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		qna.setQ_Content(searchText);
		if(searchBox.equals("all")) {
			List<QnABean> qnalist = dao.searchall(qna);
			model.addAttribute("qnalist", qnalist);
		}else if(searchBox.equals("id")){
			List<QnABean> qnalist = dao.searchId(qna);
			model.addAttribute("qnalist", qnalist);
		}else {
			qna.setQ_About(searchBox);
			List<QnABean> qnalist = dao.searchEach(qna);
			model.addAttribute("qnalist", qnalist); 
		}
		return "board/qnalist";
	}
	
	@RequestMapping(value = "/searchadminqna")
	public String getQnASearchAdmin(@RequestParam String searchBox, @RequestParam String searchText, 
			QnABean qna, Model model, HttpServletRequest request) {
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		qna.setQ_Content(searchText);
		if(searchBox.equals("all")) {
			List<QnABean> qnalistadmin = dao.searchall(qna);
			model.addAttribute("qnalistadmin", qnalistadmin);
		}else if(searchBox.equals("id")){
			List<QnABean> qnalistadmin = dao.searchId(qna);
			model.addAttribute("qnalistadmin", qnalistadmin);
		}else {
			qna.setQ_About(searchBox);
			List<QnABean> qnalistadmin = dao.searchEach(qna);
			model.addAttribute("qnalistadmin", qnalistadmin);
		}
		return "board/qnaAdmin";
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
	
	

