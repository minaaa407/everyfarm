package kr.co.everyfarm.user;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	
	public List<MemberVO> mlist();

	public List<FarmerVO> flist();
	
	public void mjoin(MemberVO memberVO);
	
	public void fjoin(FarmerVO farmerVO);
	
	public MemberVO mlogin(MemberVO memberVO);

	public FarmerVO flogin(FarmerVO farmerVO);

}
