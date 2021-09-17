package kr.co.everyfarm.farmer;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.everyfarm.board.Paging;
import kr.co.everyfarm.board.ReviewBean;
import kr.co.everyfarm.payment.PaymentBean;
import kr.co.everyfarm.product.ProductqnaBean;
import kr.co.everyfarm.user.EmailBean;

@Repository
public interface FarmerDAO {

	public List<FarmerBean> flist();

	public void fjoin(FarmerBean farmerBean);

	public FarmerBean flogin(FarmerBean farmerBean);

	public FarmerBean findId(FarmerBean farmerBean);

	public FarmerBean findPw(FarmerBean farmerBean);

	public void mail(EmailBean emailBean);

	public void mailNumber(EmailBean emailBean);

	public int checkId(FarmerBean farmerBean);

	public void upPw(FarmerBean farmerBean);

	public void fDelete(FarmerBean farmerBean);

	public void fDel(List<String> delete);

	public FarmerBean fInfo(FarmerBean farmerBean);

	public int myRate(FarmerBean farmerBean);

	public List<FarmerBean> bestFarmer();

	public void farmerAdd(FarmerBean farmerBean);

	public List<PaymentBean> paging(Paging paging);

	public int myOrderCount(Paging paging);

	public List<PaymentBean> fDelDate(Paging paging);

	public List<ReviewBean> myReply(String f_Id);

	public List<ProductqnaBean> myProdcutReply(String f_Id);

	public void upPwFar(FarmerBean farmerBean);

	public void upAddr(FarmerBean farmerBean);

	public void upName(FarmerBean farmerBean);

	public void upTel(FarmerBean farmerBean);
	
	/* 차트 */
	public List<PaymentBean> searchPno(FarmerBean farmerBean);
	
	public PaymentBean seedSum(PaymentBean paymentBan);

}
