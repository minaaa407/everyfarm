package kr.co.everyfarm.board;

import java.util.List;

import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.user.MemberBean;

public interface QnADAO {
	
	public void rownum();
	
	// 게시물 총 갯수
	public int countBoard();
	
	public int countMyqna(MemberBean member);

	// 페이징 처리 게시글 조회
	public List<QnABean> selectBoard(PagingBean vo);
	
	
	public List<QnABean> searchAllPaging(PagingBean vo);
	
	public List<QnABean> searchPnoPaging(PagingBean vo);
	
	public List<QnABean> searchPtitlePaging(PagingBean vo);
	
	public List<QnABean> searchContentPaging(PagingBean vo);
	
	public List<QnABean> searchIdPaging(PagingBean vo);
	
	
	public List<QnABean> searchAllPagingfarmer(PagingBean vo);
	
	public List<QnABean> searchPnoPagingfarmer(PagingBean vo);
	
	public List<QnABean> searchPtitlePagingfarmer(PagingBean vo);
	
	public List<QnABean> searchContentPagingfarmer(PagingBean vo);
	
	public List<QnABean> searchIdPagingfarmer(PagingBean vo);
	
	
	public List<QnABean> list(); 
	
	public List<QnABean> productQlist();
	
	public List<QnAadminBean> adminQlist();
	
	public String productTitle(int pno);
	
	public String productId(int pno);
	

//	public List<String> pnoList();
//	
//	public List<String> titleList();
	
	
	public List<QnABean> productPnoTitleList();
	
	public List<QnABean> productMylist(PagingBean vo);
	
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
	
	public List<QnABean> searchallfarmer(QnABean qna);
	
	public List<QnABean> searchpnofarmer(QnABean qna);
	
	public List<QnABean> searchptitlefarmer(QnABean qna);
	
	public List<QnABean> searchcontentfarmer(QnABean qna);
	
	public List<QnABean> searchIdfarmer(QnABean qna);
	
	//	public List<QnABean> searchEach(QnABean qna);
	
	public int insert(QnABean qna);
	
	public int qnomax();
	
	public int insertAdmin(QnAadminBean qna);
	
	public int update(QnABean qna);
	
	public int updateAdmin(QnAadminBean qna);
	
	public int adminWrite(QnABean qna);
	
	public int delete(int q_No);
	
	public int deleteAdmin(int q_No);
//farmer
//	public List<QnABean> productByfarmer(PagingBean vo);
	
	public List<QnABean> productQlistFarmer(PagingBean vo);
	
	public int farmerWrite(QnABean qna);
	
	public int countfarmerQnaList(FarmerBean farmer);
	
	
	
	
}
