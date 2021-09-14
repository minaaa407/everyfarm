package kr.co.everyfarm.board;

import java.util.List;

public interface ReviewDAO {

	List<ReviewBean> list(Paging paging); // 페이징
	
	List<ReviewBean> paging(Paging paging); // 페이징 , 리스트
	
	List<ReviewBean> mylist(String m_Id); // 마이페이지

	List<ReviewBean> reviewList(); //인덱스
	
	List<ReviewReplyBean> reply(int rev_No);
	
	int replyInsert(ReviewReplyBean reviewReplyBean);

	public int insert(ReviewBean reviewBean);

	ReviewBean revDetail(ReviewBean reviewBean);

	void ReadCount(ReviewBean reviewBean);

	int revUpdate(ReviewBean reviewBean);

	int revDelete(ReviewBean reviewBean);
	
	int revCount(Paging paging); //페이징 관련


}
