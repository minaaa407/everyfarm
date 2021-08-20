package kr.co.everyfarm.payment;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PaymentDAO {
	public List<PaymentBean> paylist();

	public List<BpaymentBean> bpaylist();

	public int payinsert(PaymentBean payment);

	public int bpayinsert(BpaymentBean bpayment);

	public int landupdate(@Param("FinalAvailableLand") int FinalAvailableLand, @Param("P_Id") int P_Id);

	public int update(PaymentBean payment);

	public int paydelete(int Orderno);

	public int bpaydelete(int Orderno);

	public Integer getinfo(int p_No);

	public List<PaymentBean> mypaylist();

}
