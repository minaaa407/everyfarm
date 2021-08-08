package kr.co.everyfarm.user;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	
	public List<MemberVO> mlist();

	public List<MemberVO> flist();
	
	public MemberVO mjoin(MemberVO memberVO);
	
	public MemberVO fjoin(FarmerVO farmerVO);
	
	public MemberVO mlogin(MemberVO memberVO);

	public MemberVO flogin(FarmerVO farmerVO);
	
	
	
	
	
	
	
	// 결제페이지 이용
	public MemberVO userInfo(String userID);

}
