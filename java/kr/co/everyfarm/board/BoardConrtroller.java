package kr.co.everyfarm.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		return "board/qnawrite"; // redirect 쓰면 오류남
	}
	
	@RequestMapping(value = "/qnainsert", method = RequestMethod.POST)
	public String getQnAInsert(QnABean qna, Model model, HttpServletRequest request) throws IOException {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		
//		MultipartFile img = qna.getQ_Img();
//		if(!img.isEmpty()) {
//			String fileName = img.getOriginalFilename();
//			img.transferTo(new File("D:/upload/" + fileName));
//		}
		
		int n = dao.insert(qna);
		return "redirect:/qnalist";
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
	public String getQnAUpdate(QnABean qna, Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		System.out.println("BoardController 큐앤에이 넘버 : " + qna.getQ_No());
		int qnaupdate = dao.update(qna);
		System.out.println("BoardController qnaupdate: " + qnaupdate);
		return "redirect:/qnalist";
	}
		
	@RequestMapping({"/qnadelete/{no}", "/qnadelete/my/{no}"})
	public String getQnADelete(@PathVariable int no, Model model, HttpServletRequest request) {
		MemberBean member  = (MemberBean) request.getSession().getAttribute("member");
		QnADAO dao = sqlSessionTemplate.getMapper(QnADAO.class);
		int qnadelete = dao.delete(no);
		return "redirect:/qnalist";
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
	
	

