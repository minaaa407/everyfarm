package kr.co.everyfarm.board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@Controller
public class ReviewController {
	
  @Autowired
  private SqlSessionTemplate sqlSessionTemplate;
  
  
  @RequestMapping("reviewList")
  public String getReviewList(Model model) {
    ReviewDAO dao = (ReviewDAO)this.sqlSessionTemplate.getMapper(ReviewDAO.class);
    List<ReviewVO> list = dao.list();
    System.out.println(list);
    model.addAttribute("revList", list);
    return "board/reviewList";
  }
  
  @RequestMapping("reviewWrite")
  public String getReviewWrite() {
    return "board/reviewWrite";
  }
  
	/*
	 * @RequestMapping("reviewInsert") public String reviewInsert(ReviewVO reviewVO)
	 * { ReviewDAO dao =
	 * (ReviewDAO)this.sqlSessionTemplate.getMapper(ReviewDAO.class); int n =
	 * dao.insert(reviewVO); return "redirect:/reviewList"; }
	 */
  
    // 작성중  파일 업로드. 확인 중
	/*
	 * @RequestMapping(value="/uploadSummernoteImageFile", method =
	 * RequestMethod.POST , produces = "application/json" )
	 * 
	 * @ResponseBody public JsonObject
	 * uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile)
	 * {
	 * 
	 * JsonObject jsonObject = new JsonObject();
	 * 
	 * String fileRoot = "C:\\summernote_image\\"; //저장될 외부 파일 경로 String
	 * originalFileName = multipartFile.getOriginalFilename(); //오리지날 파일명 String
	 * extension = originalFileName.substring(originalFileName.lastIndexOf("."));
	 * //파일 확장자
	 * 
	 * String savedFileName = UUID.randomUUID() + extension; //저장될 파일 명
	 * 
	 * File targetFile = new File(fileRoot + savedFileName);
	 * 
	 * try { InputStream fileStream = multipartFile.getInputStream();
	 * FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
	 * jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
	 * jsonObject.addProperty("responseCode", "success");
	 * 
	 * } catch (IOException e) { FileUtils.deleteQuietly(targetFile); //저장된 파일 삭제
	 * jsonObject.addProperty("responseCode", "error"); e.printStackTrace(); }
	 * 
	 * return jsonObject; }
	 */
    
    

 
  
 
}
