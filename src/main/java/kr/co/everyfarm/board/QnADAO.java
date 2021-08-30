package kr.co.everyfarm.board;

import java.util.List;

import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.user.MemberBean;

public interface QnADAO {
	
	
	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<QnABean> selectBoard(PagingBean vo);
	
	
	public List<QnABean> list(); 
	
	public List<QnABean> productQlist();
	
	public List<QnAadminBean> adminQlist();
	
	public String productTitle(int pno);
	

//	public List<String> pnoList();
//	
//	public List<String> titleList();
	
	
	public List<QnABean> productPnoTitleList();
	
	public List<QnABean> productMylist(MemberBean member);
	
	public List<QnAadminBean> adminMylist(MemberBean member);
	
	public List<QnABean> modifyrecord(int p_No);

	public List<QnAadminBean> modifyAdrecord(int p_No);
	
	public List<QnABean> adminWriteO();
	
	public List<QnABean> adminWriteX();
	
	public List<QnABean> searchall(QnABean qna);
	
	public List<QnABean> searchpno(QnABean qna);
	
	public List<QnABean> searchptitle(QnABean qna);
	
	public List<QnABean> searchcontent(QnABean qna);
	
	public List<QnABean> searchId(QnABean qna);
	
	public List<QnABean> searchEach(QnABean qna);
	
	public int insert(QnABean qna);
	
	public int insertAdmin(QnAadminBean qna);
	
	public int update(QnABean qna);
	
	public int updateAdmin(QnAadminBean qna);
	
	public int adminWrite(QnABean qna);
	
	public int delete(int q_No);
	
	public int deleteAdmin(int q_No);
//farmer
	public List<QnABean> productByfarmer(FarmerBean farmer);
	
	public List<QnABean> productQlistFarmer(List<QnABean> pnoList);
	
	public int farmerWrite(QnABean qna);

	
	
	
	
}
