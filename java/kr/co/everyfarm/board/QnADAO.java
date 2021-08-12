package kr.co.everyfarm.board;

import java.util.List;

import kr.co.everyfarm.user.MemberBean;

public interface QnADAO {
	
	public List<QnABean> list();
	
	public List<QnABean> mylist(MemberBean member);
	
	public List<QnABean> modifyrecord(int p_No);
	
	public int insert(QnABean qna);
	
	public int update(QnABean qna);
	
	public int delete(int q_No);
}
