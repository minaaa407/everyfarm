package kr.co.everyfarm.board;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.everyfarm.user.MemberBean;

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
	public String getReviewMyList(Model model,HttpServletRequest req,ReviewBean reviewBea,HttpSession session) {
		
		MemberBean mBean = (MemberBean) session.getAttribute("member");
		String m_Id = mBean.getM_Id();
		
		ReviewDAO dao = sqlSessionTemplate.getMapper(ReviewDAO.class);
		List<ReviewBean> list = dao.mylist(m_Id);
		model.addAttribute("revList", list);
		return "user/myReview";
		
	}
	
	//다중파일업로드
	@RequestMapping("/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 /////////////////
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/resources/photo_upload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


	
	
	
	
	
	
	
	
}
