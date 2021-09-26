package kr.co.everyfarm.board;

import java.util.List;

import kr.co.everyfarm.payment.PaymentBean;
import kr.co.everyfarm.product.ProductBean;

public interface ReviewDAO {

	List<ReviewBean> list(Paging paging); // 페이징
	
	List<ReviewBean> paging(Paging paging); // 페이징 , 리스트
	
	List<ReviewBean> mypaging(Paging paging); // 페이징 , 리스트
	
	List<ReviewBean> mylist(String m_Id); // 마이페이지

	List<ReviewBean> reviewList(); //인덱스
	
	List<ReviewReplyBean> reply(int rev_No);
	
	List<QnABean> myQnAtoFar(String m_Id);
	
	int replyInsert(ReviewReplyBean reviewReplyBean);

	public int insert(ReviewBean reviewBean);

	ReviewBean revDetail(ReviewBean reviewBean);

	void ReadCount(ReviewBean reviewBean);

	int revUpdate(ReviewBean reviewBean);

	int revDelete(ReviewBean reviewBean);
	
	int revCount(Paging paging); //페이징 관련
	
	int farmerReviewscount(String p_Id);
	
	List<PaymentBean> selectpaymentreview(String m_Id);//reveiw 선택된 아이디에 대한 payment
	
	List<ProductBean> selectproductreview(String m_Id);
	
	public int productno(int no);
	
	int adminDel(ReviewBean reviewBean);
	
	List<ReviewBean> farmerReviews(Paging paging);

}
