package kr.co.everyfarm.product;

import java.util.List;

public interface QnADAO {
	public List<QnABean> list();
	public int insert(QnABean qna);
	public int update(QnABean qna);
	public int delete(int q_No);
}
