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

	List<AdminBean> alist(Paging paging);

	public void ajoin(AdminBean adminBean);

	public AdminBean alogin(AdminBean adminBean);

	public AdminBean findId(AdminBean adminBean);

	public AdminBean findPw(AdminBean adminBean);

	public void upPw(AdminBean adminBean);

	public int mchart(@Param("i") int i);

	public int fchart(@Param("j") int j);

	int mCount(Paging paging);

	int fCount(Paging paging);

	int aCount(Paging paging);

	public void farmerY(List<String> yes);
	
	public void aDel(@Param("delete") List<String> delete, @Param("i") int i);
}
