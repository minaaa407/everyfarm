package kr.co.everyfarm.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kr.co.everyfarm.board.Paging;
import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.user.MemberBean;

@Repository
public interface AdminDAO {

	List<MemberBean> mlist(Paging paging);

	List<FarmerBean> flist(Paging paging);

	public AdminBean alogin(AdminBean adminBean);

	public int mchart(@Param("i") int i);

	public int fchart(@Param("j") int j);

	int mCount(Paging paging);

	int fCount(Paging paging);

	public void farmerY(List<String> yes);
}
