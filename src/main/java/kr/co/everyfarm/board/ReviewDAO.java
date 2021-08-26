package kr.co.everyfarm.board;

import java.util.List;


public interface ReviewDAO  {
	
	 List<ReviewBean> list();
	 List<ReviewBean> mylist(String m_Id);
	 public int insert(ReviewBean reviewBean);
	
	
	 ReviewBean revDetail(ReviewBean reviewBean);
	 void ReadCount(ReviewBean reviewBean);
	 int revUpdate(ReviewBean reviewBean);
	 int revDelete(ReviewBean reviewBean);

}
