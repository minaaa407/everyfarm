package kr.co.everyfarm.board;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

@Controller
public class ReviewController {
	
  @Autowired
  private SqlSessionTemplate sqlSessionTemplate;
  
  
  @RequestMapping("/reviewList")
  public String getReviewList(Model model) {
    ReviewDAO dao = (ReviewDAO)this.sqlSessionTemplate.getMapper(ReviewDAO.class);
    List<ReviewVO> list = dao.list();
    System.out.println(list);
    model.addAttribute("revList", list);
    return "board/reviewList";
  }
  
  @RequestMapping("/reviewWrite")
  public String getReviewWrite() {
    return "board/reviewWrite";
  }
  
  @RequestMapping("reviewInsert")
  public String reviewInsert(ReviewVO vo) {
    ReviewDAO dao = (ReviewDAO)this.sqlSessionTemplate.getMapper(ReviewDAO.class);
    int n = dao.insert(vo);
    return "redirect:/reviewList";
  }
  
  @RequestMapping({"/fileUpload"})
  public String fileUpload(Model model, MultipartRequest multipartRequest, HttpServletRequest request) throws IOException {
    MultipartFile imgfile = multipartRequest.getFile("Filedata");
    Calendar cal = Calendar.getInstance();
    String fileName = imgfile.getOriginalFilename();
    String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
    String replaceName = String.valueOf(cal.getTimeInMillis()) + fileType;
    String path = String.valueOf(request.getSession().getServletContext().getRealPath("/")) + File.separator + "resources/upload";
    FileUpload.fileUpload(imgfile, path, replaceName);
    model.addAttribute("path", path);
    model.addAttribute("filename", replaceName);
    return "file_upload";
  }
}
