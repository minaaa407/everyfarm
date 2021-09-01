package kr.co.everyfarm.board;

import java.util.List;

public interface ReviewDAO {

	List<ReviewBean> list();

	List<ReviewBean> mylist(String m_Id);

	List<ReviewBean> reviewList();
	
	List<ReviewReplyBean> reply(int rev_No);
	
	int replyInsert(ReviewReplyBean reviewReplyBean);

	public int insert(ReviewBean reviewBean);

	ReviewBean revDetail(ReviewBean reviewBean);

	void ReadCount(ReviewBean reviewBean);

	int revUpdate(ReviewBean reviewBean);

	int revDelete(ReviewBean reviewBean);


}
