package kr.co.everyfarm.farmer;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.everyfarm.payment.PaymentBean;

@Repository
public interface FarmerDAO {

	public List<FarmerBean> flist();

	public void fjoin(FarmerBean farmerBean);

	public FarmerBean flogin(FarmerBean farmerBean);

	public FarmerBean findId(FarmerBean farmerBean);

	public FarmerBean findPw(FarmerBean farmerBean);

	public void mail(FarmerBean farmerBean);

	public int checkId(FarmerBean farmerBean);

	public void upPw(FarmerBean farmerBean);

	public void fUpdate(FarmerBean farmerBean);

	public void fDelete(FarmerBean farmerBean);

	public FarmerBean fInfo(FarmerBean farmerBean);
	
	
	
	/* 차트 */
	public List<PaymentBean> searchPno(FarmerBean farmerBean);
	
	public PaymentBean seedSum(PaymentBean paymentBan);

}
