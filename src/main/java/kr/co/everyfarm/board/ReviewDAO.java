package kr.co.everyfarm.board;

import java.util.List;

public interface ReviewDAO {
	
   public List<ReviewVO> list();
   public int insert(ReviewVO vo);
}
