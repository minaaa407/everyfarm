package kr.co.everyfarm.farmer;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.everyfarm.board.Paging;
import kr.co.everyfarm.payment.PaymentBean;
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

	public void fUpdate(FarmerBean farmerBean);

	public void fDelete(FarmerBean farmerBean);

	public FarmerBean fInfo(FarmerBean farmerBean);

	public int myRate(FarmerBean farmerBean);

	public List<FarmerBean> bestFarmer();

	public List<FarmerBean> listBefore();

	public List<FarmerBean> listAfter();

	public void farmerAdd(FarmerBean farmerBean);

	public List<PaymentBean> paging(Paging paging);

	public int myOrderCount(Paging paging);
}
