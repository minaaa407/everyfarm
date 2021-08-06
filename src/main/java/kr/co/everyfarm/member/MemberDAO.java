package kr.co.everyfarm.member;

import java.util.List;

public interface MemberDAO {
	public List<MemberVO> list();

	public int insert(MemberVO member);

	public int update(MemberVO member);

	public int delete(MemberVO member);
}
